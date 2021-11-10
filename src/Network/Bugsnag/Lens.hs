-- | Experimental Lens-based interface
--
-- Usage
--
-- @
-- data App = App
--   { appBugsnagSettings :: 'BugsnagSettings'
--   , ...
--   }
--
-- instance 'HasBugsnagSettings' App where
--   'bugsnagSettingsL' = lens appBugsnagSettings $ \x y -> { appBugsnagSettings = y }
--
-- loadApp :: IO App
-- loadApp = App
--   <$> ('newBugsnagSettings' <$> getEnv "BUGSNAG_API_KEY")
--   <*> -- ...
--
-- thing :: (MonadIO m, MonadReader App m) => m ()
-- thing = f `catchAny` 'notifyBugsnag'
-- @
--
-- Local adjustments:
--
-- @
-- thingWithReportingDisabled :: (MonadIO m, MonadReader App m) => m ()
-- thingWithReportingDisabled =
--   local ('bugsnagSettingsL' . 'ignoreExceptionL' .~ const True) thing
--
-- thingWithCustomBeforeNotify :: (MonadIO m, MonadReader App m) => m ()
-- thingWithCustomBeforeNotify
--   local ('bugsnagSettingsL' . 'beforeNotifyL' %~ (. 'contextL' ?~ "x")) thing
-- @
--
module Network.Bugsnag.Lens
    ( module Network.Bugsnag.Settings.Lens
    , module Network.Bugsnag.Event.Lens
    , notifyBugsnag
    ) where

import Prelude

import Control.Exception (SomeException)
import Control.Monad.Reader
import Lens.Micro.Extras (view)
import Network.Bugsnag.Event.Lens
import qualified Network.Bugsnag.Notify as Notify
import Network.Bugsnag.Settings.Lens

notifyBugsnag
    :: (MonadIO m, MonadReader env m, HasBugsnagSettings env)
    => SomeException
    -> m ()
notifyBugsnag ex = do
    settings <- asks $ view bugsnagSettingsL
    liftIO $ Notify.notifyBugsnag settings ex
