import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_vote_app/setup/domain/entities/setup.dart';
import 'package:lets_vote_app/setup/domain/entities/setup_failure.dart';
import 'package:lets_vote_app/setup/domain/repositories/setup_repository.dart';
import 'package:lets_vote_app/setup/infrastructure/models/setup.dart';

class FirebaseSetupRepository implements SetupRepository {
  GetIt getIt = GetIt.instance;
  final String documentPath = 'setup';
  late final CollectionReference<SetupModel> _setupRef;

  FirebaseSetupRepository() {
    _setupRef = getIt
        .get<FirebaseFirestore>()
        .collection(documentPath)
        .withConverter<SetupModel>(
          fromFirestore: (snapshots, _) =>
              SetupModel.fromMap(snapshots.data()!, snapshots.id),
          toFirestore: (vote, _) => vote.toFirebaseMap(),
        );
  }

  @override
  Future<Either<SetupFailure, SetupModel>> changeSetup(Setup setup) {
    // Save setup to firebase
    SetupModel _setup = SetupModel.fromSetup(setup);
    return _setupRef.doc(_setup.key).set(_setup).then((_) => Right(_setup));
  }

  @override
  Future<Either<SetupFailure, List<Setup>>> getSetup() {
    // Return setup from firebase
    return _setupRef
        .get()
        .then((doc) => Right(doc.docs.map((e) => e.data()).toList()));
  }

  @override
  Stream<List<Setup>> getSetupStream() {
    return _setupRef.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((doc) => doc.data()).toList());
  }
}
