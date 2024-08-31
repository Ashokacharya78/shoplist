import 'package:flutter/material.dart';

import 'Editcontainer.dart';
import 'coll.dart';
import 'package:shoplist2/shop_list/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'editlist.dart';

class home_shop extends StatefulWidget {
  const home_shop({super.key});

  @override
  State<home_shop> createState() => _home_shopState();
}

class _home_shopState extends State<home_shop> {
  Stream? shopStream;

  getontheload() async {
    shopStream = await databasemethods().getlistdetails();
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget alllistdetails() {
    return StreamBuilder(
        stream: shopStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Material(
                          elevation: 4.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                              margin: EdgeInsets.all(0.0),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.only(bottom: 10, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Item: " + ds["Item"],
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  Text(
                                    "required: " + ds["required"],
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        child: Icon(
                                          Icons.edit,
                                        ),
                                        onTap: () {
                                          MyContainer();
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Icon(Icons.favorite_outline)
                                    ],
                                  )
                                ],
                              ))),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Icon(Icons.shopping_bag),
            ),
            Text(
              "Shopping",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            Text(
              "_List",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Column(
          children: [Expanded(child: alllistdetails())],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const Intro()),
          );
        },
      ),
    );
  }
}
