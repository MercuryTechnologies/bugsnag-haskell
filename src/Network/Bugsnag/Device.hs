{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Network.Bugsnag.Device
    ( Bytes(..)
    , BugsnagDevice(..)
    , bugsnagDevice
    ) where

import Data.Aeson
import Data.Aeson.Ext
import Data.Text (Text)
import Data.Version
import GHC.Generics
import Numeric.Natural

newtype Bytes = Bytes Natural deriving ToJSON

data BugsnagDevice = BugsnagDevice
    { bdHostname :: Maybe Text
    , bdId :: Maybe Text
    , bdManufacturer :: Maybe Text
    , bdModel :: Maybe Text
    , bdModelNumber :: Maybe Text
    , bdOsName :: Maybe Text
    , bdOsVersion :: Maybe Version
    , bdFreeMemory :: Maybe Bytes
    , bdTotalMemory :: Maybe Bytes
    , bdFreeDisk :: Maybe Bytes
    , bdBrowserName :: Maybe Text
    , bdBrowserVersion :: Maybe Version
    , bdJailBroken :: Maybe Bool
    , bdOrientation :: Maybe Text
    }
    deriving Generic

instance ToJSON BugsnagDevice where
    toJSON = genericToJSON $ bsAesonOptions "bd"
    toEncoding = genericToEncoding $ bsAesonOptions "bd"

bugsnagDevice :: BugsnagDevice
bugsnagDevice = BugsnagDevice
    { bdHostname = Nothing
    , bdId = Nothing
    , bdManufacturer = Nothing
    , bdModel = Nothing
    , bdModelNumber = Nothing
    , bdOsName = Nothing
    , bdOsVersion = Nothing
    , bdFreeMemory = Nothing
    , bdTotalMemory = Nothing
    , bdFreeDisk = Nothing
    , bdBrowserName = Nothing
    , bdBrowserVersion = Nothing
    , bdJailBroken = Nothing
    , bdOrientation = Nothing
    }
