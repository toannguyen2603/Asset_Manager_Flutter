import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/themes/styles.dart';
import 'package:flutter/material.dart';

import '../../constaints/app_sizes.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText({
    super.key,
    required this.text,
    this.color = AColors.textColor,
    this.size = 0,
    this.overFlow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: overFlow,
      style: PStyle.poppins(context)!.copyWith(
        color: color,
        fontSize: size == 0 ? Sizes.p16 : size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
