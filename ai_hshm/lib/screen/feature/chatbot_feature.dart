import 'package:ai_hshm/controller/chat_controller.dart';
import 'package:ai_hshm/helper/global.dart';
import 'package:ai_hshm/main.dart';
import 'package:ai_hshm/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final _c = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with AI Assistant'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
              controller: _c.textC,
              textAlign: TextAlign.center,
              onTapOutside: (e) => Focus.of(context).unfocus(),
              decoration: InputDecoration(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  isDense: true,
                  hintText: 'Ask me anything that you want....',
                  hintStyle: const TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            )),
            SizedBox(
              width: 8,
            ),
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).buttonColor,
              child: IconButton(
                onPressed: _c.askQuestion,
                icon: Icon(
                  Icons.rocket_launch_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          controller: _c.scrollC,
          padding:
              EdgeInsets.only(top: nq.height * .02, bottom: nq.height * .01),
          children: _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}
