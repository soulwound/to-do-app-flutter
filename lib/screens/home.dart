import 'package:flutter/material.dart';
import 'package:to_do_app/model/todo.dart';
import 'package:to_do_app/widgets/to_do_item.dart';
import '/constants/color_constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.toDoList();
  final _toDoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdWhite,
      appBar: _buildAppBar(),
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.all(10),
              children: [
                Container(
                  child: Text("Дела на сегодня", style: TextStyle(fontSize: 30),),
                  margin: EdgeInsets.all(10),
                ),
                for (ToDo item in todosList)
                  ToDoItem(
                      todo: item,
                      onToDoChanged: _handleToDoChange,
                      onToDoDeleted: _deleteToDo,
                  ),
                Container(
                  padding: const EdgeInsets.only(bottom: 70),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 20,
                            right: 20,
                            left: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5
                        ),
                        decoration: BoxDecoration(
                        color: tdWhite,
                          boxShadow: const [
                            BoxShadow(
                              color: tdEunry,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextField(
                          controller: _toDoController,
                          decoration: const InputDecoration(
                            hintText: "Что еще нужно сделать?",
                            border: InputBorder.none
                          ),
                        ),
                       )

                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20
                    ),
                    child: ElevatedButton(
                      onPressed:() {
                        _addToDo(_toDoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: tdDarkPurple,
                        minimumSize: Size(60, 60),
                        elevation: 10,
                      ),
                      child: const Text("+", style: TextStyle(
                        fontSize: 40,
                        color: tdWhite
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDo(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDo(String toDo) {
    setState(() {
      todosList.add(
          ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(),
              toDoText: toDo)
      );
    });
    _toDoController.clear();
  }

  AppBar _buildAppBar() {
    return AppBar(
      //elevation: 0,
      backgroundColor: tdFalcon,
      title: const Center(
          child: Text(
            "My ToDo App", style: TextStyle(
              color: tdWhite
            ),
          )
      ),
    );
  }
}