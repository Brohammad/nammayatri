{-# OPTIONS_GHC -Wno-orphans #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}

module API.Action.RiderPlatform.Management.NammaTag
  ( API,
    handler,
  )
where

import qualified API.Types.RiderPlatform.Management.NammaTag
import qualified Domain.Action.RiderPlatform.Management.NammaTag
import qualified "lib-dashboard" Domain.Types.Merchant
import qualified "lib-dashboard" Environment
import EulerHS.Prelude
import qualified Kernel.Prelude
import qualified Kernel.Types.APISuccess
import qualified Kernel.Types.Beckn.Context
import qualified Kernel.Types.Id
import Kernel.Utils.Common
import qualified Lib.Yudhishthira.Types
import Servant
import Storage.Beam.CommonInstances ()
import Tools.Auth.Api

type API = ("nammaTag" :> (PostNammaTagTagCreate :<|> PostNammaTagTagUpdate :<|> DeleteNammaTagTagDelete :<|> PostNammaTagQueryCreate :<|> PostNammaTagAppDynamicLogicVerify :<|> GetNammaTagAppDynamicLogic :<|> PostNammaTagRunJob :<|> GetNammaTagTimeBounds :<|> PostNammaTagTimeBoundsCreate :<|> DeleteNammaTagTimeBoundsDelete :<|> GetNammaTagAppDynamicLogicGetLogicRollout :<|> PostNammaTagAppDynamicLogicUpsertLogicRollout :<|> GetNammaTagAppDynamicLogicVersions :<|> GetNammaTagAppDynamicLogicDomains :<|> GetNammaTagQueryAll))

handler :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> Environment.FlowServer API)
handler merchantId city = postNammaTagTagCreate merchantId city :<|> postNammaTagTagUpdate merchantId city :<|> deleteNammaTagTagDelete merchantId city :<|> postNammaTagQueryCreate merchantId city :<|> postNammaTagAppDynamicLogicVerify merchantId city :<|> getNammaTagAppDynamicLogic merchantId city :<|> postNammaTagRunJob merchantId city :<|> getNammaTagTimeBounds merchantId city :<|> postNammaTagTimeBoundsCreate merchantId city :<|> deleteNammaTagTimeBoundsDelete merchantId city :<|> getNammaTagAppDynamicLogicGetLogicRollout merchantId city :<|> postNammaTagAppDynamicLogicUpsertLogicRollout merchantId city :<|> getNammaTagAppDynamicLogicVersions merchantId city :<|> getNammaTagAppDynamicLogicDomains merchantId city :<|> getNammaTagQueryAll merchantId city

