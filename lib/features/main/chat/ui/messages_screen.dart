import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/models/timestamp.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/main/chat/data/models/chat.dart';
import 'package:pharmalink/features/main/chat/data/models/message.dart';
import 'package:pharmalink/features/main/chat/logic/cubit/chat_cubit.dart';
import 'package:pharmalink/features/main/chat/ui/widgets/messages_header.dart';

import 'widgets/message_card.dart';
import 'widgets/message_input.dart';

List<Message> messages = [
  Message(
    id: 1,
    message: "Hello, how are you?",
    senderUserId: 9,
    receiverDoctorId: 1,
    timestamp: Timestamp(
      date: DateTime.now().toString(),
    ),
  ),
  Message(
    id: 2,
    message: "Hi! I'm good, thanks for asking. How about you?",
    senderDoctorId: 1,
    receiverUserId: 9,
    timestamp: Timestamp(
      date: DateTime.now().toString(),
    ),
  ),
  Message(
    id: 3,
    message: "I'm doing well. Are you free to catch up later?",
    senderUserId: 9,
    receiverDoctorId: 1,
    timestamp: Timestamp(
      date: DateTime.now().toString(),
    ),
  ),
  Message(
    id: 4,
    message: "Sure, would love to. How about 4 PM?",
    senderDoctorId: 1,
    receiverUserId: 9,
    timestamp: Timestamp(
      date: DateTime.now().toString(),
    ),
  ),
  Message(
    id: 5,
    message: "Perfect, see you then!",
    senderUserId: 9,
    receiverDoctorId: 1,
    timestamp: Timestamp(
      date: DateTime.now().toString(),
    ),
  ),
  Message(
    id: 6,
    message: "Should we meet at the usual place?",
    senderUserId: 9,
    receiverDoctorId: 1,
    timestamp: Timestamp(
      date: DateTime.now().toString(),
    ),
  ),
  Message(
    id: 7,
    message: "Sounds good. I'll be there.",
    senderDoctorId: 1,
    receiverUserId: 9,
    timestamp: Timestamp(
      date: DateTime.now().toString(),
    ),
  ),
  Message(
    id: 8,
    message: "Great! I'll bring the project files.",
    senderUserId: 9,
    receiverDoctorId: 1,
    timestamp: Timestamp(
      date: DateTime.now().toString(),
    ),
  ),
  Message(
    id: 1,
    message: "Do you need me to bring anything else?",
    senderDoctorId: 1,
    receiverDoctorId: 9,
    timestamp: Timestamp(
      date: DateTime.now().toString(),
    ),
  ),
  Message(
    id: 10,
    message: "Just bring your laptop so we can review everything together.",
    senderUserId: 9,
    receiverDoctorId: 1,
    timestamp: Timestamp(
      date: DateTime.now().toString(),
    ),
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
  int messageId = 0;
  List<Message> showedMessages = [];

  void sendMessage() {
    // Send message to the doctor
    context.read<ChatCubit>().sendMessage(widget.chat.doctorId);
  }

  Widget buildMessages(List<Message> messages) {
//     StreamBuilder(
//   stream:  context.read<ChatCubit>().stream,
//   builder: (context, snapshot) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//   child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
//   );
//   },
// )
    messages = messages.reversed.toList();
    return Expanded(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // <-- Hide virtual keyboard
        },
        child: Align(
          alignment: Alignment.topCenter,
          child: ListView.builder(
            controller: context.read<ChatCubit>().scrollController,
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
                controller: context.read<ChatCubit>().messageController,
                onPressed: sendMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
