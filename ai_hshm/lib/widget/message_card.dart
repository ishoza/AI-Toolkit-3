import 'package:ai_hshm/helper/global.dart';
import 'package:ai_hshm/main.dart';
import 'package:ai_hshm/model/message.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(15);
    return message.msgType == MessageType.bot
        ? Row(
            children: [
              SizedBox(
                width: 6,
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/images/chatbot.png',
                  width: 24,
                ),
              ),
              Container(
                  constraints: BoxConstraints(maxWidth: nq.width * .6),
                  margin: EdgeInsets.only(
                      bottom: nq.height * .01, left: nq.width * .02),
                  padding: EdgeInsets.symmetric(
                      vertical: nq.height * .01, horizontal: nq.width * .03),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).lightTextColor),
                      borderRadius: BorderRadius.only(
                        topLeft: r,
                        topRight: r,
                        bottomRight: r,
                      )),
                  child: message.msg.isEmpty
                      ? AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Please wait...',
                              speed: const Duration(milliseconds: 50),
                            ),
                          ],
                          repeatForever: true,
                        )
                      : Text(
                          message.msg,
                          textAlign: TextAlign.center,
                        )),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  constraints: BoxConstraints(maxWidth: nq.width * .6),
                  margin: EdgeInsets.only(
                      bottom: nq.height * .01, right: nq.width * .02),
                  padding: EdgeInsets.symmetric(
                      vertical: nq.height * .01, horizontal: nq.width * .03),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).lightTextColor),
                      borderRadius: BorderRadius.only(
                        topLeft: r,
                        topRight: r,
                        bottomLeft: r,
                      )),
                  child: Text(
                    message.msg,
                    textAlign: TextAlign.center,
                  )),
              CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                  )),
              SizedBox(
                width: 6,
              ),
            ],
          );
  }
}
