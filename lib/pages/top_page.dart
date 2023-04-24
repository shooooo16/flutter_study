import 'package:flutter/material.dart';
import 'package:flutter_application/pages/undone_task_page.dart';
import '../model/tadk.dart';
import 'add_task_page.dart';
import 'done_task_page.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key, required this.title});
  final String title;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<Task> undoneTaskList = [
    Task(
        title: '宿題',
        isDone: false,
        createdTime: DateTime.now(),
        updatedTime: DateTime.now()),
    Task(
        title: '買い出し',
        isDone: false,
        createdTime: DateTime.now(),
        updatedTime: DateTime.now()),
  ];

  List<Task> doneTaskList = [];

  bool showUndoneTaskPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 146, 225, 232),
        title: const Text('Flutter × Firebase for Web'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          showUndoneTaskPage
              ? UndoneTaskPage(
                  undoneTaskList: undoneTaskList,
                  doneTaskList: doneTaskList,
                )
              : DoneTaskPage(
                  undoneTaskList: undoneTaskList,
                  doneTaskList: doneTaskList,
                ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      showUndoneTaskPage = true;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    color: Colors.redAccent,
                    child: const Text('未完了タスク',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      showUndoneTaskPage = false;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    color: Colors.greenAccent,
                    child: const Text('完了タスク',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTaskPage(
                        undoneTaskList: undoneTaskList,
                      )));
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
