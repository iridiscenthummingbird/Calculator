import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: GridView.count(
              controller: ScrollController(),
              shrinkWrap: true,
              crossAxisCount: 4,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: _createList(),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _createList() {
    List<Widget> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(
        Material(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
          child: InkResponse(
            child: const Center(
                child: Text(
              "5",
              style: TextStyle(fontSize: 50, color: Colors.grey),
            )),
            splashColor: Colors.grey[900],
            highlightColor: Colors.grey[900],
            highlightShape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
          ),
        ),
      );
    }
    for (var i = 0; i < 10; i++) {
      list.add(
        Material(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
          child: InkResponse(
            child: const Center(
                child: Text(
              "+",
              style: TextStyle(fontSize: 50, color: Colors.black),
            )),
            splashColor: Colors.amber[700],
            highlightColor: Colors.amber[700],
            highlightShape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
          ),
        ),
      );
    }
    return list;
  }
}
