class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Apple', isDone: true),
      ToDo(id: '02', todoText: 'Grapes', isDone: true),
      ToDo(id: '03', todoText: 'Cucumber',),
      ToDo(id: '04', todoText: 'Chicken',),
      ToDo(id: '05', todoText: 'Pepper',),
      ToDo(id: '06', todoText: 'Noodle', isDone: true),
      ToDo(id: '07', todoText: 'Pasta', isDone: true),
    ];
  }
}

