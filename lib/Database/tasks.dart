class tasks {
  String? title;
  String? description;
  String? data;
  String? time;
  int? id;
  bool? finish;

  tasks({
    required this.title,
    required this.description,
    required this.data,
    required this.time,
    required this.id,
  });
  tasks.fromMap(Map<String, dynamic> Data) {
    id = Data['id'];
    title = Data['title'];
    description = Data['description'];
    data = Data['data'];
    time = Data['time'];
    finish = Data['finish'] == 1 ? true : false;
  }
}
