{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
import Yesod
data App = App
mkYesod "App" [parseRoutes|
/ HomeR GET
|]
instance Yesod App
-- json
getHomeR :: HandlerFor App Value
getHomeR = return $ object ["msg" .= ("Hello, World" :: String)]
main :: IO ()
main = warp 3000 App
