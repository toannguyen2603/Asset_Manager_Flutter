import 'package:asset_manager_flutter/src/widgets/common/scaffold.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LScaffold(
        body: SingleChildScrollView(
      child: Column(),
    ));
  }
}
