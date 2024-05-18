{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}

import Data.Text (Text, append, pack)
import Data.Text.Encoding (decodeUtf8)
import Blaze.ByteString.Builder (toByteString)
import Network.HTTP.Types (renderQueryText)
import Control.Arrow (second)
import Text.Hamlet (HtmlUrl, hamlet)
import Text.Blaze.Html.Renderer.String (renderHtml)

data MyRoute = Somepage

render::MyRoute -> [(Text, Text)] -> Text
render Somepage params = "/home" `append`
  decodeUtf8 (toByteString $ renderQueryText True (map (second Just) params))

main :: IO ()
main = do
  let currPage = 2 :: Int
  putStrLn $ renderHtml $ [hamlet|
<p>
   You are currently on page #{currPage}.
   <a href=@?{(Somepage, [("page", pack $ show $ currPage - 1)])}>Previous
   <a href=@?{(Somepage, [("page", pack $ show $ currPage + 1)])}>Next
|] render
   
