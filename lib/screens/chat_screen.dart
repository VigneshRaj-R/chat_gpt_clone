import 'package:chat_gpt_clone/constants/constant.dart';
import 'package:chat_gpt_clone/services/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AssetManager.openaiLogo),
            ),
            title: const Text("Chat GPT"),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.black,
                  ))
            ],
          ),
          body: SafeArea(
              child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const Text(
                      "Hello",
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
              ),
              if (_isTyping) ...[
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                )
              ],
              SizedBox(
                height: 10,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        style: const TextStyle(color: Colors.black87),
                        controller: textEditingController,
                        onSubmitted: (value) {
                          // TODO send message
                        },
                        decoration: const InputDecoration.collapsed(
                            hintText: "How can I help you",
                            hintStyle: TextStyle(color: Colors.black)),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ))),
    );
  }
}
