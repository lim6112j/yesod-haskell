{-# LANGUAGE QuasiQuotes #-}
import Text.Lucius
import qualified Data.Text.Lazy.IO as TLIO

render :: a
render = undefined

transition :: ToCss p => p -> Mixin
transition val =
  [luciusMixin|
     -webkit-transition: #{val};
     -moz-transition: #{val};
     -ms-transition: #{val};
     -o-transition: #{val};
     transition: #{val}; |]
myCSS :: p -> Css
myCSS = [lucius|
               .some-class {
               ^{transition "all 4s ease"}
               }
|]

main :: IO ()
main = TLIO.putStrLn $ renderCss $ myCSS render
