import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:slick_slides/slick_slides.dart';

/// A slide that displays information about a person. It can have a name, title,
/// and an image.
class VoteSlide extends Slide {
  /// Creates a slide that displays information about a person. It can have a
  /// name, title, and an image.
  VoteSlide({
    required String title,
    required String name,
    required Widget content,
    super.notes,
    WidgetBuilder? backgroundBuilder,
    super.transition,
    super.theme,
    super.autoplayDuration,
  }) : super(
          builder: (context) {
            return ContentLayout(
              title: title == null ? null : Text(title),
              background: backgroundBuilder?.call(context),
              content: content,
            );
          },
        );

  /// Creates a slide that displays information about a person. It can have a
  /// name, title, and an image. This constructor uses [TextSpan]s instead of
  /// [String]s for the title and name to allow for rich text.
  VoteSlide.rich({
    required TextSpan title,
    required TextSpan name,
    required ImageProvider image,
    super.notes,
    WidgetBuilder? backgroundBuilder,
    super.transition,
    super.theme,
    super.autoplayDuration,
    super.audioSource,
  }) : super(
          builder: (context) {
            return PersonLayout(
              title: Text.rich(title),
              name: Text.rich(name),
              background: backgroundBuilder?.call(context),
              image: Image(
                image: image,
              ),
            );
          },
          onPrecache: (context) async {
            await precacheImage(
              image,
              context,
            );
          },
        );
}
