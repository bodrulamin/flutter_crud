import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message Box"),
      ),
      body: MessageBody(),
    );
  }
}

class MessageBody extends StatefulWidget {
  const MessageBody({Key? key}) : super(key: key);

  @override
  _MessageBodyState createState() => _MessageBodyState();
}

class _MessageBodyState extends State<MessageBody> {
  @override
  Widget build(BuildContext context) {
    var _subjectfield = TextEditingController();
    var _contentfield = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: _subjectfield,
            decoration: InputDecoration(
              labelText: "Subject",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _contentfield,
            maxLines: null,
            decoration: const InputDecoration(
              labelText: "Content",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                Uri url = Uri.parse("http://localhost:8080/category/add");
                var headers = {
                  "Content-Type": "application/json",
                };
             var response = await  http.post(url, headers: headers, body:jsonEncode({'name': 'hell'}) );

                print(response.body);

              },
              child: Text("Send"))
        ],
      ),
    );
  }

  void getCategory() async {
    print("button pressed");
    Uri url = Uri.parse("http://localhost:8080/category/getAll");
    var response = await http.get(url);
    print(response.body);
  }
}
