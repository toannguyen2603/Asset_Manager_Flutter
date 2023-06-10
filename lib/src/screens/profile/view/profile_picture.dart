import 'package:asset_manager_flutter/src/themes/styles.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../constaints/app_sizes.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    this.title,
    super.key,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 115,
          height: 115,
          child: CircleAvatar(
            backgroundImage: AssetImage(
              Assets.images.logo_splash.path,
            ),
          ),
        ),
        Gaps.h20,
        Text(
          title ?? '---',
          style: PStyle.poppins(context)!.copyWith(
            fontSize: Sizes.p16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
