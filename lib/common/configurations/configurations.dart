import 'default_env.dart';

class Configurations {
  static String _host = DefaultConfig.host;
  static String _subHost = DefaultConfig.subHost;
  static String _imageUrl = DefaultConfig.imageUrl;
  static String _key = DefaultConfig.key;



  Future<void> setConfigurationValues(Map<String, dynamic> value) async {
    _host =  value['host'] ?? DefaultConfig.host;
    _subHost =  value['sub_host'] ?? DefaultConfig.host;
    _imageUrl = value['image_url'] ?? DefaultConfig.imageUrl;
    _key = value['key'] ?? DefaultConfig.key;
     }

  static String get host => _host;

  static String get subHost => _subHost;

  static String get imageUrl => _imageUrl;

  static String get key => _key;

}
