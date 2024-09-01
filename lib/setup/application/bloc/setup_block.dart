import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_vote_app/setup/application/bloc/setup_event.dart';
import 'package:lets_vote_app/setup/application/bloc/setup_state.dart';
import 'package:lets_vote_app/setup/domain/entities/setup.dart';
import 'package:lets_vote_app/setup/domain/services/setup_service.dart';

class SetupBlock extends Bloc<SetupEvent, SetupState> {
  GetIt getIt = GetIt.instance;
  SetupBlock() : super(SetupInitial()) {
    on<SetupLoad>((event, emit) async {
      emit(SetupLoading());
      final setup = await getIt.get<SetupService>().loadSetup();
      setup.fold((failure) => emit(SetupFailed(failure: failure)),
          (setup) => emit(SetupSuccess(setup: setup)));
    });
    on<SetupSummit>((event, emit) async {
      emit(SetupLoading());
      final setup = await getIt.get<SetupService>().changeSetup(
            const Setup(
              key: 'test',
              value: 'test',
            ),
          );
      setup.fold((failure) => emit(SetupFailed(failure: failure)),
          (setup) => emit(SetupSuccess(setup: setup)));
    });
  }
}
