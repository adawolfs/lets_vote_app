import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_vote_app/setup/domain/entities/setup_failure.dart';
import 'package:lets_vote_app/setup/domain/services/setup_service.dart';
import 'package:lets_vote_app/setup/domain/entities/setup.dart';
import 'package:lets_vote_app/setup/domain/repositories/setup_repository.dart';

class FirebaseSetupService implements SetupService {
  GetIt getIt = GetIt.instance;

  @override
  Future<Either<SetupFailure, Setup>> changeSetup(Setup setup) {
    // Save setup to firebase
    return getIt.get<SetupRepository>().changeSetup(setup);
  }

  @override
  Future<Either<SetupFailure, Setup>> loadSetup() {
    // TODO: implement loadSetup
    throw UnimplementedError();
  }
}
