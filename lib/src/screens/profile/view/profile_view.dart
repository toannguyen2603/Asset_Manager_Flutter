import 'package:asset_manager_flutter/src/screens/profile/view/profile_information.dart';
import 'package:asset_manager_flutter/src/screens/profile/view/profile_picture.dart';
import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/themes/styles.dart';
import 'package:asset_manager_flutter/src/utils/session_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../constaints/app_sizes.dart';
import '../../../widgets/common/scaffold.dart';
import 'logout.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  SessionManager manager = SessionManager();
  String? email;
  String? role;
  String? name;
  String? phone;

  _getInfoUser() {
    manager.getEmail().then((value) {
      print('Email of user ${value.email}');
      email = value.email;
      role = value.role;
      name = value.userName;
      phone = value.phoneNumber;
    });
  }

  @override
  void initState() {
    _getInfoUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _showAlertDialog(BuildContext context) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('Alert'),
          content: const Text('Proceed with destructive action?'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
    }

    return LScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        child: Column(
          children: [
            ProfilePicture(
              title: name,
            ),
            Gaps.h20,
            ProfileInformation(
              icon: Assets.icons.email.path,
              text: email,
            ),
            ProfileInformation(
              icon: Assets.icons.phone.path,
              text: phone,
            ),
            ProfileInformation(
              icon: Assets.icons.role.path,
              text: role,
            ),
            Logout(
              onPress: () {
                showDialog(
                    context: context, builder: (_) => const buildAlertDialog());
              },
            )
          ],
        ),
      ),
    );
  }

  Widget backButton(BuildContext context) {
    return IconButton(
      color: Colors.black,
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back),
    );
  }
}



