import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../constaints/app_sizes.dart';
import '../../../themes/colors.dart';
import '../../../themes/styles.dart';

class Logout extends StatelessWidget {
  const Logout({
    super.key,
    required this.onPress,
  });

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
            backgroundColor: Colors.grey.shade200),
        child: Row(
          children: [
            Image.asset(
              Assets.icons.logout.path,
              width: 22,
              height: 22,
              color: AColors.primaryColor,
            ),
            Gaps.w20,
            Expanded(
              child: Text(
                'Log out',
                style: PStyle.poppins(context)!.copyWith(
                  fontSize: Sizes.p14,
                  fontWeight: FontWeight.bold,
                  color: AColors.primaryColor,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AColors.primaryColor,
              size: 20.0,
            )
          ],
        ),
        onPressed: onPress,
      ),
    );
  }
}
