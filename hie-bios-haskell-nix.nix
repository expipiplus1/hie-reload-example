let
  haskellNix = import (builtins.fetchTarball
    "https://github.com/input-output-hk/haskell.nix/archive/master.tar.gz") { };
  nixpkgsSrc = (import ./src.nix).nixpkgs;
  # nixpkgsSrc = haskellNix.sources.nixpkgs-1909;
  nixpkgsArgs = haskellNix.nixpkgsArgs;
in { pkgs ? import nixpkgsSrc nixpkgsArgs }:

let
  proj = pkgs.haskell-nix.cabalProject {
    src = (import ./src.nix).hie-bios;
    modules = [{
      nonReinstallablePkgs = [
        "rts"
        "ghc-heap"
        "ghc-prim"
        "integer-gmp"
        "integer-simple"
        "base"
        "deepseq"
        "array"
        "ghc-boot-th"
        "pretty"
        "template-haskell"
        "ghcjs-prim"
        "ghcjs-th"
        "ghc-boot"
        "ghc"
        "Cabal"
        "Win32"
        "array"
        "binary"
        "bytestring"
        "containers"
        "directory"
        "filepath"
        "ghc-boot"
        "ghc-compact"
        "ghc-prim"
        "ghci"
        "haskeline"
        "hpc"
        "mtl"
        "parsec"
        "process"
        "text"
        "time"
        "transformers"
        "unix"
        "xhtml"
        "stm"
        "terminfo"
      ];
    }];
  };

in proj.hie-bios.components.exes.hie-bios
