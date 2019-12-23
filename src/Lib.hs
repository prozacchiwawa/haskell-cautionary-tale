module Lib
    ( someFunc
    ) where

import Prelude

import Control.Monad.Trans.Reader
import Data.Text

import Aux
import Config
import Work

someFunc :: IO ()
someFunc = do
  let
    config = Config "foo.txt" 3

  runReaderT doSomeWork config
