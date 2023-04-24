import 'package:flutter/material.dart';
import '../model/tadk.dart';

class AddTaskPage extends StatefulWidget {
  final List<Task> undoneTaskList;
  AddTaskPage({required this.undoneTaskList});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスクを追加'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'タイトル',
              ),
            ),
            SizedBox(
                width: 500,
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'タイトル',
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Task newTask = Task(
                            title: titleController.text,
                            isDone: false,
                            createdTime: DateTime.now(),
                            updatedTime: DateTime.now());
                        widget.undoneTaskList.add(newTask);
                        Navigator.pop(context);
                      },
                      child: Text('追加'))),
            )
          ],
        ),
      ),
    );
  }
}
