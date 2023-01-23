// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cataloge/screens/homescreen.dart';
import 'package:cataloge/models/detailsModel.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final DetailsModel model;
  Function toRemove;

  ListItem(this.model, this.toRemove);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(blurRadius: 26, color: Colors.black12)]),
      child: Column(children: [
        Row(
          children: [
            Container(
              // alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(top: 15, left: 12, right: 25),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(blurRadius: 26, color: Colors.black12),
                ],
                border: Border.all(
                  width: 4,
                  color: Colors.grey.shade300,
                  style: BorderStyle.solid,
                ),
                image: DecorationImage(
                    image: NetworkImage(
                      widget.model.image,
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    widget.model.phoneName,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.model.price,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.model.DiscountPrice,
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(
                    height: 42,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 70),
                    // padding: EdgeInsets.all(8),
                    // height: 25,
                    // width: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.transparent)),
                            onPressed: widget.model.count > 1
                                ? () {
                                    setState(() {
                                      if (widget.model.count > 1) {
                                        widget.model.count--;
                                      }
                                    });
                                  }
                                : null,
                            child: SizedBox(
                              width: 50,
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 25,
                          height: 20,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Center(
                            child: Text(
                              widget.model.count.toString(),
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 30,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.transparent)),
                            onPressed: widget.model.count < 5
                                ? () {
                                    setState(() {
                                      widget.model.count++;
                                    });
                                  }
                                : null,
                            child: Text(
                              "+",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 30),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () => widget.toRemove(),
                  child: Text(
                    "Remove",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
