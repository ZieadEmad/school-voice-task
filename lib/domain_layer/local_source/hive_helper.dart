import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer';

class HiveHelper {
  static final HiveHelper _instance = HiveHelper._internal();
  static late Box weatherBox;

  factory HiveHelper() {
    return _instance;
  }

  HiveHelper._internal();

  /// Initialize Hive database
  static Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    // Open all required boxes (tables)
    weatherBox = await Hive.openBox('weathers');

    log('Hive database initialized successfully');
  }

  /// Insert data into a specific box (table)
  static Future<void> insertData({required String boxName, required String key, required dynamic value}) async {
    var box = Hive.box(boxName);
    await box.put(key.toLowerCase(), value);
    log("Inserted successfully into $boxName with key: ${key.toLowerCase()}");
  }

  /// Retrieve all data from a box
  static dynamic getAllData({required String boxName}) {
    var box = Hive.box(boxName);
    return box.toMap();
  }

  /// Retrieve specific data by key
  static dynamic getData({required String boxName, required String key}) {
    var box = Hive.box(boxName);
    return box.get(key.toLowerCase());
  }

  /// Update data in a specific box (overwrite existing entry)
  static Future<void> updateData({required String boxName, required String key, required dynamic newValue}) async {
    var box = Hive.box(boxName);
    await box.put(key.toLowerCase(), newValue);
    log("Updated successfully in $boxName for key: ${key.toLowerCase()}");
  }

  /// Delete a specific entry from a box
  static Future<void> deleteData({required String boxName, required String key}) async {
    var box = Hive.box(boxName);
    await box.delete(key.toLowerCase());
    log("Deleted successfully from $boxName with key: ${key.toLowerCase()}");
  }

  /// Delete all entries in a box (Clear the table)
  static Future<void> deleteAllData({required String boxName}) async {
    var box = Hive.box(boxName);
    await box.clear();
    log("All data deleted from $boxName");
  }
}