class TodosModel {
  late final int id;
  late final String title;
  late final bool isCompleted;

  TodosModel(
      {required this.id, required this.title, required this.isCompleted});

  factory TodosModel.fromJson(Map<String, dynamic> data) {
    return TodosModel(
      id: data["id"],
      title: data["title"],
      isCompleted: data["completed"],
    );
  }
}
