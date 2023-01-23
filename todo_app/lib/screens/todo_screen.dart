// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:todo_app/models/list_model.dart';

class TodoList extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  Function onAdd;

  TodoList(this.onAdd);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              "ADD TASK",
              style: TextStyle(fontSize: 28),
            ),
            Container(
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: TextField(
                controller: _controller,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Type hear......",
                  contentPadding: EdgeInsets.all(16),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        TodoModel models = TodoModel(_controller.text);
                        onAdd(models);
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )))
          ],
        ));
  }
}
