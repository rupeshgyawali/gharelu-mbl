import 'package:flutter/material.dart';
import 'package:gharelu/model/chatModel.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            _messagePage("User $index");
          },
          child: ListTile(
            title: Text("User $index"),
          ),
        );
      },
    ));
  }

  void _messagePage(user) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MessagePage(
                  user: user,
                )));
    // Scaffold.of(context).showBottomSheet((context) {
    //   return _buildBottomSheet();
    // });
  }
}

class MessagePage extends StatefulWidget {
  final String user;

  MessagePage({this.user});

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _messageController = TextEditingController();

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _messageController,
                decoration:
                    InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _handleSubmitted,
                )),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted() {
    ChatMessage message = ChatMessage(
      text: _messageController.text,
    );
    _messageController.clear();
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
              child: Text(widget.user),
            ),
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }
}
