{ ... }: {
  time.timeZone = "Europe/Paris";

  i18n = {
    defaultLocale = "fr_FR.UTF-8";
    extraLocaleSettings = {
      LC_ALL = "fr_FR.UTF-8";
    };
  };

  console.keyMap = "fr";
}