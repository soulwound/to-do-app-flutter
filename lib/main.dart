import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/screens/home.dart';
import 'package:to_do_app/model/todo.dart';
import 'package:to_do_app/model/db.dart';

late final Future<Database> database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = openDatabase(
    join(await getDatabasesPath(), 'todo.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE todos(id INTEGER PRIMARY KEY, name TEXT, isDone INTEGER)',
      );
    },
    version: 1,
  );
  runApp(MyApp());
}


Future<void> insertToDo(ToDo todo) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the td into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same td is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'todos',
    todo.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> deleteToDo(String id) async {
  final db = await database;

  await db.delete(
    'todos',
    where: 'id = ?',
    whereArgs: [id]
  );
}

Future<void> changeToDoStatus(ToDo todo) async {
  final db = await database;

  await db.update(
    'todos',
    todo.toMap(),
    where: 'id = ?',
    whereArgs: [todo.id],
  );
}

Future<List<ToDo>> todos() async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all The tds.
  final List<Map<String, dynamic>> maps = await db.query('todos');

  // Convert the List<Map<String, dynamic> into a List<tds>.
  return List.generate(maps.length, (i) {
    return ToDo(
      id: maps[i]['id'].toString(),
      toDoText: maps[i]['name'],
      isDone: maps[i]['isDone']==0?false : true,
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'ToDo',
      home: Home(),
    );
  }

}