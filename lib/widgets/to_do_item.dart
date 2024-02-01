import 'package:flutter/material.dart';
import '/constants/color_constants.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        print("You just tapped");
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      tileColor: tdLightPink,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Icon(Icons.check_box, color: tdNewYorkPink,),
      title: Text("ToDo task", style: TextStyle(fontSize: 18, decoration: TextDecoration.lineThrough),),
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
          icon: Icon(Icons.delete_forever),
          onPressed:  () {
            print("it cant delete anything for now");
          }
        ),
      ),
    );
  }
  
  
}