import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_vote_app/vote/domain/repositories/vote_repository.dart';
import 'package:lets_vote_app/vote/infrastructure/repository/firebase_vote.dart';
import 'package:lets_vote_app/vote/infrastructure/services/firebase_vote_service.dart';

void main() {
  group('Create a vore', () {
    setUp(() {
      GetIt.instance.registerSingleton<FirebaseFirestore>(
        FakeFirebaseFirestore(),
      );
      GetIt.instance
          .registerSingleton<VoteRepository>(FirebaseVoteRepository());
    });
    tearDown(() {
      GetIt.instance.reset();
    });
    test('Should create a vote', () {
      FirebaseVoteService().vote('Vote').then((value) {
        expect(value.isRight(), true);
      });
    });
  });
}
