import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/common/app_bar.dart';
import '../../../widgets/common/scaffold.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LScaffold(
        body: SingleChildScrollView(
      child: Column(),
    ));
  }
}
