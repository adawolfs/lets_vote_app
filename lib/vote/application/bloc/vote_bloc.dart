import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_vote_app/vote/application/bloc/vote_event.dart';
import 'package:lets_vote_app/vote/application/bloc/vote_state.dart';
import 'package:lets_vote_app/vote/domain/services/vote_service.dart';

class VoteBloc extends Bloc<VoteEvent, VoteState> {
  GetIt getIt = GetIt.instance;
  VoteBloc() : super(VoteInitial()) {
    on<VoteSummit>((event, emit) async {
      emit(VoteLoading());
      final vote = await getIt.get<VoteService>().vote(event.vote!.value);
      vote.fold((failure) => emit(VoteFailed(failure: failure)),
          (vote) => emit(VoteSuccess(vote: vote)));
    });
    on<VoteCount>((event, emit) async {
      await getIt.get<VoteService>().count().forEach((count) {
        emit(VoteCounted(count: count));
      });
    });
    // add(VoteCount());
  }
}
