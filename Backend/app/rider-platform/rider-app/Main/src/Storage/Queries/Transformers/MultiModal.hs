module Storage.Queries.Transformers.MultiModal where

import qualified Domain.Types.Location
import Kernel.Prelude
import Kernel.Types.Common
import Kernel.Utils.Common
import qualified Lib.JourneyPlannerTypes
import qualified Storage.Queries.Location as QL
import qualified Storage.Queries.LocationMapping as QLM
import Tools.Error

getFromLocation :: (CacheFlow m r, EsqDBFlow m r, MonadFlow m) => Kernel.Prelude.Text -> m Domain.Types.Location.Location
getFromLocation id = do
  fromLocationMapping <- QLM.getLatestStartByEntityId id >>= fromMaybeM (FromLocationMappingNotFound id)
  fromLocation <- QL.findById fromLocationMapping.locationId >>= fromMaybeM (FromLocationNotFound fromLocationMapping.locationId.getId)
  return fromLocation

getToLocation :: (CacheFlow m r, EsqDBFlow m r, MonadFlow m) => Kernel.Prelude.Text -> m (Kernel.Prelude.Maybe Domain.Types.Location.Location)
getToLocation id = do
  mbToLocationMapping <- QLM.getLatestEndByEntityId id
  toLocation <- maybe (pure Nothing) (QL.findById . (.locationId)) mbToLocationMapping
  return toLocation

mkJourneyLegInfo :: (Kernel.Prelude.Maybe Kernel.Prelude.Text -> Kernel.Prelude.Maybe Kernel.Prelude.Int -> Kernel.Prelude.Maybe Kernel.Prelude.Text -> Kernel.Prelude.Maybe Kernel.Prelude.Int -> Kernel.Prelude.Maybe Kernel.Prelude.Text -> Kernel.Prelude.Maybe Kernel.Prelude.Bool -> Kernel.Prelude.Maybe Lib.JourneyPlannerTypes.JourneySearchData)
mkJourneyLegInfo agency (Just convenienceCost) (Just journeyId) (Just journeyLegOrder) pricingId (Just skipBooking) = Just $ Lib.JourneyPlannerTypes.JourneySearchData {..}
mkJourneyLegInfo _ _ _ _ _ _ = Nothing