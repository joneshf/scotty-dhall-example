{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE PackageImports      #-}
{-# LANGUAGE ScopedTypeVariables #-}

import "base" Control.Monad.IO.Class (liftIO)
import "dhall" Dhall                 (Text, auto, input)
import "scotty" Web.Scotty           (get, html, param, scotty)

main :: IO ()
main = scotty 3000 $ do
  get "/:word" $ do
    template <- liftIO $ input auto "./index.dhall"
    beam :: Text <- param "word"
    html $ template beam
