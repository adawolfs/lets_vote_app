// Vote page that uses VoteBloc to send events to the bloc and listen to the state changes.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_vote_app/vote/application/bloc/vote_bloc.dart';
import 'package:lets_vote_app/vote/application/bloc/vote_event.dart';
import 'package:lets_vote_app/vote/application/bloc/vote_state.dart';
import 'package:lets_vote_app/vote/domain/entities/vote.dart';

class VotePage extends StatefulWidget {
  const VotePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VotePageState createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  final _voteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vote Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _voteController,
              decoration: const InputDecoration(
                labelText: 'Vote',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final vote = Vote(value: _voteController.text);
                BlocProvider.of<VoteBloc>(context).add(VoteSummit(vote));
              },
              child: const Text('Vote'),
            ),
            const SizedBox(height: 16),
            BlocBuilder<VoteBloc, VoteState>(
              builder: (context, state) {
                if (state is VoteInitial) {
                  return Container();
                } else if (state is VoteLoading) {
                  return const CircularProgressIndicator();
                } else if (state is VoteSuccess) {
                  return Text('Success: ${state.vote.value}');
                } else if (state is VoteFailed) {
                  return Text('Failure: ${state.failure.message}');
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
