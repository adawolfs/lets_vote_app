import 'package:lets_vote_app/vote/domain/entities/vote.dart';

abstract class VoteEvent {
  const VoteEvent();
}

class VoteSummit extends VoteEvent {
  final Vote? vote;
  const VoteSummit(this.vote);
}
