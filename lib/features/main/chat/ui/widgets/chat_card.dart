import 'package:flutter/material.dart';
import 'package:pharmalink/features/main/chat/data/models/chat.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;
  const ChatCard(
    this.chat, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(chat.doctorImage),
          radius: 24.0,
        ),
        title: Text(chat.doctorName),
        subtitle: Text(chat.lastMessage),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(chat.doctorUsername, style: TextStyle(color: Colors.grey[600])),
          ],
        ),
        onTap: () {
        },
      ),
    );
  }
}
