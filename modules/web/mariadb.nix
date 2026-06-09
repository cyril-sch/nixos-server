{ pkgs, ... }: {
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    settings = {
      mysqld = {
        # Écouter uniquement en local
        bind-address = "127.0.0.1";
        character-set-server = "utf8mb4";
        collation-server = "utf8mb4_unicode_ci";
      };
    };
  };
}