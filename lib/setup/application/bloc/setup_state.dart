import 'package:lets_vote_app/setup/domain/entities/setup.dart';
import 'package:lets_vote_app/setup/domain/entities/setup_failure.dart';

abstract class SetupState {}

class SetupInitial extends SetupState {}

class SetupLoading extends SetupState {}

class SetupSuccess extends SetupState {
  final Setup setup;
  SetupSuccess({required this.setup});
}

class SetupFailed extends SetupState {
  final SetupFailure failure;
  SetupFailed({required this.failure});
}

class SetupEmpty extends SetupState {}
