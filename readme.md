## To reproduce

- Correct the path to `idInfo` in src/Bar.hs
- run 'hie src/Foo.hs'
- Observe that the `idInfo` file contains an incorrect info for `'id`

    ```haskell
    VarI
      GHC.Base.id
      (ForallT
         [ KindedTV a_283471583961 StarT ]
         []
         (AppT (AppT ArrowT (VarT a_283471527513)) (VarT a_283472381705)))
      Nothing
    ```
