module Network.Bugsnag.Lens
    ( HasBugsnagSettings(..)
    , notifyBugsnag
    , suppressBugsnag
    , withBugsnagSettings
    ) where

import Prelude

import Control.Exception (SomeException)
import Control.Monad.Reader
import Lens.Micro
import Lens.Micro.Extras (view)
import qualified Network.Bugsnag.Notify as Notify
import Network.Bugsnag.Settings

class HasBugsnagSettings env where
    bugsnagSettingsL :: Lens' env BugsnagSettings

instance HasBugsnagSettings BugsnagSettings where
    bugsnagSettingsL = id

notifyBugsnag
    :: (MonadIO m, MonadReader env m, HasBugsnagSettings env)
    => SomeException
    -> m ()
notifyBugsnag ex = do
    settings <- asks $ view bugsnagSettingsL
    liftIO $ Notify.notifyBugsnag settings ex

suppressBugsnag :: (MonadReader env m, HasBugsnagSettings env) => m a -> m a
suppressBugsnag = withBugsnagSettings
    $ \settings -> settings { bsIgnoreException = const True }

withBugsnagSettings
    :: (MonadReader env m, HasBugsnagSettings env)
    => (BugsnagSettings -> BugsnagSettings)
    -> m a
    -> m a
withBugsnagSettings f = local (bugsnagSettingsL %~ f)
