module Network.Bugsnag.Event.Lens
    (
    -- * Type and construction
      BugsnagEvent
    , bugsnagEvent

    -- * Field lenses
    , exceptionL
    , breadcrumbsL
    , requestL
    , threadsL
    , contextL
    , groupingHashL
    , unhandledL
    , severityL
    , severityReasonL
    , userL
    , appL
    , deviceL
    , metaDataL
    ) where

import Prelude

import Data.Aeson (Value)
import Data.Text (Text)
import Lens.Micro
import Network.Bugsnag.App
import Network.Bugsnag.Breadcrumb
import Network.Bugsnag.Device
import Network.Bugsnag.Event
import Network.Bugsnag.Exception
import Network.Bugsnag.Request
import Network.Bugsnag.Severity
import Network.Bugsnag.Thread
import Network.Bugsnag.User

exceptionL :: Lens' BugsnagEvent BugsnagException
exceptionL = lens beException $ \x y -> x { beException = y }

breadcrumbsL :: Lens' BugsnagEvent (Maybe [BugsnagBreadcrumb])
breadcrumbsL = lens beBreadcrumbs $ \x y -> x { beBreadcrumbs = y }

requestL :: Lens' BugsnagEvent (Maybe BugsnagRequest)
requestL = lens beRequest $ \x y -> x { beRequest = y }

threadsL :: Lens' BugsnagEvent (Maybe [BugsnagThread])
threadsL = lens beThreads $ \x y -> x { beThreads = y }

contextL :: Lens' BugsnagEvent (Maybe Text)
contextL = lens beContext $ \x y -> x { beContext = y }

groupingHashL :: Lens' BugsnagEvent (Maybe Text)
groupingHashL = lens beGroupingHash $ \x y -> x { beGroupingHash = y }

unhandledL :: Lens' BugsnagEvent (Maybe Bool)
unhandledL = lens beUnhandled $ \x y -> x { beUnhandled = y }

severityL :: Lens' BugsnagEvent (Maybe BugsnagSeverity)
severityL = lens beSeverity $ \x y -> x { beSeverity = y }

severityReasonL :: Lens' BugsnagEvent (Maybe BugsnagSeverityReason)
severityReasonL = lens beSeverityReason $ \x y -> x { beSeverityReason = y }

userL :: Lens' BugsnagEvent (Maybe BugsnagUser)
userL = lens beUser $ \x y -> x { beUser = y }

appL :: Lens' BugsnagEvent (Maybe BugsnagApp)
appL = lens beApp $ \x y -> x { beApp = y }

deviceL :: Lens' BugsnagEvent (Maybe BugsnagDevice)
deviceL = lens beDevice $ \x y -> x { beDevice = y }

metaDataL :: Lens' BugsnagEvent (Maybe Value)
metaDataL = lens beMetaData $ \x y -> x { beMetaData = y }
