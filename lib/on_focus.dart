import 'package:flutter/material.dart';

class OnFocus extends StatefulWidget {
  const OnFocus({super.key});

  @override
  State<OnFocus> createState() => _OnFocusState();
}

class _OnFocusState extends State<OnFocus> {
  final String _url =
      "https://play-lh.googleusercontent.com/84oJE__r4jXfty7L6e0vqiUV9G9BR7E2KzVaTgJLoto1gJgIG9keMqRpVIu0dEhCcw=w240-h480-rw";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(_url),
            ),
            const Text("Focused Pupa"),
          ],
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
