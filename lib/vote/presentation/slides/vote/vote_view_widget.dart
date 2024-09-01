import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_vote_app/vote/application/bloc/vote_bloc.dart';
import 'package:lets_vote_app/vote/application/bloc/vote_event.dart';
import 'package:lets_vote_app/vote/application/bloc/vote_state.dart';

class VoteViewWidget extends StatelessWidget {
  const VoteViewWidget({super.key});

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
            const Text("Hola a todos"),
            const SizedBox(height: 16),
            BlocBuilder<VoteBloc, VoteState>(
              builder: (context, state) {
                BlocProvider.of<VoteBloc>(context).add(VoteCount());
                if (state is VoteCounted) {
                  return Text('Success: ${state.count}');
                }
                return Text('Success: 0');
              },
            )
          ],
        ),
      ),
    );
  }
}
