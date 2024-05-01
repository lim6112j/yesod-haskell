{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

module Main (main) where

import qualified Data.ByteString as S
import Data.ByteString.Char8 ()
import Data.Word (Word8)
import Lib

class SafeHead a where
  type Inner a
  safeHead :: a -> Maybe (Inner a)

instance SafeHead [a] where
  type Inner [a] = a
  safeHead [] = Nothing
  safeHead (x : _) = Just x

instance SafeHead S.ByteString where
  type Inner S.ByteString = Word8
  safeHead bs
    | S.null bs = Nothing
    | otherwise = Just $ S.head bs

main :: IO ()
main = do
  print $ safeHead ("" :: String)
  print $ safeHead ("Hello" :: String)
  print $ safeHead ("" :: S.ByteString)
  print $ safeHead ("hello" :: S.ByteString)
