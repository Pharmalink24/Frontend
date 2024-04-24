import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/main/chat/ui/widgets/chats_header.dart';

import '../data/models/chat.dart';
import 'widgets/chat_card.dart';

List<Chat> chats = [
  Chat(
    id: '1',
    doctorId: '1',
    doctorFname: "Mohamed",
    doctorLname: "Ali",
    doctorImage:
        'https://img.freepik.com/free-photo/doctor-offering-medical-teleconsultation_23-2149329007.jpg?size=626&ext=jpg&ga=GA1.1.553209589.1713830400&semt=ais',
    doctorUsername: 'ahmed',
    lastMessage: 'Hello',
    lastMessageDateTime: "12:00 PM",
  ),
  Chat(
    id: '3',
    doctorId: '3',
    doctorFname: 'Ali',
    doctorLname: 'Mohamed',
    doctorImage:
        'https://img.freepik.com/free-photo/portrait-experienced-professional-therapist-with-stethoscope-looking-camera_1098-19305.jpg',
    doctorUsername: 'ali',
    lastMessage: 'Hey',
    lastMessageDateTime: "12:00 PM",
  ),
  Chat(
    id: '4',
    doctorId: '4',
    doctorFname: 'Mona',
    doctorLname: 'Ali',
    doctorImage:
        'https://marsleevamedicity.com/wp-content/uploads/2022/01/Dr.-E-S-Rajendran.jpg',
    doctorUsername: 'mona',
    lastMessage: 'Hala',
    lastMessageDateTime: "12:00 PM",
  ),
  Chat(
    id: '11',
    doctorId: '11',
    doctorFname: 'Nada',
    doctorLname: 'Ali',
    doctorUsername: 'nada',
    lastMessage: 'Ciao',
    lastMessageDateTime: "12:00 PM",
  ),
  Chat(
    id: '5',
    doctorId: '5',
    doctorFname: 'Sara',
    doctorLname: 'Ali',
    doctorImage: 'https://www.smhbhopal.com/upload/doctors/1694428861.jpg',
    doctorUsername: 'sara',
    lastMessage: 'Bonjour',
    lastMessageDateTime: "12:00 PM",
  ),
  Chat(
    id: '6',
    doctorId: '6',
    doctorFname: 'Hana',
    doctorLname: 'Ali',
    doctorUsername: 'hanoo',
    lastMessage: 'Salut',
    lastMessageDateTime: "12:00 PM",
  ),
  Chat(
    id: '7',
    doctorId: '7',
    doctorFname: 'Nada',
    doctorLname: 'Mohamed',
    doctorUsername: 'nada',
    lastMessage: 'Hola',
    lastMessageDateTime: "12:00 PM",
  ),
  Chat(
    id: '9',
    doctorId: '9',
    doctorFname: 'Nour',
    doctorLname: 'Ali',
    doctorUsername: 'nour',
    lastMessage: 'Ciao',
    lastMessageDateTime: "12:00 PM",
  ),
  Chat(
    id: '10',
    doctorId: '10',
    doctorFname: 'Nada',
    doctorLname: 'Ali',
    doctorUsername: 'nada',
    lastMessage: 'Ciao',
    lastMessageDateTime: "12:00 PM",
  ),
  Chat(
    id: '3',
    doctorId: '3',
    doctorFname: 'Ali',
    doctorLname: 'Mohamed',
    doctorImage:
        'https://img.freepik.com/free-photo/portrait-experienced-professional-therapist-with-stethoscope-looking-camera_1098-19305.jpg',
    doctorUsername: 'ali',
    lastMessage: 'Hey',
    lastMessageDateTime: "12:00 PM",
  ),
  Chat(
    id: '4',
    doctorId: '4',
    doctorFname: 'Mona',
    doctorLname: 'Ali',
    doctorImage:
        'https://marsleevamedicity.com/wp-content/uploads/2022/01/Dr.-E-S-Rajendran.jpg',
    doctorUsername: 'mona',
    lastMessage: 'Hala',
    lastMessageDateTime: "12:00 PM",
  ),
  Chat(
    id: '5',
    doctorId: '5',
    doctorFname: 'Sara',
    doctorLname: 'Ali',
    doctorImage: 'https://www.smhbhopal.com/upload/doctors/1694428861.jpg',
    doctorUsername: 'sara',
    lastMessage: 'Bonjour',
    lastMessageDateTime: "12:00 PM",
  ),
  Chat(
    id: '8',
    doctorId: '8',
    doctorFname: 'Noha',
    doctorLname: 'Ali',
    doctorUsername: 'noha',
    lastMessage: 'Ciao',
    lastMessageDateTime: "12:00 PM",
  ),
];

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  Widget buildChats(List<Chat> chats) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        itemBuilder: (context, index) {
          return ChatCard(
            chats[index],
          );
        },
        itemCount: chats.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      height: double.infinity,
      width: double.infinity,
      child: SafeArea(
        child: Column(
          children: [
            const ChatsHeader(),
            buildChats(chats),
          ],
        ),
      ),
    );
  }
}
