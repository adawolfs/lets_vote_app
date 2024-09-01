import 'package:lets_vote_app/vote/domain/entities/quizz.dart';

class SquareQuizz extends Quizz {
  SquareQuizz({
    required super.id,
    required super.title,
    required super.description,
    required super.type,
    required super.imageUrl,
    required SquareQuizzConfig super.config,
  });
}

class SquareQuizzConfig extends QuizzConfig {
  final String squareColor;

  SquareQuizzConfig({required this.squareColor});
}
