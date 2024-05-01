{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
import qualified Data.ByteString as S
import Data.ByteString.Char8 ()
import Data.Word (Word8)
import Yesod
data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
|]
  
instance Yesod HelloWorld
getHomeR :: Handler Html
getHomeR = defaultLayout [whamlet|Hello, World!|]

main :: IO ()
main = warp 3000 HelloWorld
