class Todo {
  String? id;
  String? todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<Todo> todoList() {
    return [
      Todo(id: '01', todoText: 'Yo back', isDone: true),
      Todo(id: '02', todoText: 'By the stuff', isDone: true),
      Todo(id: '01', todoText: 'Check all the mails', isDone: true),
      Todo(id: '01', todoText: 'Work fast', isDone: true),
      Todo(id: '01', todoText: 'No cap', isDone: true),
    ];
  }
}
