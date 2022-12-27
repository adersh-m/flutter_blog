import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/post_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late StreamSubscription<QuerySnapshot> subscription;
  late List<DocumentSnapshot> snapshot;

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Post");

  gotoDetails(DocumentSnapshot snapshot) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PostDetails(snapshot: snapshot),
    ));
  }

  @override
  void initState() {
    super.initState();

    subscription = collectionReference.snapshots().listen((event) {
      setState(() {
        snapshot = event.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Blog App"),
          backgroundColor: Colors.redAccent,
          actions: [
            IconButton(
                onPressed: () => {log('search')},
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () => {log("add")}, icon: const Icon(Icons.add))
          ],
        ),
        drawer: Drawer(
          child: Column(children: <Widget>[
            Expanded(
                child: ListView(
              children: const <Widget>[
                UserAccountsDrawerHeader(
                    accountName: Text('Sam Paul'),
                    accountEmail: Text('test@gmail.com'),
                    decoration: BoxDecoration(color: Colors.purpleAccent),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Color(0xffE6E6E6),
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        color: Color(0xffCCCCCC),
                      ),
                    )),
                ListTile(
                  title: Text("FIrst Page"),
                  leading: Icon(Icons.pages),
                ),
                ListTile(
                  title: Text("Second Page"),
                  leading: Icon(Icons.book),
                ),
                ListTile(
                  title: Text("Third Page"),
                  leading: Icon(Icons.image),
                ),
                Divider(color: Colors.black),
                ListTile(
                    leading: Icon(Icons.settings), title: Text('Settings')),
                ListTile(
                    leading: Icon(Icons.help), title: Text('Help and Feedback'))
              ],
            )),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(children: const <Widget>[
                Divider(),
                ListTile(
                  title: Text("App Version"),
                  leading: Icon(Icons.info_outline),
                  trailing: Text("0.0.1"),
                ),
                ListTile(
                  title: Text("Logout"),
                  leading: Icon(
                    Icons.logout_outlined,
                    color: Colors.red,
                  ),
                  textColor: Colors.red,
                )
              ]),
            )
          ]),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: collectionReference.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final userSnapshot = snapshot.data?.docs;
            if (userSnapshot!.isEmpty) {
              return Align(
                alignment: Alignment.center,
                child: EmptyWidget(
                  image: null,
                  packageImage: PackageImage.Image_3,
                  title: 'No Posts',
                  subTitle: 'No posts published yet',
                  titleTextStyle: const TextStyle(
                    fontSize: 20,
                    color: Color(0xff9da9c7),
                    fontWeight: FontWeight.w500,
                  ),
                  subtitleTextStyle: const TextStyle(
                    fontSize: 12,
                    color: Color(0xffabb8d6),
                  ),
                ),
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.black),
                itemCount: userSnapshot.length,
                itemBuilder: (context, index) {
                  final snapshotData = userSnapshot[index];

                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(snapshotData["title"][0]),
                    ),
                    title: Text(snapshotData["title"]),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      gotoDetails(snapshotData);
                    },
                  );
                },
              );
            }
          },
        ));
  }
}
