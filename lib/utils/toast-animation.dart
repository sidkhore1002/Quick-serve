import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SlideInToastMessageAnimation extends StatelessWidget {
  final Widget child;

  SlideInToastMessageAnimation(this.child);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final tween = MultiTrackTween([
      // ignore: deprecated_member_use
      Track("translateY")
          .add(
            Duration(milliseconds: 250),
            Tween(begin: 100.0, end: 0.0),
            curve: Curves.easeOut,
          )
          .add(Duration(seconds: 3), Tween(begin: 0.0, end: 0.0))
          .add(Duration(milliseconds: 250), Tween(begin: 0.0, end: 100.0),
              curve: Curves.easeIn),

      // ignore: deprecated_member_use
      Track("opacity")
          .add(Duration(milliseconds: 250), Tween(begin: 0.0, end: 1.0))
          .add(Duration(seconds: 3), Tween(begin: 1.0, end: 1.0))
          .add(Duration(milliseconds: 250), Tween(begin: 1.0, end: 0.0)),
    ]);

    // ignore: deprecated_member_use
    return ControlledAnimation(
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}
