// config_dev.dart

class Developer {
  String env = const String.fromEnvironment('ENV', defaultValue: 'dev');

  String apiUrl() {
    switch (env) {
      case 'dev':
        return "http://176.24.7.231:3000";
      case 'qa':
        return "http://176.24.7.119:2002";
      case 'preprod':
        return "https://api.mexablock.softnet.mx";
      default:
        return "http://176.24.7.41:3000";
    }
  }
}
