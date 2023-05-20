import 'package:asset_manager_flutter/gen/assets.gen.dart';
import 'package:asset_manager_flutter/src/constaints/app_sizes.dart';
import 'package:asset_manager_flutter/src/widgets/common/snack_bars.dart';
import 'package:asset_manager_flutter/src/widgets/custom/custom_text_input.dart';
import 'package:asset_manager_flutter/src/widgets/common/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../widgets/state/data_state.dart';
import '../../controller/auth_reponsitory.dart';

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

  bool _isValidate = true;

  void _handleUserLogin() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _isValidate = false;
      });
      _signInButtonController.reset();
      _signInButtonController.stop();
    } else {
      setState(() {
        _isValidate = true;
      });
      _signInButtonController.reset();
      _signInButtonController.stop();
      Map<String, dynamic> credentials = {
        'userName': _emailController.text,
        'password': _passwordController.text,
      };
      ref.read(authNotifier.notifier).login(credentials);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifier);

    ref.listen<DataState>(authNotifier, (_, state) {
      state.maybeWhen(
        success: (user) {
          final showError = ASnackBar.success(content: 'Login success');
          ScaffoldMessenger.of(context).showSnackBar(showError);
        },
        error: (err, _) {
          final showError = ASnackBar.failure(errorMessage: err.toString());
          ScaffoldMessenger.of(context).showSnackBar(showError);
        },
        orElse: () {},
      );
    });

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
                errorText: _isValidate ? null : 'Username cannot be empty',
                hintTextString: 'Enter Username',
                inputType: InputType.Default,
                cornerRadius: 5.0,
                maxLength: 24,
              ),
              Gaps.h16,
              ATextField(
                textEditController: _passwordController,
                errorText: _isValidate ? null : 'Password cannot be empty',
                hintTextString: 'Enter Password',
                inputType: InputType.Password,
                cornerRadius: 5.0,
                textColor: Colors.black,
                maxLength: 16,
              ),
              Gaps.h16,
              RoundedLoadingButton(
                controller: _signInButtonController,
                onPressed: authState.maybeWhen(
                  loading: () => null,
                  orElse: () => _handleUserLogin,
                ),
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
