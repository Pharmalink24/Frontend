import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/main/chat/data/models/chat.dart';
import 'package:pharmalink/features/main/chat/data/models/message.dart';
import 'package:pharmalink/features/main/chat/ui/widgets/messages_header.dart';

import 'widgets/message_card.dart';
import 'widgets/message_input.dart';

List<Message> messages = [
  Message(
    id: 1,
    message: "Hello, how are you?",
    senderId: 1,
    receiverId: 9,
    timestamp: "12:00",
  ),
  Message(
    id: 2,
    message: "Hi! I'm good, thanks for asking. How about you?",
    senderId: 9,
    receiverId: 1,
    timestamp: "12:01",
  ),
  Message(
    id: 3,
    message: "I'm doing well. Are you free to catch up later?",
    senderId: 1,
    receiverId: 9,
    timestamp: "12:02",
  ),
  Message(
    id: 4,
    message: "Sure, would love to. How about 4 PM?",
    senderId: 9,
    receiverId: 1,
    timestamp: "12:03",
  ),
  Message(
    id: 5,
    message: "Perfect, see you then!",
    senderId: 1,
    receiverId: 9,
    timestamp: "12:04",
  ),
  Message(
    id: 6,
    message: "Should we meet at the usual place?",
    senderId: 1,
    receiverId: 9,
    timestamp: "12:05",
  ),
  Message(
    id: 7,
    message: "Sounds good. I'll be there.",
    senderId: 9,
    receiverId: 1,
    timestamp: "12:06",
  ),
  Message(
    id: 8,
    message: "Great! I'll bring the project files.",
    senderId: 1,
    receiverId: 9,
    timestamp: "12:07",
  ),
  Message(
    id: 9,
    message: "Do you need me to bring anything else?",
    senderId: 9,
    receiverId: 1,
    timestamp: "12:08",
  ),
  Message(
    id: 10,
    message: "Just bring your laptop so we can review everything together.",
    senderId: 1,
    receiverId: 9,
    timestamp: "12:09",
  ),
];

class MessagesScreen extends StatefulWidget {
  final Chat chat;
  const MessagesScreen(
    this.chat, {
    super.key,
  });

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final scrollController = ScrollController();
  int messageId = 0;
  TextEditingController textEditingController = TextEditingController();
  List<Message> showedMessages = [];

  void addMessage() {
    // Add message to the list
    showedMessages.add(messages[messageId % messages.length]);
    messageId++;
  }

  Future<void> onFieldSubmitted() async {
    setState(() {
      addMessage();
      // Move the scroll position to the bottom
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      textEditingController.text = '';
    });
  }

  Widget buildMessages(List<Message> messages) {
    messages = messages.reversed.toList();
    return Expanded(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // <-- Hide virtual keyboard
        },
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            reverse: true,
            padding: const EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 16,
              bottom: 16,
            ),
            itemBuilder: (context, index) {
              return MessageCard(
                messages[index],
              );
            },
            itemCount: messages.length,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // assign true
      appBar: buildMessageAppBar(context, widget.chat),
      body: Container(
        color: AppColors.primaryBackground,
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              buildMessages(showedMessages),
              MessageInput(
                controller: textEditingController,
                onPressed: onFieldSubmitted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
