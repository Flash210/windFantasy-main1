import 'package:flutter/material.dart';

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  final bool fromLeft;
  final bool fromRight;
  final bool fromBottom;

  CustomPageRoute({
    required super.builder,
    super.settings,
    this.fromLeft = false,
    this.fromRight = false,
    this.fromBottom = false,
  });

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (fromLeft) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    } else if (fromRight) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    } else if (fromBottom) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    } else {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }
  }
}
