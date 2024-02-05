import 'package:to_do_app/main.dart';

class ToDo {
  String? id;
  String? toDoText;
  bool isDone;

  ToDo({required this.id, required this.toDoText, this.isDone = false});


  static Future<List<ToDo>> toDoList() async{
    return todos();
  }




  Map<String, dynamic> toMap() {
    return {
      'id': int.parse(id!),
      'name': toDoText,
      'isDone': isDone?1:0,
    };
  }
@override
  String toString() {
    return 'ToDo{id: $id, name: $toDoText, isDone: $isDone}';
  }

}
