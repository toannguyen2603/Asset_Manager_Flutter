import 'package:asset_manager_flutter/src/widgets/common/big_text.dart';
import 'package:flutter/material.dart';

import '../../constaints/app_sizes.dart';

class SubmitButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPress;
  const SubmitButton({
    super.key,
    required this.label,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onPress,
        child: Container(
          width: MediaQuery.of(context).size.width / 3.5,
          height: 30,
          child: Center(
            child: BigText(
              text: label,
              size: Sizes.p14,
            ),
          ),
        ));
  }
}
