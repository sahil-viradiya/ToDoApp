// ignore_for_file: prefer_const_constructors

import 'package:cataloge/customeWidget.dart/list_view.dart';
import 'package:cataloge/models/detailsModel.dart';
import 'package:flutter/material.dart';

List<DetailsModel> details = [
  DetailsModel(
      "Iphone 14 Pro max(Purple)",
      "Rs.15000",
      "Rs.15000",
      "https://www.citypng.com/public/uploads/preview/iphone-14-pro-and-max-deep-purple-png-11662587434zacaxkb4sd.png",
      1),
  DetailsModel(
      "Samsung not 10 Plus(Black)",
      "Rs.10000",
      "Rs.15000",
      "https://samsungmobilepress.com/file/1C69605B491DFADD70995BCBF81AD75536A41C03DD57049A03AB21676263ECFDE859034AE66B2AAE472E2E25C3E273DF2D9A74D715837FF870334E0C732BEC5FF74CA486B1880BC6DF483EF69A4F9B15A3B6350264049A1E02485017868810580EF69BC363683A4ADDDFC42FEA75B51F765BAAACF2094677A34E29A49321DAD4D30663247C6FB9183751E37FA25265C7213965B541588A1A8A13571B9EF7706B",
      1),
  DetailsModel(
      "Samsung not 10 Plus(Black)",
      "Rs.10000",
      "Rs.15000",
      "https://samsungmobilepress.com/file/1C69605B491DFADD70995BCBF81AD75536A41C03DD57049A03AB21676263ECFDE859034AE66B2AAE472E2E25C3E273DF2D9A74D715837FF870334E0C732BEC5FF74CA486B1880BC6DF483EF69A4F9B15A3B6350264049A1E02485017868810580EF69BC363683A4ADDDFC42FEA75B51F765BAAACF2094677A34E29A49321DAD4D30663247C6FB9183751E37FA25265C7213965B541588A1A8A13571B9EF7706B",
      1),
  DetailsModel(
      "Samsung not 10 Plus(Black)",
      "Rs.10000",
      "Rs.15000",
      "https://samsungmobilepress.com/file/1C69605B491DFADD70995BCBF81AD75536A41C03DD57049A03AB21676263ECFDE859034AE66B2AAE472E2E25C3E273DF2D9A74D715837FF870334E0C732BEC5FF74CA486B1880BC6DF483EF69A4F9B15A3B6350264049A1E02485017868810580EF69BC363683A4ADDDFC42FEA75B51F765BAAACF2094677A34E29A49321DAD4D30663247C6FB9183751E37FA25265C7213965B541588A1A8A13571B9EF7706B",
      1),
];

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _textcontroller = TextEditingController();
  List<DetailsModel> filter = [];

  @override
  Widget build(BuildContext context) {
    var renderList = _textcontroller.text.isEmpty ? details : filter;

    return Scaffold(
        body: Stack(
      children: [
        // SearchBar(),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                ...renderList
                    .map((DetailsModel e) => ListItem(e, () {
                          details.remove(e);
                        })),
              ],
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 50),
          child: TextField(

            ///search ............
            onSubmitted: (value) {
              filter.clear();
              if (value.isEmpty) {
                setState(() {});
                return;
              }
              setState(() {
                details.forEach((element) {
                  if (element.phoneName.contains(value)) {
                    filter.add(element);
                  }
                });
              });
            },
            controller: _textcontroller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(),
              ),
              fillColor: Colors.grey[200],
              filled: true,
              hintText: 'Search Item',
              hintStyle: TextStyle(
                color: Colors.blueGrey,
              ),
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _textcontroller.clear();
                  });
                },
                icon: Icon(Icons.close),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
