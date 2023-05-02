import 'package:asset_manager_flutter/gen/assets.gen.dart';
import 'package:asset_manager_flutter/src/constaints/app_sizes.dart';
import 'package:asset_manager_flutter/src/constaints/ui_paramester.dart';
import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/themes/styles.dart';
import 'package:asset_manager_flutter/src/widgets/Custom/custom_text_input.dart';
import 'package:asset_manager_flutter/src/widgets/common/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LScaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Image.asset(
                    Assets.images.logo.path,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  )),
              ATextField(
                textEditController: _emailController,
                hintTextString: 'Enter Email',
                inputType: InputType.Email,
                enableBorder: true,
                cornerRadius: 5.0,
                maxLength: 24,
              ),
              Gaps.h20,
              ATextField(
                textEditController: _passwordController,
                hintTextString: 'Enter Password',
                inputType: InputType.Password,
                enableBorder: true,
                cornerRadius: 5.0,
                maxLength: 16,
                prefixIcon:
                    Icon(Icons.lock, color: Theme.of(context).primaryColor),
              ),
              Gaps.h16,
              Container(
                  margin: const EdgeInsets.all(16),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: PColors.primaryColor,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Submit',
                    style: PStyle.poppins(context)?.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton(
      {required this.onPressed, required this.image, required this.label});

  final VoidCallback onPressed;
  final String image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints(minHeight: 50, minWidth: double.infinity),
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: OutlinedButton.icon(
          onPressed: onPressed,
          icon: FittedBox(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox.square(
                dimension: UiParameters.iconSize,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
          label: Text(
            label,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
