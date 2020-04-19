{-# language TemplateHaskellQuotes #-}

module Bar
  where

import Language.Haskell.TH

idInfo :: Q [Dec]
idInfo = do
  idInfo <- reify 'id
  runIO $ writeFile "/home/j/projects/bugs/hie-reload-example/idInfo" (show idInfo)
  pure []
