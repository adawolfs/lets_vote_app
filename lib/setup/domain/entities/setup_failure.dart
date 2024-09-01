import 'package:lets_vote_app/common/domain/failure.dart';

class SetupFailure extends Failure {
  final String message;

  SetupFailure({required this.message});
}
