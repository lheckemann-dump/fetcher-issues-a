{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    test1 = {
      url = "git+https://github.com/lheckemann-dump/fetcher-issues-b.git";
    };
    test2 = {
      url = "git+https://github.com/lheckemann-dump/fetcher-issues-b.git";
      flake = false;
    };
    test3 = {
      url = "github:lheckemann-dump/fetcher-issues-b";
    };
    test4 = {
      url = "github:lheckemann-dump/fetcher-issues-b";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux = nixpkgs.lib.mapAttrs (name: value: import value { inherit (pkgs) path runCommandNoCC; }) inputs;
  };
}
