## To reproduce

- Correct the path to `idInfo` in src/Bar.hs
- Build hie-bios using the nixpkgs infrastructure
    - `nix-build hie-bios-nixpkgs.nix`
- run './result/bin/hie-bios check src/Foo.hs'
- Observe that the values in `idInfo` are correct
- Build hie-bios using the haskell.nix infrastructure
    - `nix-build hie-bios-haskell.nix.nix`
- run './result/bin/hie-bios check src/Foo.hs'
- Observe that the `idInfo` file contains two different and incorrect infos for `'id`

    ```haskell
      VarI
        GHC.Base.id
        (ForallT
           [ KindedTV a_283470971905 StarT ]
           []
           (AppT (AppT ArrowT (VarT a_283470975585)) (VarT a_283470979073)))
        Nothing
      VarI
        GHC.Base.id
        (ForallT
           [ KindedTV a_283468417361 StarT ]
           []
           (AppT (AppT ArrowT (VarT a_283468412089)) (VarT a_283468395105)))
        Nothing
    ```
