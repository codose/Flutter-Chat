import 'package:flutter/material.dart';

import 'ChatScreen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Flutter Chat")),
      body: ChatScreen()
    );
  }
}
