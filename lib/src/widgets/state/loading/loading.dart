import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../gen/assets.gen.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
    this.dimension = 100.0,
  });

  const LoadingState.large({super.key}) : dimension = 250.0;

  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: dimension,
        child: Center(
          child: Lottie.asset(Assets.lotties.loading),
        ),
      ),
    );
  }
}
