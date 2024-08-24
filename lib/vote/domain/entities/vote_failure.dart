import 'package:lets_vote_app/common/domain/failure.dart';

class VoteFailure extends Failure {
  final String message;

  VoteFailure({required this.message});
}
