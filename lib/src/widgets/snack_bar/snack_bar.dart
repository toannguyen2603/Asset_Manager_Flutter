import 'package:asset_manager_flutter/src/constaints/app_sizes.dart';
import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../gen/assets.gen.dart';

Future<void> showBannerSnackBar({
  required String title,
  required String subtitle,
  required BuildContext context,
  required MobileScannerController controller,
  VoidCallback? onPressed,
  Color? backgroundColor,
  EdgeInsets? padding,
  int duration = 1,
}) async {
  final snackBar = SnackBar(
    duration: Duration(days: duration),
    width: MediaQuery.of(context).size.width / 1.5,
    padding: EdgeInsets.only(bottom: 100.0),
    content: Container(
      padding: const EdgeInsets.all(5),
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.7),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Image.asset(
              Assets.icons.warning.path,
              fit: BoxFit.cover,
            ),
          ),
          Gaps.w12,
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: Sizes.p12,
                    color: AColors.textColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AColors.textColor,
                    fontSize: Sizes.p13,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: onPressed,
              icon: Image.asset(
                Assets.icons.cancel.path,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    ),
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
  await ScaffoldMessenger.of(context)
      .showSnackBar(snackBar)
      .closed
      .then((value) {
    controller.start();
  });
}
