import 'package:flutter/material.dart';
import 'package:shoplist2/shop_list/services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  TextEditingController listcontroller = new TextEditingController();
  TextEditingController collcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Icon(Icons.brush),
            ),
            Text(
              "Adding",
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
      body: ListView(children: [
        Center(
          child: Stack(
            children: [
              Container(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 125.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 25),
                        child: const Text(
                          "Item_Name:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: TextField(
                            controller: listcontroller,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.view_list),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                labelText: "Enter item")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: const Text(
                          "Required",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: TextField(
                            controller: collcontroller,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.shopping_cart),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                labelText: "Enter Content")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: ElevatedButton(
                          child: const Text(
                            'ADD',
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                                color: Colors.deepOrange),
                          ),
                          onPressed: () async {
                            String Id = randomAlphaNumeric(10);
                            Map<String, dynamic> shopinfoMap = {
                              "Item": listcontroller.text,
                              "required": collcontroller.text,
                              "Id": Id,
                            };
                            await databasemethods()
                                .addshoplist(shopinfoMap, Id)
                                .then((Value) {
                              Fluttertoast.showToast(
                                  msg: "Item added successfully",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
