module Config where

import Prelude
import Control.Monad.Trans.State.Strict
import Data.Text

data Config =
  Config
    { cfgTheFilename :: Text
    , cfgOtherThing :: Int
    }

-- XXX - Please don't judge me!  Deadline!
type UseAppConfig v = StateT Config IO v

class HasTheFilename m where
  theFilename :: m Text

class HasOtherThing m where
  theOtherThing :: m Int

class ResetTheFilename m where
  resetFilename :: Text -> m ()

instance HasTheFilename (StateT Config IO) where
  theFilename = do
    Config {..} <- get
    pure cfgTheFilename

instance ResetTheFilename (StateT Config IO) where
  resetFilename fn = do
    cfg <- get
    put $ cfg { cfgTheFilename = fn }

instance HasOtherThing (StateT Config IO) where
  theOtherThing = do
    Config {..} <- get
    pure cfgOtherThing

withConfig :: forall x. UseAppConfig x -> Config -> IO x
withConfig action cfg = evalStateT action cfg
