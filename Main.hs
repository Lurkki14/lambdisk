{-# LANGUAGE OverloadedStrings #-}

import Control.Concurrent (threadDelay)
import Control.Monad
import DBus.Client
import System.Linux.Mount

sayHi :: String -> IO String
sayHi s = return $ "Hi " <> s <> "!"

main = do
  --mount "ramdisk" "/home/jussi/ohj/haskell/lambdisk/testRamdisk" "tmpfs" [] "size=1024m"
  client <- connectSession
  export client "/test" defaultInterface {
    interfaceName = "org.lurkki.test",
    interfaceMethods = [
      autoMethod "Hello" (sayHi "hello")
    ]
  }

  forever $ threadDelay 50000
