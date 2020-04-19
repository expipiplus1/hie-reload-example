{-# language TemplateHaskellQuotes #-}

module Bar
  where

import Language.Haskell.TH

idInfo :: Q [Dec]
idInfo = do
  idInfo1 <- reify 'id
  idInfo2 <- reify 'id
  runIO $ writeFile "/home/j/projects/bugs/hie-reload-example/idInfo"
                    (unlines [show idInfo1, show idInfo2, show (idInfo1 == idInfo2)])
  pure []
