import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'item_card.dart';


class MainPage extends StatelessWidget {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
final FirebaseUser user;
  MainPage(this.user);
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Firestore Demo'),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ListView(
              children: [
                //// VIEW DATA HERE
                ///note:1x ambil saja
                // FutureBuilder<QuerySnapshot>(
                //     future: users.get(),
                //     builder: (_, snapshot) {
                //       if (snapshot.hasData) {
                //         return Column(
                //           children: snapshot.data.docs
                //               .map((e) => ItemCard(e.data()['nama_wisata'],
                //                   e.data()['deskripsi']))
                //               .toList(),
                //         );
                //       } else {
                //         Text("Loading");
                //       }
                //     }),
                // note :Langsung ke refresh
                StreamBuilder<QuerySnapshot>(
                stream: users.snapshots(),
                builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: snapshot.data.docs
                              .map((e) => ItemCard(e.data()['nama_wisata'],
                                  e.data()['deskripsi']))
                              .toList(),
                        );
                      } else {
                        Text("Loading");
                      }
                    },
                ),
                SizedBox(
                  height: 150,
                )
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-5, 0),
                        blurRadius: 15,
                        spreadRadius: 3)
                  ]),
                  width: double.infinity,
                  height: 130,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: namaController,
                              decoration: InputDecoration(hintText: "Wisata"),
                            ),
                            TextField(
                              controller: deskripsiController,
                              decoration:
                                  InputDecoration(hintText: "Deskripsi"),
                              // keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 130,
                        width: 130,
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Colors.blue[900],
                            child: Text(
                              'Add Data',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              //// ADD DATA HERE
                              users.add({
                                'nama_wisata': namaController.text,
                                'deskripsi': deskripsiController.text,
                                // 'age':int.tryParse(ageController.text)?? 0
                              });
                              namaController.text = '';
                              deskripsiController.text = '';
                            }),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}

