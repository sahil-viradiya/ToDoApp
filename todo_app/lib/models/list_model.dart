class TodoModel {
  late String task, symbol;
  bool complet = false;

  TodoModel(
    this.task,
  ) {
    genrateSymbole();
  }

  genrateSymbole() {
    symbol = task[0];
  }

  bool get completed => complet;
}
