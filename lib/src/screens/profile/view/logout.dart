import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../constaints/app_sizes.dart';
import '../../../themes/colors.dart';
import '../../../themes/styles.dart';
import '../../../utils/session_manager.dart';
import '../../authentication/view/sign_in/sign_in_view.dart';

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

class buildAlertDialog extends StatelessWidget {
  const buildAlertDialog({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Logout'),
      content: const Text('Do you want logout?'),
      actions: [
        CupertinoDialogAction(
          child: Text('No'),
          onPressed: () {
            Navigator.pop(context);
          },
          isDefaultAction: true,
        ),
        CupertinoDialogAction(
          child: Text('Yes'),
          onPressed: () {
            SessionManager().clearAll();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SignInView(),
              ),
            );
          },
          isDestructiveAction: true,
        )
      ],
    );
  }
}
