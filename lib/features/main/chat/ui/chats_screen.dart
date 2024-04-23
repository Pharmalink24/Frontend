import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

import '../data/models/chat.dart';
import 'widgets/chat_card.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  Widget buildChats(List<Chat> chats) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
        itemBuilder: (context, index) {
          return ChatCard(chats[index]);
        },
        itemCount: chats.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Chat> chats = [
      Chat(
        id: '1',
        doctorId: '1',
        doctorName: 'Dr. Ahmed',
        doctorImage: 'https://via.placeholder.com/150',
        doctorUsername: 'ahmed',
        lastMessage: 'Hello',
      ),
      Chat(
        id: '2',
        doctorId: '2',
        doctorName: 'Dr. Mohamed',
        doctorImage: 'https://via.placeholder.com/150',
        doctorUsername: 'mohamed',
        lastMessage: 'Hi',
      ),
      Chat(
        id: '3',
        doctorId: '3',
        doctorName: 'Dr. Ali',
        doctorImage: 'https://via.placeholder.com/150',
        doctorUsername: 'ali',
        lastMessage: 'Hey',
      ),
      Chat(
        id: '4',
        doctorId: '4',
        doctorName: 'Dr. Mona',
        doctorImage: 'https://via.placeholder.com/150',
        doctorUsername: 'mona',
        lastMessage: 'Hola',
      ),
      Chat(
        id: '5',
        doctorId: '5',
        doctorName: 'Dr. Sara',
        doctorImage: 'https://via.placeholder.com/150',
        doctorUsername: 'sara',
        lastMessage: 'Bonjour',
      ),
      Chat(
        id: '6',
        doctorId: '6',
        doctorName: 'Dr. Hana',
        doctorImage: 'https://via.placeholder.com/150',
        doctorUsername: 'fdsfmf',
        lastMessage: 'Salut',
      ),
      Chat(
        id: '7',
        doctorId: '7',
        doctorName: 'Dr. Nada',
        doctorImage: 'https://via.placeholder.com/150',
        doctorUsername: 'nada',
        lastMessage: 'Hola',
      ),
      Chat(
        id: '8',
        doctorId: '8',
        doctorName: 'Dr. Nour',
        doctorImage: 'https://via.placeholder.com/150',
        doctorUsername: 'nour',
        lastMessage: 'Bonjour',
      ),
    ];

    return Container(
      color: AppColors.secondaryBackground,
      height: double.infinity,
      width: double.infinity,
      child: SafeArea(
        child: Column(
          children: [
            const Text(
              'Chats',
              style: AppTextStyle.headlineLarge,
            ),
            Text(
              'Below are your chats with doctors',
              style: AppTextStyle.bodyMedium.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
            buildChats(chats),
          ],
        ),
      ),
    );
  }
}
