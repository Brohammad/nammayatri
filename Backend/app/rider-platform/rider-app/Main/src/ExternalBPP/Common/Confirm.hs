module ExternalBPP.Common.Confirm where

import qualified Beckn.ACL.FRFS.Confirm as ACL
import qualified Beckn.ACL.FRFS.Utils as Utils
import BecknV2.OnDemand.Enums
import qualified Domain.Action.Beckn.FRFS.OnConfirm as DOnConfirm
import Domain.Types.BecknConfig
import qualified Domain.Types.FRFSTicketBooking as DBooking
import Domain.Types.Merchant
import Domain.Types.MerchantOperatingCity
import Environment
import qualified ExternalBPP.EBIX.Flow as EBIXFlow
import Kernel.Prelude
import Kernel.Utils.Common
import qualified SharedLogic.CallFRFSBPP as CallFRFSBPP
import qualified Storage.CachedQueries.FRFSConfig as CQFRFSConfig
import Tools.Error
import qualified Tools.Metrics as Metrics

confirm :: Merchant -> MerchantOperatingCity -> BecknConfig -> (Maybe Text, Maybe Text) -> DBooking.FRFSTicketBooking -> Flow ()
confirm merchant merchantOperatingCity bapConfig (mRiderName, mRiderNumber) booking = do
  case (bapConfig.vehicleCategory, bapConfig.provider) of
    (METRO, ONDC) -> do
      fork "FRFS ONDC Confirm Req" $ do
        providerUrl <- booking.bppSubscriberUrl & parseBaseUrl & fromMaybeM (InvalidRequest "Invalid provider url")
        bknConfirmReq <- ACL.buildConfirmReq (mRiderName, mRiderNumber) booking bapConfig booking.searchId.getId Utils.BppData {bppId = booking.bppSubscriberId, bppUri = booking.bppSubscriberUrl} merchantOperatingCity.city
        logDebug $ "FRFS ConfirmReq " <> encodeToText bknConfirmReq
        Metrics.startMetrics Metrics.CONFIRM_FRFS merchant.name booking.searchId.getId merchantOperatingCity.id.getId
        void $ CallFRFSBPP.confirm providerUrl bknConfirmReq merchant.id
    (BUS, EBIX) -> do
      fork "FRFS EBIX Confirm Req" $ do
        frfsConfig <-
          CQFRFSConfig.findByMerchantOperatingCityId merchantOperatingCity.id
            >>= fromMaybeM (InternalError $ "FRFS config not found for merchant operating city Id " <> merchantOperatingCity.id.getId)
        onConfirmReq <- EBIXFlow.confirm merchant merchantOperatingCity frfsConfig bapConfig (mRiderName, mRiderNumber) booking
        processOnConfirm onConfirmReq
    _ -> throwError $ InternalError ("Unsupported FRFS Flow vehicleCategory : " <> show bapConfig.vehicleCategory <> ", provider: " <> show bapConfig.provider)
  where
    processOnConfirm onConfirmReq = do
      (merchant', booking') <- DOnConfirm.validateRequest onConfirmReq
      DOnConfirm.onConfirm merchant' booking' onConfirmReq