module Config where

import Prelude
import Control.Monad.Trans.Reader
import Data.Text

data Config =
  Config
    { cfgTheFilename :: Text
    , cfgOtherThing :: Int
    }

type UseAppConfig v = ReaderT Config IO v

class HasTheFilename m where
  theFilename :: m Text

class HasOtherThing m where
  theOtherThing :: m Int

instance HasTheFilename (ReaderT Config IO) where
  theFilename = asks cfgTheFilename

instance HasOtherThing (ReaderT Config IO) where
  theOtherThing = asks cfgOtherThing

withConfig :: UseAppConfig x -> Config -> IO x
withConfig = runReaderT
