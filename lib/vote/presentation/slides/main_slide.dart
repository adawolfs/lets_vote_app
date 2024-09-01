import 'package:flutter/material.dart';
import 'package:lets_vote_app/vote/presentation/slides/vote/vote_slide.dart';
import 'package:lets_vote_app/vote/presentation/slides/vote/vote_view_widget.dart';
import 'package:slick_slides/slick_slides.dart';

const _defaultTransition = SlickFadeTransition(
  color: Colors.black,
);

class MainSlide extends StatelessWidget {
  const MainSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideDeck(
      slides: [
        VoteSlide(
          title: "Vote",
          name: "Alvin",
          content: const VoteViewWidget(),
        ),
      ],
    );
  }
}
