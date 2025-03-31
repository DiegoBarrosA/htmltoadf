33333333333333333333333333333333333333333333333333333333333333333333333333333{
  description = "My Rust Application with Nix Flakes";

  inputs = {
    nixpkgs.url =
      "github:nixos/nixpkgs/nixos-unstable"; # You can specify a stable version or branch
    flake-utils.url =
      "github:numtide/flake-utils"; # Optional, for easier flake management
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: {
      packages.default =
        nixpkgs.legacyPackages.${system}.rustPlatform.buildRustPackage {
          pname = "html-to-adf"; 
          version = "0.1.0"; 
          src =
            ./.; # This points to the current directory, which should contain both Cargo.toml and Cargo.lock

          cargoHash = "sha256-XXEfhinGynLlLBTa0rZE0XurATfgF52eBnYQzApr5YI=";
          # buildInputs = [ pkgs.someDependency ];
        };
    });
}