type PostNammaTagTagCreate = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('CREATE_NAMMA_TAG) :> API.Types.RiderPlatform.Management.NammaTag.PostNammaTagTagCreate)

type PostNammaTagTagUpdate = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('CREATE_NAMMA_TAG) :> API.Types.RiderPlatform.Management.NammaTag.PostNammaTagTagUpdate)

type DeleteNammaTagTagDelete = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('CREATE_NAMMA_TAG) :> API.Types.RiderPlatform.Management.NammaTag.DeleteNammaTagTagDelete)

type PostNammaTagQueryCreate = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('CREATE_CHAKRA_QUERY) :> API.Types.RiderPlatform.Management.NammaTag.PostNammaTagQueryCreate)

type PostNammaTagAppDynamicLogicVerify = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('APP_DYNAMIC_LOGIC_VERIFY) :> API.Types.RiderPlatform.Management.NammaTag.PostNammaTagAppDynamicLogicVerify)

type GetNammaTagAppDynamicLogic = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('APP_DYNAMIC_LOGIC_VERIFY) :> API.Types.RiderPlatform.Management.NammaTag.GetNammaTagAppDynamicLogic)

type PostNammaTagRunJob = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('RUN_KAAL_CHAKRA_JOB) :> API.Types.RiderPlatform.Management.NammaTag.PostNammaTagRunJob)

type GetNammaTagTimeBounds = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('TIME_BOUNDS) :> API.Types.RiderPlatform.Management.NammaTag.GetNammaTagTimeBounds)

type PostNammaTagTimeBoundsCreate = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('TIME_BOUNDS) :> API.Types.RiderPlatform.Management.NammaTag.PostNammaTagTimeBoundsCreate)

type DeleteNammaTagTimeBoundsDelete = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('TIME_BOUNDS) :> API.Types.RiderPlatform.Management.NammaTag.DeleteNammaTagTimeBoundsDelete)

type GetNammaTagAppDynamicLogicGetLogicRollout =
  ( ApiAuth
      ('APP_BACKEND_MANAGEMENT)
      ('NAMMA_TAG)
      ('APP_DYNAMIC_LOGIC_ROLLOUT)
      :> API.Types.RiderPlatform.Management.NammaTag.GetNammaTagAppDynamicLogicGetLogicRollout
  )

type PostNammaTagAppDynamicLogicUpsertLogicRollout =
  ( ApiAuth
      ('APP_BACKEND_MANAGEMENT)
      ('NAMMA_TAG)
      ('APP_DYNAMIC_LOGIC_ROLLOUT)
      :> API.Types.RiderPlatform.Management.NammaTag.PostNammaTagAppDynamicLogicUpsertLogicRollout
  )

type GetNammaTagAppDynamicLogicVersions = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('APP_DYNAMIC_LOGIC_VERIFY) :> API.Types.RiderPlatform.Management.NammaTag.GetNammaTagAppDynamicLogicVersions)

type GetNammaTagAppDynamicLogicDomains = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('APP_DYNAMIC_LOGIC_VERIFY) :> API.Types.RiderPlatform.Management.NammaTag.GetNammaTagAppDynamicLogicDomains)

type GetNammaTagQueryAll = (ApiAuth ('APP_BACKEND_MANAGEMENT) ('NAMMA_TAG) ('GET_CHAKRA_QUERY) :> API.Types.RiderPlatform.Management.NammaTag.GetNammaTagQueryAll)

postNammaTagTagCreate :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Lib.Yudhishthira.Types.CreateNammaTagRequest -> Environment.FlowHandler Kernel.Types.APISuccess.APISuccess)
postNammaTagTagCreate merchantShortId opCity apiTokenInfo req = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.postNammaTagTagCreate merchantShortId opCity apiTokenInfo req

postNammaTagTagUpdate :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Lib.Yudhishthira.Types.UpdateNammaTagRequest -> Environment.FlowHandler Kernel.Types.APISuccess.APISuccess)
postNammaTagTagUpdate merchantShortId opCity apiTokenInfo req = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.postNammaTagTagUpdate merchantShortId opCity apiTokenInfo req

deleteNammaTagTagDelete :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Kernel.Prelude.Text -> Environment.FlowHandler Kernel.Types.APISuccess.APISuccess)
deleteNammaTagTagDelete merchantShortId opCity apiTokenInfo tagName = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.deleteNammaTagTagDelete merchantShortId opCity apiTokenInfo tagName

postNammaTagQueryCreate :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Lib.Yudhishthira.Types.ChakraQueriesAPIEntity -> Environment.FlowHandler Kernel.Types.APISuccess.APISuccess)
postNammaTagQueryCreate merchantShortId opCity apiTokenInfo req = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.postNammaTagQueryCreate merchantShortId opCity apiTokenInfo req

postNammaTagAppDynamicLogicVerify :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Lib.Yudhishthira.Types.AppDynamicLogicReq -> Environment.FlowHandler Lib.Yudhishthira.Types.AppDynamicLogicResp)
postNammaTagAppDynamicLogicVerify merchantShortId opCity apiTokenInfo req = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.postNammaTagAppDynamicLogicVerify merchantShortId opCity apiTokenInfo req

getNammaTagAppDynamicLogic :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Kernel.Prelude.Maybe (Kernel.Prelude.Int) -> Lib.Yudhishthira.Types.LogicDomain -> Environment.FlowHandler [Lib.Yudhishthira.Types.GetLogicsResp])
getNammaTagAppDynamicLogic merchantShortId opCity apiTokenInfo version domain = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.getNammaTagAppDynamicLogic merchantShortId opCity apiTokenInfo version domain

postNammaTagRunJob :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Lib.Yudhishthira.Types.RunKaalChakraJobReq -> Environment.FlowHandler Lib.Yudhishthira.Types.RunKaalChakraJobRes)
postNammaTagRunJob merchantShortId opCity apiTokenInfo req = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.postNammaTagRunJob merchantShortId opCity apiTokenInfo req

getNammaTagTimeBounds :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Lib.Yudhishthira.Types.LogicDomain -> Environment.FlowHandler Lib.Yudhishthira.Types.TimeBoundResp)
getNammaTagTimeBounds merchantShortId opCity apiTokenInfo domain = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.getNammaTagTimeBounds merchantShortId opCity apiTokenInfo domain

postNammaTagTimeBoundsCreate :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Lib.Yudhishthira.Types.CreateTimeBoundRequest -> Environment.FlowHandler Kernel.Types.APISuccess.APISuccess)
postNammaTagTimeBoundsCreate merchantShortId opCity apiTokenInfo req = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.postNammaTagTimeBoundsCreate merchantShortId opCity apiTokenInfo req

deleteNammaTagTimeBoundsDelete :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Lib.Yudhishthira.Types.LogicDomain -> Kernel.Prelude.Text -> Environment.FlowHandler Kernel.Types.APISuccess.APISuccess)
deleteNammaTagTimeBoundsDelete merchantShortId opCity apiTokenInfo domain name = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.deleteNammaTagTimeBoundsDelete merchantShortId opCity apiTokenInfo domain name

getNammaTagAppDynamicLogicGetLogicRollout :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Kernel.Prelude.Maybe (Kernel.Prelude.Text) -> Lib.Yudhishthira.Types.LogicDomain -> Environment.FlowHandler [Lib.Yudhishthira.Types.LogicRolloutObject])
getNammaTagAppDynamicLogicGetLogicRollout merchantShortId opCity apiTokenInfo timeBound domain = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.getNammaTagAppDynamicLogicGetLogicRollout merchantShortId opCity apiTokenInfo timeBound domain

postNammaTagAppDynamicLogicUpsertLogicRollout :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Lib.Yudhishthira.Types.LogicRolloutReq -> Environment.FlowHandler Kernel.Types.APISuccess.APISuccess)
postNammaTagAppDynamicLogicUpsertLogicRollout merchantShortId opCity apiTokenInfo req = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.postNammaTagAppDynamicLogicUpsertLogicRollout merchantShortId opCity apiTokenInfo req

getNammaTagAppDynamicLogicVersions :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Kernel.Prelude.Maybe (Kernel.Prelude.Int) -> Kernel.Prelude.Maybe (Kernel.Prelude.Int) -> Lib.Yudhishthira.Types.LogicDomain -> Environment.FlowHandler Lib.Yudhishthira.Types.AppDynamicLogicVersionResp)
getNammaTagAppDynamicLogicVersions merchantShortId opCity apiTokenInfo limit offset domain = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.getNammaTagAppDynamicLogicVersions merchantShortId opCity apiTokenInfo limit offset domain

getNammaTagAppDynamicLogicDomains :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Environment.FlowHandler Lib.Yudhishthira.Types.AppDynamicLogicDomainResp)
getNammaTagAppDynamicLogicDomains merchantShortId opCity apiTokenInfo = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.getNammaTagAppDynamicLogicDomains merchantShortId opCity apiTokenInfo

getNammaTagQueryAll :: (Kernel.Types.Id.ShortId Domain.Types.Merchant.Merchant -> Kernel.Types.Beckn.Context.City -> ApiTokenInfo -> Lib.Yudhishthira.Types.Chakra -> Environment.FlowHandler Lib.Yudhishthira.Types.ChakraQueryResp)
getNammaTagQueryAll merchantShortId opCity apiTokenInfo chakra = withFlowHandlerAPI' $ Domain.Action.RiderPlatform.Management.NammaTag.getNammaTagQueryAll merchantShortId opCity apiTokenInfo chakra