{ pkgs ? import (import ./src.nix).nixpkgs { }, compiler ? null }:

let
  src = (import ./src.nix).hie-bios;

  compiler' = if compiler != null then
    compiler
  else
    "ghc" + pkgs.lib.concatStrings
    (pkgs.lib.splitVersion pkgs.haskellPackages.ghc.version);

  # Any overrides we require to the specified haskell package set
  haskellPackages = pkgs.haskell.packages.${compiler'};

  # Any packages to appear in the environment provisioned by nix-shell
  extraEnvPackages = with haskellPackages; [ ];

  # Generate a haskell derivation using the cabal2nix tool on `package.yaml`
  drv = pkgs.haskell.lib.dontCheck (haskellPackages.callCabal2nix "" src { });

in drv

