import 'package:flutter/material.dart';
import 'package:shoplist2/shop_list/services/database.dart';

class MyContainer extends StatefulWidget {
  const MyContainer({super.key});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  TextEditingController listcontroller = new TextEditingController();
  TextEditingController collcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          " Edit Item_Name:",
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
                              child: Text(
                                'Update',
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.redAccent),
                              ),
                              onPressed: () async {
                                Map<String, dynamic> updateinfo = {
                                  "Item": listcontroller.text,
                                  "required": collcontroller.text,
                                  "Id": id
                                };
                                await databasemethods()
                                    .updateshoplist(id, updateinfo)
                                    .then((value) {
                                  Navigator.pop(context);
                                });
                              })),
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
