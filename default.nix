self: super: {
  openssl = {
    "1.0.2" = super.stdenv.mkDerivation {
      pname = "openssl";
      version = "1.0.2";

      src = super.fetchFromGitHub {
        owner = "openssl";
        repo = "openssl";
        rev = "OpenSSL_1_0_2";
        sha256 = "sha256-so3qv87ph1mA3LMi4zOQ2hOlo9DApbuQc33GSWnBl/E=";
      };

      buildInputs = with super.pkgs; [ perl ];

      buildPhase = ''
        ./config --prefix=$out
        make
      '';

      installPhase = ''
        make install
      '';
    };
  };
}
