{ mkDerivation, base, dbus, linux-mount, stdenv }:
mkDerivation {
  pname = "lambdisk";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base dbus linux-mount ];
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
