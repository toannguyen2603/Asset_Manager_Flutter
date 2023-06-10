import 'package:flutter/material.dart';

import '../../../constaints/app_sizes.dart';
import '../../../themes/colors.dart';
import '../../../themes/styles.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    super.key,
    required this.text,
    required this.icon,
  });

  final String? text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 22,
              height: 22,
              color: AColors.darkText,
            ),
            Gaps.w20,
            Expanded(
              child: Text(
                text ?? 'Unknown',
                style: PStyle.poppins(context)!.copyWith(
                  fontSize: Sizes.p14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
