import 'dart:async';

import 'package:asset_manager_flutter/gen/assets.gen.dart';
import 'package:asset_manager_flutter/src/constaints/app_sizes.dart';
import 'package:asset_manager_flutter/src/widgets/Custom/custom_text_input.dart';
import 'package:asset_manager_flutter/src/widgets/common/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignInScreen extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RoundedLoadingButtonController _signInButtonController =
      RoundedLoadingButtonController();

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(Duration(seconds: 3), () {
      controller.reset();
    });
  }

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
                    height: 150,
                  )),
              ATextField(
                textEditController: _emailController,
                hintTextString: 'Enter Email',
                inputType: InputType.Email,
                cornerRadius: 5.0,
                maxLength: 24,
              ),
              Gaps.h20,
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
                    onPressed: () => {}, child: const Text('Forgot password')),
              ),
              Gaps.h24,
              RoundedLoadingButton(
                controller: _signInButtonController,
                onPressed: () {
                  _doSomething(_signInButtonController);
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
