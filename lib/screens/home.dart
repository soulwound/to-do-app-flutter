import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/to_do_item.dart';
import '/constants/color_constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdWhite,
      appBar: _buildAppBar(),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Container(
              child: Text("Дела на сегодня", style: TextStyle(fontSize: 30),),
              margin: EdgeInsets.all(10),
            ),
            ToDoItem()
          ],
        ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      //elevation: 0,
      backgroundColor: tdFalcon,
      title: Center(
          child: Text(
            "My ToDo App", style: TextStyle(
              color: tdWhite
            ),
          )
      ),
    );
  }
}