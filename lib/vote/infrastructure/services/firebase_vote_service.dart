import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_vote_app/vote/domain/entities/vote_failure.dart';
import 'package:lets_vote_app/vote/domain/services/vote_service.dart';
import 'package:lets_vote_app/vote/domain/entities/vote.dart';
import 'package:lets_vote_app/vote/domain/repositories/vote_repository.dart';
import 'package:lets_vote_app/vote/infrastructure/models/vote.dart';

class FirebaseVoteService implements VoteService {
  GetIt getIt = GetIt.instance;

  @override
  Future<Either<VoteFailure, Vote>> vote(String value) async {
    return await getIt.get<VoteRepository>().vote(VoteModel(value: value));
  }

  @override
  Stream<int> count() {
    return getIt.get<VoteRepository>().count();
  }
}
