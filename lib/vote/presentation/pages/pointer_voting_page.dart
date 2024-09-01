import 'package:flutter/material.dart';

class PointerVotingPage extends StatefulWidget {
  @override
  _PointerVotingPageState createState() => _PointerVotingPageState();
}

class _PointerVotingPageState extends State<PointerVotingPage> {
  // Initial position of the pointer
  Offset pointerPosition = Offset(100, 100);
  // Emoji for the pointer
  final String pointerEmoji = "🔵";
  bool isPointerVisible = false;

  // Update pointer position on tap
  void _onTapDown(TapDownDetails details) {
    setState(() {
      // Update the pointer position to where the user tapped
      pointerPosition = details.localPosition;
      isPointerVisible = true; // Make pointer visible on tap
    });
  }

  void _onPointerMoved(DragUpdateDetails details) {
    setState(() {
      // Update the pointer position
      pointerPosition = details.localPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Click to Set Pointer"),
      ),
      body: Stack(
        children: [
          // The image background
          Positioned.fill(
            child: GestureDetector(
              onTapDown: _onTapDown,
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // GestureDetector to track tap position
          GestureDetector(
            onPanUpdate: _onPointerMoved,
            child: Stack(
              children: [
                // Emoji pointer displayed at the tapped position
                if (isPointerVisible)
                  Positioned(
                    left: pointerPosition.dx - 20, // Offset to center the emoji
                    top: pointerPosition.dy - 20,
                    child: Text(
                      pointerEmoji,
                      style: const TextStyle(
                        fontFamily: 'Noto Color Emoji',
                        fontSize: 40,
                      ), // Emoji size
                    ),
                  ),
              ],
            ),
          ),
          // Display the pointer coordinates
          Positioned(
            bottom: 30,
            left: 20,
            child: Text(
              "Pointer position: (${pointerPosition.dx.toStringAsFixed(2)}, ${pointerPosition.dy.toStringAsFixed(2)})",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  backgroundColor: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
