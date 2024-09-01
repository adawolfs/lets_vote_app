import 'package:lets_vote_app/vote/domain/entities/quizz.dart';

class NumberQuizz extends Quizz {
  NumberQuizz({
    required super.id,
    required super.title,
    required super.description,
    required super.type,
    required super.imageUrl,
    required NumberQuizzConfig super.config,
  });
}

class NumberQuizzConfig extends QuizzConfig {
  final int minValue;
  final int maxValue;

  NumberQuizzConfig({required this.minValue, required this.maxValue});
}
