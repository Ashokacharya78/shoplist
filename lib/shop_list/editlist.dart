import 'package:flutter/material.dart';

import 'Editcontainer.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              child: Icon(Icons.edit),
            ),
          ),
          Text(
            "Edit",
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.orangeAccent),
          ),
          Text(" Item",
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.blueAccent))
        ],
      )),
      body: MyContainer(),
    );
  }
}
