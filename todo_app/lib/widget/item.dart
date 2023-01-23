// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/models/list_model.dart';

class ToDoItem extends StatefulWidget {
  TodoModel model;
  bool showDone = false;
  Function? onDone;
  ToDoItem(this.model);
  ToDoItem.withDone(this.model, this.onDone);
  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.showDone = !widget.showDone;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 25),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 25)],
        ),
        child: Column(children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.model.completed
                      ? Colors.grey
                      : Colors.orangeAccent.shade100,
                  border: Border.all(
                      color: Color.fromRGBO(232, 232, 232, 1.0), width: 4),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 25)],
                ),
                child: Center(
                  child: Text(
                    widget.model.symbol,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  widget.model.task,
                  style: TextStyle(
                    color: widget.model.completed ? Colors.grey : null,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Spacer(),

              ///Done.....
              if (!widget.model.completed && widget.showDone)
                TextButton.icon(
                    onPressed: () {
                      widget.onDone!();
                    },
                    icon: Icon(Icons.done),
                    label: Text("DONE"))
            ],
          )
        ]),
      ),
    );
  }
}
