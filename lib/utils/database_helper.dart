// import 'package:image_picker/image_picker.dart';
// ignore_for_file: depend_on_referenced_packages

import 'package:cameraapp/models/class_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  //single instance creation
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String DataTable = 'Data_table';
  String colId = 'id';
  String colPhoto = 'imagePath';

//named constructor for single instance
  DatabaseHelper._createInstance();
// Factory constructor to return the singleton instance
  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }
//getter fun
  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  //initialize db

  Future<Database> initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'Datas.db');

    var DatasDatabase =
    await openDatabase(path, version: 1, onCreate: _createDb,);
    return DatasDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $DataTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colPhoto TEXT)');
  }

//read
  Future<List<Map<String, dynamic>>> getDataMapList() async {
    Database db = await database;
    var result = await db.query(DataTable, orderBy: '$colId ASC');
    return result;
  }
  Future<List<Data>> getDataList() async {
    var DataMapList = await getDataMapList();
    int count = DataMapList.length;

    List<Data> DataList = [];
    for (int i = 0; i < count; i++) {
      DataList.add(Data.fromMapObject(DataMapList[i]));
    }

    return DataList;
  }

//create
  Future<int> insertData(Data Data) async {
    Database db = await database;
    var result = await db.insert(DataTable, Data.toMap());
    return result;
  }

  // Future<int> updateData(Data Data) async {
  //   Database db = await database;
  //   var result = await db.update(DataTable, Data.toMap(),
  //       where: '$colId = ?', whereArgs: [Data.id]);
  //   return result;
  // }

  Future<int> deleteData(int id) async {
    Database db = await database;
    var result =
    await db.rawDelete('DELETE FROM $DataTable WHERE $colId = $id');
    return result;
  }
}
