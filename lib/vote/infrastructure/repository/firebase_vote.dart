import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_vote_app/vote/domain/entities/vote.dart';
import 'package:lets_vote_app/vote/domain/entities/vote_failure.dart';
import 'package:lets_vote_app/vote/domain/repositories/vote_repository.dart';
import 'package:lets_vote_app/vote/infrastructure/models/vote.dart';

class FirebaseVoteRepository implements VoteRepository {
  GetIt getIt = GetIt.instance;
  final String documentPath = 'votes';
  late final CollectionReference<VoteModel> _voteRef;

  FirebaseVoteRepository() {
    _voteRef = getIt
        .get<FirebaseFirestore>()
        .collection(documentPath)
        .withConverter<VoteModel>(
          fromFirestore: (snapshots, _) =>
              VoteModel.fromMap(snapshots.data()!, snapshots.id),
          toFirestore: (vote, _) => vote.toFirebaseMap(),
        );
  }

  @override
  Future<Either<VoteFailure, Vote>> vote(VoteModel vote) async {
    return _voteRef
        .add(vote)
        .then((doc) => doc.get().then((value) => Right(value.data()!)));
  }

  @override
  Stream<int> count() {
    return _voteRef.get().asStream().map((event) => event.docs.length);
  }
}
