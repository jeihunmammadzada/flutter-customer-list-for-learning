import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String databaseName = "guide.sqlite" ;

  static Future<Database> connectDatabase() async{
      String databaseRoad = join(await getDatabasesPath(), databaseName);

      if(await databaseExists(databaseRoad)){
        print("Database exists");
      }else{
        ByteData data = await rootBundle.load("database/$databaseName");
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
        await File(databaseRoad).writeAsBytes(bytes,flush:true);
        print("Database copied");
      }

      return openDatabase(databaseRoad);
  }
}