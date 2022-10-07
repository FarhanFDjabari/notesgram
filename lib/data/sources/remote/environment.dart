class Environments {
  static const String PRODUCTION = '';
  static const String DEV = 'https://alfonsushosting.my.id';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.DEV;
  static const List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.DEV,
      'url': 'https://alfonsushosting.my.id',
    },
    {
      'env': Environments.PRODUCTION,
      'url': '',
    },
  ];

  static String? getEnvironments() {
    return _availableEnvironments
        .firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )
        .values
        .last
        .toString();
  }
}
