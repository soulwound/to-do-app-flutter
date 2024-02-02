class ToDo {
  String? id;
  String? toDoText;
  bool isDone;

  ToDo({required this.id, required this.toDoText, this.isDone = false});

  static List<ToDo> toDoList() {
    return [
      ToDo(id: "01", toDoText: "Проверить почту", isDone: true),
      ToDo(id: "02", toDoText: "Подготовка к экзамену"),
      ToDo(id: "03", toDoText: "Сходить в магазин"),
      ToDo(id: "04", toDoText: "Выгулять собаку"),
      ToDo(id: "05", toDoText: "Сделать ToDo App")
    ];
  }
}