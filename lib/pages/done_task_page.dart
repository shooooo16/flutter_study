import 'package:flutter/material.dart';
import '../model/tadk.dart';

class DoneTaskPage extends StatefulWidget {
  final List<Task> undoneTaskList;
  final List<Task> doneTaskList;

  DoneTaskPage({required this.undoneTaskList, required this.doneTaskList});

  @override
  State<DoneTaskPage> createState() => _DoneTaskPageState();
}

class _DoneTaskPageState extends State<DoneTaskPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(widget.doneTaskList[index].title),
          value: widget.doneTaskList[index].isDone,
          onChanged: (bool? val) {
            widget.doneTaskList[index].isDone = val!;
            widget.undoneTaskList.add(widget.doneTaskList[index]);
            widget.doneTaskList.removeAt(index);
            setState(() {});
          },
        );
      },
      itemCount: widget.doneTaskList.length,
    );
  }
}
