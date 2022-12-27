import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatefulWidget {
  final DocumentSnapshot snapshot;

  const PostDetails({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Details"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Card(
        elevation: 10.0,
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.white,
                    child: Text(widget.snapshot["title"][0]),
                  ),
                  const SizedBox(width: 10.0),
                  Text(widget.snapshot["title"],
                      style:
                          const TextStyle(fontSize: 22.0, color: Colors.green)),
                ],
              ),
            ),
            const SizedBox(
              height: 7.0,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Text(
                widget.snapshot["content"],
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
            const SizedBox(
              height: 7.0,
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red, // Text Color
                    ),
                    // <-- TextButton
                    onPressed: () {
                      var text = isLiked ? 'Oops!' : "Yeah! You liked it";
                      final snackbar = SnackBar(content: Text(text));

                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      size: 24.0,
                    ),
                    label: const Text('Like'),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  const Text("10 likes")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
