module Network.Bugsnag.Settings.Lens
    (
    -- * Reader access
      HasBugsnagSettings(..)

    -- * Type and construction
    , BugsnagSettings
    , newBugsnagSettings
    , bugsnagSettings

    -- * Field lenses
    , apiKeyL
    , appVersionL
    , releaseStageL
    , notifyReleaseStagesL
    , beforeNotifyL
    , ignoreExceptionL
    , httpManagerL
    , codeIndexL
    ) where

import Prelude

import Data.Text (Text)
import Lens.Micro
import Network.Bugsnag.BeforeNotify
import Network.Bugsnag.CodeIndex
import Network.Bugsnag.Exception
import Network.Bugsnag.ReleaseStage
import Network.Bugsnag.Settings
import Network.HTTP.Client (Manager)

class HasBugsnagSettings env where
    bugsnagSettingsL :: Lens' env BugsnagSettings

instance HasBugsnagSettings BugsnagSettings where
    bugsnagSettingsL = id

apiKeyL :: Lens' BugsnagSettings BugsnagApiKey
apiKeyL = lens bsApiKey $ \x y -> x { bsApiKey = y }

appVersionL :: Lens' BugsnagSettings (Maybe Text)
appVersionL = lens bsAppVersion $ \x y -> x { bsAppVersion = y }

releaseStageL :: Lens' BugsnagSettings BugsnagReleaseStage
releaseStageL = lens bsReleaseStage $ \x y -> x { bsReleaseStage = y }

notifyReleaseStagesL :: Lens' BugsnagSettings [BugsnagReleaseStage]
notifyReleaseStagesL =
    lens bsNotifyReleaseStages $ \x y -> x { bsNotifyReleaseStages = y }

beforeNotifyL :: Lens' BugsnagSettings BeforeNotify
beforeNotifyL = lens bsBeforeNotify $ \x y -> x { bsBeforeNotify = y }

ignoreExceptionL :: Lens' BugsnagSettings (BugsnagException -> Bool)
ignoreExceptionL = lens bsIgnoreException $ \x y -> x { bsIgnoreException = y }

httpManagerL :: Lens' BugsnagSettings Manager
httpManagerL = lens bsHttpManager $ \x y -> x { bsHttpManager = y }

codeIndexL :: Lens' BugsnagSettings (Maybe CodeIndex)
codeIndexL = lens bsCodeIndex $ \x y -> x { bsCodeIndex = y }
