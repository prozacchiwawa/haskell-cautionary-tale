module Work where

import Prelude
import Control.Monad.IO.Class
import Data.Text

import Aux
import Config

doSomeWork :: UseAppConfig ()
doSomeWork = do
  fn <- theFilename
  liftIO $ putStrLn $ "The filename is " ++ (unpack fn)

  doAuxStuff

  doMoreWork

doMoreWork :: UseAppConfig ()
doMoreWork = do
  fn <- theFilename
  liftIO $ putStrLn $ "More work: " ++ (unpack fn)
