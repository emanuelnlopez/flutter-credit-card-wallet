import 'package:json_class/json_class.dart';

class Config {
  Config({
    required this.aesKey,
    required this.blockScreenshots,
    required this.databaseFileName,
  });

  factory Config.fromMap(Map<String, dynamic> map) => Config(
        aesKey: map[_AttributesKeys.aesKey],
        blockScreenshots: JsonClass.parseBool(
          map[_AttributesKeys.blockScreenshots],
        ),
        databaseFileName: map[_AttributesKeys.databaseFileName],
      );

  static final path = 'assets/config.json';

  final String aesKey;
  final bool blockScreenshots;
  final String databaseFileName;
}

abstract class _AttributesKeys {
  static const aesKey = 'aesKey';
  static const blockScreenshots = 'blockScreenshots';
  static const databaseFileName = 'databaseFileName';
}
