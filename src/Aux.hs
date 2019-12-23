module Aux where

import Prelude
import Control.Monad.IO.Class
import Data.Text

import Config

doAuxStuff :: UseAppConfig ()
doAuxStuff = do
  -- XXX - I feel bad about this but FML they want it before the demo (2 hours!!!)
  fn' <- theFilename
  resetFilename $ pack $ "pathchange/" ++ unpack fn'

  fn <- theFilename
  ot <- theOtherThing
  liftIO $ putStrLn $ "Sneaky " ++ show ot ++ " but " ++ unpack fn
