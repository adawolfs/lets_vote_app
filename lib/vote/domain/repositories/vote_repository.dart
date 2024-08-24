import 'package:fpdart/fpdart.dart';
import 'package:lets_vote_app/vote/domain/entities/vote.dart';
import 'package:lets_vote_app/vote/domain/entities/vote_failure.dart';
import 'package:lets_vote_app/vote/infrastructure/models/vote.dart';

abstract class VoteRepository {
  Future<Either<VoteFailure, Vote>> vote(VoteModel vote);
}
