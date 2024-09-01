import 'package:flutter/material.dart';

class EmojiVotingPage extends StatefulWidget {
  const EmojiVotingPage({super.key});

  @override
  _EmojiVotingPageState createState() => _EmojiVotingPageState();
}

class _EmojiVotingPageState extends State<EmojiVotingPage> {
  final List<String> emojis = ["😃", "😐", "😔", "😡", "😎"];
  String? selectedEmoji;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("How Do You Feel Today?"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "¿Como te sientes hoy?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 20,
              children: List.generate(emojis.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedEmoji = emojis[index];
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        emojis[index],
                        style: TextStyle(
                          fontFamily: 'Noto Color Emoji',
                          fontSize: 40,
                          backgroundColor: selectedEmoji == emojis[index]
                              ? Colors.blue
                              : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: selectedEmoji != null ? () {} : null,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
