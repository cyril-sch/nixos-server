{ ... }: {
  services.httpd = {
    enable = true;
    adminAddr = "admin@example.com";

    extraModules = [ "proxy_fcgi" ];

    virtualHosts."localhost" = {
      documentRoot = "/var/www/html";
      extraConfig = ''
        <Directory /var/www/html>
          Options -Indexes
          AllowOverride All
        </Directory>

        # Passer les .php à PHP-FPM
        <FilesMatch "\.php$">
          SetHandler "proxy:unix:/run/phpfpm/www.sock|fcgi://localhost"
        </FilesMatch>
      '';
    };
  };

  systemd.tmpfiles.rules = [
    "d /var/www/html 0755 wwwrun wwwrun -"
  ];
}