enum Flavor {
  lsytodo,
  lsytodo_dev,
  lsytodo_local,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.lsytodo:
        return 'lsyTODO';
      case Flavor.lsytodo_dev:
        return 'lsyTODO_DEV';
      case Flavor.lsytodo_local:
        return 'lsyTODO_LOCAL';
      default:
        return 'title';
    }
  }

  static String get webUrl {
    switch (appFlavor) {
      case Flavor.lsytodo:
        return 'https://lsytodo.web.app/';
      case Flavor.lsytodo_dev:
        return 'https://lsytodo.web.app/';
      case Flavor.lsytodo_local:
        return 'http://192.168.25.55:3000/';
      default:
        return 'https://lsytodo.web.app/';
    }
  }
}
