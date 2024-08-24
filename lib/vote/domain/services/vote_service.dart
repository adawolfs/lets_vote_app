import 'package:fpdart/fpdart.dart';
import 'package:lets_vote_app/vote/domain/entities/vote.dart';
import 'package:lets_vote_app/vote/domain/entities/vote_failure.dart';

abstract class VoteService {
  Future<Either<VoteFailure, Vote>> vote(String value);
}
