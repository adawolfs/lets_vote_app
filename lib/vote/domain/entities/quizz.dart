/*
Create a class Quizz with the following attributes:

id: (String) The unique ID for the quiz.
title: (String) The title of the quiz.
description: (String) A brief description of the quiz.
type: (String) The type of quiz (e.g., emoji, pointer, square, number).
createdAt: (Timestamp) The timestamp when the quiz was created.


*/

class Quizz {
  final String id;
  final String title;
  final String description;
  final String type;
  final String imageUrl;
  final QuizzConfig config;

  Quizz({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.imageUrl,
    required this.config,
  });
}

abstract class QuizzConfig {}
