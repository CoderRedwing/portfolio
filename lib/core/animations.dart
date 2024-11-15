import 'package:flutter/material.dart';

class Animations {
  // Fade-in animation
  static Widget fadeIn({required Widget child, required AnimationController controller, int duration = 500}) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0)
          .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut)),
      child: child,
    );
  }

  // Slide-in from the right animation
  static Widget slideInFromRight({required Widget child, required AnimationController controller}) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
          .animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut)),
      child: child,
    );
  }

  // Bounce-in animation
  static Widget bounceIn({required Widget child, required AnimationController controller}) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.8, end: 1.0)
          .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut)),
      child: child,
    );
  }

  // Fade-in delay animation
  static Widget fadeInWithDelay({required Widget child, required AnimationController controller, required int delay}) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(delay / 1000, 1.0, curve: Curves.easeInOut),
        ),
      ),
      child: child,
    );
  }
}
