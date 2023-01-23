// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/models/list_model.dart';
import 'package:todo_app/screens/todo_screen.dart';
import 'package:todo_app/widget/item.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> item = [
    TodoModel("i am sahil viradiya ,currently i am purshing flutter devloper"),
    TodoModel("i am nehil viradiya ,currently i am purshing flutter devloper"),
  ];

  TextEditingController _controller = TextEditingController();

  List<TodoModel> filterList = [];

  @override
  Widget build(BuildContext context) {
    var renderlist = _controller.text.isEmpty ? item : filterList;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 16),
                    ],
                  ),

                  //textfeild
                  child: TextField(
                    ///onchanged
                    onChanged: (value) {
                      if (_controller.text.isNotEmpty) {
                        setState(() {});
                      }
                    },

                    //onsubmitted.....
                    onSubmitted: (value) {
                      setState(() {
                        filterList.clear();
                        if (value.isEmpty) {
                          return;
                        }

                        item.forEach((element) {
                          if (element.task.contains(value)) {
                            filterList.add(element);
                          }
                        });
                      });
                    },

                    controller: _controller,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),

                        ///Close button..
                        suffixIcon: IconButton(
                          onPressed: () {
                            _controller.text = "";
                          },
                          icon: Icon(Icons.close),
                        ),
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        hintText: "Search Text"),
                  ),
                ),

                //render list....

                ...renderlist.map((TodoModel e) => !e.completed
                    ? ToDoItem.withDone(e, () {
                        setState(() {
                          e.complet = true;
                        });
                      })
                    : SizedBox()),

                if (_controller.text.isEmpty) ...[
                  SizedBox(
                    height: 28,
                  ),
                  Text("Already Completed"),
                  Divider(
                    color: Colors.black26,
                  ),
                ],
                ...renderlist.map(
                    (TodoModel e) => e.completed ? ToDoItem(e) : SizedBox()),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoList((TodoModel model) {
                setState(() {
                  item = [model, ...item];
                });
              }),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
