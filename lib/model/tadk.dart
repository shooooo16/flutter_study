class Task{
  String title;
  bool isDone;
  DateTime  createdTime;
  DateTime  updatedTime;

  Task({required this.title, this.isDone = false,required this.createdTime, required this.updatedTime});
}