rec {
  nixpkgs = builtins.fetchTarball
    "https://github.com/NixOS/nixpkgs/archive/dbacfa172f9a6399f180bcd0aef7998fdec0d55a.tar.gz";
  hie-bios = let pkgs = import nixpkgs { };
  in pkgs.fetchFromGitHub {
    owner = "mpickering";
    repo = "hie-bios";
    rev = "15d855cdefee490ce549c51458580ee4195c559d";
    sha256 = "1n82qw027ff9x9vi9581b3xp0dmcd3n1ada9mdcp322zqjjm6qlj";
  };
}
