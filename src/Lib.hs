module Lib
    ( someFunc
    ) where

import Prelude
import Data.Text

data Config =
  Config
    { theFilename :: Text
    }

doSomeWork :: Config -> IO ()
doSomeWork cfg@Config {..} = do
  putStrLn $ "The filename is " ++ (unpack theFilename)

  doMoreWork cfg

doMoreWork :: Config -> IO ()
doMoreWork Config {..} = do
  putStrLn $ "More work: " ++ (unpack theFilename)

someFunc :: IO ()
someFunc = do
  let
    config = Config "foo.txt"

  doSomeWork config
