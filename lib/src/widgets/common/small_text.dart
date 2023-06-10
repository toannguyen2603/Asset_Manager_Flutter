import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/themes/styles.dart';
import 'package:flutter/material.dart';

import '../../constaints/app_sizes.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  FontWeight? fontWeight;

  SmallText({
    super.key,
    required this.text,
    this.color = AColors.textColor,
    this.size = 0,
    this.overFlow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: PStyle.poppins(context)!.copyWith(
          color: color,
          fontSize: size == 0 ? Sizes.p14 : size,
          fontWeight: fontWeight),
    );
  }
}
