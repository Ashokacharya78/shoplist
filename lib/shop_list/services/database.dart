import 'package:cloud_firestore/cloud_firestore.dart';

class databasemethods {
  Future addshoplist(Map<String, dynamic> shopinfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("shoplist")
        .doc(id)
        .set(shopinfoMap);
  }

  Future<Stream<QuerySnapshot>> getlistdetails() async {
    return await FirebaseFirestore.instance.collection("shoplist").snapshots();
  }

  Future updateshoplist(String id, Map<String, dynamic> updateinfo) async {
    return await FirebaseFirestore.instance
        .collection("shoplist")
        .doc(id)
        .update(updateinfo);
  }

  Future deleteListdetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("shoplist")
        .doc(id)
        .delete();
  }
}
