import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:asset_manager_flutter/gen/assets.gen.dart';
import 'package:asset_manager_flutter/src/constaints/app_sizes.dart';
import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/widgets/custom/custom_text_input.dart';
import 'package:asset_manager_flutter/src/widgets/common/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RoundedLoadingButtonController _signInButtonController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
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
                    height: 150,
                  )),
              ATextField(
                textEditController: _emailController,
                hintTextString: 'Enter Username',
                inputType: InputType.Default,
                cornerRadius: 5.0,
                maxLength: 24,
              ),
              Gaps.h16,
              ATextField(
                textEditController: _passwordController,
                hintTextString: 'Enter Password',
                inputType: InputType.Password,
                cornerRadius: 5.0,
                textColor: Colors.black,
                maxLength: 16,
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: TextButton(
                    style: ButtonStyle(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () => {print('Click forgot password')},
                    child: const Text('Forgot password')),
              ),
              Gaps.h16,
              RoundedLoadingButton(
                controller: _signInButtonController,
                onPressed: () async => {
                  
                  await Flushbar(
                    message: 'Login success',
                    duration: Duration(seconds: 1),
                    icon: Icon(Icons.check),
                    backgroundColor: AColors.greenColor,
                  ).show(context),
                  _signInButtonController.stop(),
                  _signInButtonController.reset()
                },
                child: Text('Login'),
                borderRadius: 50,
                height: 48,
              )
            ],
          ),
        ),
      ),
    );
  }
}
