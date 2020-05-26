import 'package:flutter/material.dart';
import 'package:flutterchat/ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage>[];

  Widget _textComposerWidget() {
    return IconTheme(
        data: IconThemeData(color: Colors.blue),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textEditingController,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
                onSubmitted: _handleSubmited,
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmited(_textEditingController.text),
                ))
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
              padding: EdgeInsets.all(8.0),
              reverse: true,
            ),
          ),
          Divider(
            height: 1.0,
          ),
          Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _textComposerWidget()
              )
        ],
      );
  }

  void _handleSubmited(String value) {
    _textEditingController.clear();
    ChatMessage message = ChatMessage(value);
    setState(() {
      _messages.insert(0, message);
    });
  }
}
