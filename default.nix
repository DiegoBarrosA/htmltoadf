{ lib, rustPlatform ? import <nixpkgs> {}.rustPlatform }:

rustPlatform.buildRustPackage {
  pname = "htmltoadf"; # Package name from Cargo.toml
  version = "0.1.10";  # Version from Cargo.toml

  src = ./.; # Use the current directory as the source

  # Optionally, you can specify cargoSha256 to pin dependencies
  # cargoSha256 = "sha256-..."; # Uncomment and fill in if you want to pin dependencies

  # If you want to specify additional build flags or features, you can do so here
  # buildFlags = ["--release"]; # Uncomment if you want to build in release mode
}
