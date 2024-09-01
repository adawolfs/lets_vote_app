import 'package:lets_vote_app/vote/domain/entities/quizz.dart';

class EmojiQuizz extends Quizz {
  EmojiQuizz({
    required super.id,
    required super.title,
    required super.description,
    required super.type,
    required super.imageUrl,
    required EmojiQuizzConfig super.config,
  });
}

class EmojiQuizzConfig extends QuizzConfig {
  final List<String> emojis;

  EmojiQuizzConfig({required this.emojis});
}
