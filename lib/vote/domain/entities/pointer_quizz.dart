import 'package:lets_vote_app/vote/domain/entities/quizz.dart';

class PointerQuizz extends Quizz {
  PointerQuizz({
    required super.id,
    required super.title,
    required super.description,
    required super.type,
    required super.imageUrl,
    required PointerQuizzConfig super.config,
  });
}

class PointerQuizzConfig extends QuizzConfig {
  final String pointerColor;

  PointerQuizzConfig({required this.pointerColor});
}
