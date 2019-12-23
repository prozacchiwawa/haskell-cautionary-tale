module Aux where

import Prelude
import Control.Monad.IO.Class

import Config

doAuxStuff :: UseAppConfig ()
doAuxStuff = do
  ot <- theOtherThing
  liftIO $ putStrLn $ "Nothing sneaky yet " ++ show ot
