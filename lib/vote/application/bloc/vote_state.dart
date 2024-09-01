import 'package:fpdart/src/either.dart';
import 'package:lets_vote_app/common/domain/failure.dart';
import 'package:lets_vote_app/vote/domain/entities/vote.dart';
import 'package:lets_vote_app/vote/domain/entities/vote_failure.dart';

abstract class VoteState {}

class VoteInitial extends VoteState {}

class VoteLoading extends VoteState {}

class VoteSuccess extends VoteState {
  final Vote vote;
  VoteSuccess({required this.vote});
}

class VoteCounted extends VoteState {
  final int count;
  VoteCounted({required this.count});
}

class VoteFailed extends VoteState {
  final VoteFailure failure;
  VoteFailed({required this.failure});
}

class VoteEmpty extends VoteState {}
