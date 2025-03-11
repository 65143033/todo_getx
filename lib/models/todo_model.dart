class TodoModel {
  String title;
  String subtitle;
  bool isDone;
  TodoModel(this.title, this.subtitle, this.isDone);

  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'isDone': isDone,
  };
}
