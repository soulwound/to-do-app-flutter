import 'package:flutter/material.dart';
import '/constants/color_constants.dart';
import 'package:to_do_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onToDoDeleted
  }) : super(key: key);

  final ToDo todo;
  final onToDoChanged;
  final onToDoDeleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: (){
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        tileColor: tdLightPink,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Icon(
          todo.isDone? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
          color: tdDarkPurple,
        ),
        title: Text(
          todo.toDoText!,
          style: TextStyle(
              fontSize: 18,
              decoration: todo.isDone? TextDecoration.lineThrough : null
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: tdWhite,
            iconSize: 20,
            icon: const Icon(Icons.delete_forever),
            onPressed:  () {
              onToDoDeleted(todo.id);
            }
          ),
        ),
      )
    );
  }
  
  
}