import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../themes/colors.dart';

class Shimmer extends StatelessWidget {
  const Shimmer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Animate(
      onPlay: (controller) => controller.loop(),
      effects: const [
        ShimmerEffect(
          curve: Curves.easeOutCubic,
          // color: Colors.purple,
          colors: [AColors.loading, Colors.white, AColors.loading],
          duration: Duration(seconds: 2),
        )
      ],
      child: child,
    );
  }
}
