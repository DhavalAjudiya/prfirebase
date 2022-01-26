import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prfirebase/constant/const.dart';
import 'package:prfirebase/screen/profile_screen.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("User List"),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: userData.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                docId: snapshot.data!.docs[index].id.toString(),
                              ),
                            ),
                          );
                        },
                        child: Dismissible(
                            key: Key(snapshot.data!.docs[index].id),
                            background: Container(
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onDismissed: (direction) {
                              userData
                                  .doc(snapshot.data!.docs[index].id)
                                  .delete();
                            },
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.17,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(children: [
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(snapshot
                                            .data!.docs[index]
                                            .get("image")),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]
                                                .get("name"),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]
                                                .get("email"),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ]),
                                  ),
                                ),
                                Divider()
                              ],
                            )),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
