import 'package:fpdart/fpdart.dart';
import 'package:lets_vote_app/setup/domain/entities/setup.dart';
import 'package:lets_vote_app/setup/domain/entities/setup_failure.dart';

abstract class SetupService {
  Future<Either<SetupFailure, Setup>> loadSetup();
  Future<Either<SetupFailure, Setup>> changeSetup(Setup setup);
}
