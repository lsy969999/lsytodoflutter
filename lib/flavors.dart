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
}
