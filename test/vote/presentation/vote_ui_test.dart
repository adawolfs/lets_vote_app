import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_vote_app/vote/application/bloc/vote_bloc.dart';
import 'package:lets_vote_app/vote/application/use_cases/vote_use_case.dart';
import 'package:lets_vote_app/vote/domain/repositories/vote_repository.dart';
import 'package:lets_vote_app/vote/infrastructure/repository/firebase_vote.dart';
import 'package:lets_vote_app/vote/presentation/pages/vote_page.dart';

void main() {
  group('Create a vore', () {
    setUp(() {
      GetIt.instance.registerSingleton<FirebaseFirestore>(
        FakeFirebaseFirestore(),
      );
      GetIt.instance
          .registerSingleton<VoteRepository>(FirebaseVoteRepository());

      GetIt.instance.registerSingleton<VoteUseCase>(VoteUseCase());
    });
    tearDown(() {
      GetIt.instance.reset();
    });
    testWidgets("should implement form, textfields and button",
        (WidgetTester tester) async {
      await tester.pumpWidget(BlocProvider(
        create: (context) => VoteBloc(),
        child: const MaterialApp(
          home: Scaffold(
            body: VotePage(),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(1));
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
