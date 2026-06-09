{ pkgs, ... }: {
  services.phpfpm.pools.www = {
    user = "wwwrun";
    group = "wwwrun";
    settings = {
      "pm" = "dynamic";
      "pm.max_children" = 32;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 2;
      "pm.max_spare_servers" = 8;
      "listen.owner" = "wwwrun";
      "listen.group" = "wwwrun";
    };
  };

  # Extensions courantes — adapter selon l'appli
  environment.systemPackages = with pkgs; [
    php
    php.extensions.pdo
    php.extensions.pdo_mysql
    php.extensions.mbstring
    php.extensions.curl
    php.extensions.gd
    php.extensions.zip
    php.extensions.opcache
  ];
}