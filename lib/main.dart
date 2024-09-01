import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lets_vote_app/vote/presentation/pages/emoji_voting_page.dart';
import 'package:lets_vote_app/vote/presentation/pages/number_voting_page.dart';
import 'package:lets_vote_app/vote/presentation/pages/pointer_voting_page.dart';
import 'package:lets_vote_app/vote/presentation/pages/square_voting_page.dart';
import 'package:lets_vote_app/vote/presentation/slides/main_slide.dart';
import 'package:lets_vote_app/vote/application/bloc/vote_bloc.dart';
import 'package:lets_vote_app/vote/domain/services/vote_service.dart';
import 'package:lets_vote_app/vote/application/use_cases/vote_use_case.dart';
import 'package:lets_vote_app/vote/domain/repositories/vote_repository.dart';
import 'package:lets_vote_app/vote/infrastructure/repository/firebase_vote.dart';
import 'package:lets_vote_app/vote/infrastructure/services/firebase_vote_service.dart';
import 'package:lets_vote_app/vote/presentation/pages/vote_page.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GetIt.instance.registerSingleton<FirebaseFirestore>(
    FirebaseFirestore.instance,
  );
  GetIt.instance.registerSingleton<VoteRepository>(
    FirebaseVoteRepository(),
  );

  GetIt.instance.registerSingleton<VoteService>(
    FirebaseVoteService(),
  );

  GetIt.instance.registerSingleton<VoteUseCase>(VoteUseCase());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/number',
        routes: {
          '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
          '/emoji': (context) => const EmojiVotingPage(),
          '/pointer': (context) => PointerVotingPage(),
          '/square': (context) => const SquareVotingPage(),
          '/number': (context) => const NumberVotingPage(),
          '/slides': (context) => BlocProvider(
              create: (context) => VoteBloc(), child: const MainSlide())
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VoteBloc(),
      child: const VotePage(),
    );
  }
}
