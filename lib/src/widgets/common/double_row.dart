import 'dart:ui';

import 'package:asset_manager_flutter/src/widgets/common/small_text.dart';
import 'package:flutter/material.dart';

import '../../constaints/app_sizes.dart';

// ignore: must_be_immutable
class DoubleRow extends StatelessWidget {
  final String title;
  String? description;

  DoubleRow({
    super.key,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmallText(
          text: '$title :',
          fontWeight: FontWeight.bold,
        ),
        Gaps.w12,
        SmallText(text: description == null ? 'Unknown' : '${description}'),
      ],
    );
  }
}
