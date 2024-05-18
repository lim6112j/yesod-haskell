{-# LANGUAGE QuasiQuotes, OverloadedStrings #-}
import Data.Text (Text)
import Text.Shakespeare.Text
import Control.Monad (forM_)
import qualified Data.Text.Lazy.IO as TLIO

data Item = Item
  { itemName :: Text
  , itemQty :: Int
  }
items :: [Item]
items =
  [ Item "apples" 5
  , Item "bananas" 10
  ]
main :: IO ()
main = forM_ items $ \item -> TLIO.putStrLn
  [lt|You have #{show $ itemQty item} #{itemName item}.|]
    
