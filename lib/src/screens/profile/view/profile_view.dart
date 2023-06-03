import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constaints/app_sizes.dart';
import '../../../widgets/common/scaffold.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LScaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: PStyle.poppins(context)!.copyWith(
              fontSize: Sizes.p20,
              fontWeight: FontWeight.bold,
              color: AColors.darkText),
        ),
        leading: backButton(context),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }

  Widget backButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back),
    );
  }
}
