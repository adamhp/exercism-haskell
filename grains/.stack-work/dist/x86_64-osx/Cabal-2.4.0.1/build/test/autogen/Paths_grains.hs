{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_grains (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,2,0,6] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/adam/dev/exercism/haskell/grains/.stack-work/install/x86_64-osx/d64766ac63041df4a47604ff558e5841845d6500da1dbb53b972d61c3621fdc2/8.6.5/bin"
libdir     = "/Users/adam/dev/exercism/haskell/grains/.stack-work/install/x86_64-osx/d64766ac63041df4a47604ff558e5841845d6500da1dbb53b972d61c3621fdc2/8.6.5/lib/x86_64-osx-ghc-8.6.5/grains-1.2.0.6-2sBkAEseT9UJEHpwrDrX62-test"
dynlibdir  = "/Users/adam/dev/exercism/haskell/grains/.stack-work/install/x86_64-osx/d64766ac63041df4a47604ff558e5841845d6500da1dbb53b972d61c3621fdc2/8.6.5/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/adam/dev/exercism/haskell/grains/.stack-work/install/x86_64-osx/d64766ac63041df4a47604ff558e5841845d6500da1dbb53b972d61c3621fdc2/8.6.5/share/x86_64-osx-ghc-8.6.5/grains-1.2.0.6"
libexecdir = "/Users/adam/dev/exercism/haskell/grains/.stack-work/install/x86_64-osx/d64766ac63041df4a47604ff558e5841845d6500da1dbb53b972d61c3621fdc2/8.6.5/libexec/x86_64-osx-ghc-8.6.5/grains-1.2.0.6"
sysconfdir = "/Users/adam/dev/exercism/haskell/grains/.stack-work/install/x86_64-osx/d64766ac63041df4a47604ff558e5841845d6500da1dbb53b972d61c3621fdc2/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "grains_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "grains_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "grains_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "grains_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "grains_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "grains_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
