import 'package:fpdart/fpdart.dart';
import 'package:lets_vote_app/setup/domain/entities/setup.dart';
import 'package:lets_vote_app/setup/domain/entities/setup_failure.dart';

abstract class SetupRepository {
  Future<Either<SetupFailure, List<Setup>>> getSetup();
  Stream<List<Setup>> getSetupStream();
  Future<Either<SetupFailure, Setup>> changeSetup(Setup setup);
}
