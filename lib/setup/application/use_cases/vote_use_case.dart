import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_vote_app/common/domain/use_case.dart';
import 'package:lets_vote_app/vote/domain/entities/vote_failure.dart';
import 'package:lets_vote_app/vote/domain/services/vote_service.dart';
import 'package:lets_vote_app/vote/domain/entities/vote.dart';
import 'package:lets_vote_app/vote/domain/parameters/vote_parameters.dart';

class VoteUseCase implements UseCase<Vote, VoteParameters> {
  GetIt getIt = GetIt.instance;

  @override
  Future<Either<VoteFailure, Vote>> call(VoteParameters params) async {
    return getIt.get<VoteService>().vote(params.value);
  }
}
