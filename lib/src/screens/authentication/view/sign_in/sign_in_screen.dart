import 'package:asset_manager_flutter/gen/assets.gen.dart';
import 'package:asset_manager_flutter/src/constaints/app_sizes.dart';
import 'package:asset_manager_flutter/src/screens/scan/view/scan_view.dart';
import 'package:asset_manager_flutter/src/widgets/common/snack_bars.dart';
import 'package:asset_manager_flutter/src/widgets/custom/custom_text_input.dart';
import 'package:asset_manager_flutter/src/widgets/common/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../utils/form_validator.dart';
import '../../../../widgets/state/data_state.dart';
import '../../controller/auth_reponsitory.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final RoundedLoadingButtonController _signInButtonController =
      RoundedLoadingButtonController();

// key message
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void showSnack(String title) {
    final snackbar = SnackBar(
        content: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
      ),
    ));
    scaffoldMessengerKey.currentState?.showSnackBar(snackbar);
  }

  bool _isValidate = true;

  void _handleUserLogin() {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
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
        'username': _usernameController.text,
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
        success: (user) async {
          final showSuccessfulMsg = ASnackBar.success(content: 'Login success');
          scaffoldMessengerKey.currentState?.showSnackBar(showSuccessfulMsg);
          login();
        },
        error: (err, _) {
          final showError = ASnackBar.failure(errorMessage: err.toString());
          scaffoldMessengerKey.currentState?.showSnackBar(showError);
        },
        orElse: () {},
      );
    });

    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: LScaffold(
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
                  textEditController: _usernameController,
                  errorText: _isValidate
                      ? null
                      : FormValidator.validateUserName(
                          _usernameController.text,
                        ),
                  hintTextString: 'Enter Username',
                  inputType: InputType.Default,
                  cornerRadius: 5.0,
                  maxLength: 24,
                ),
                Gaps.h16,
                ATextField(
                  textEditController: _passwordController,
                  errorText: _isValidate
                      ? null
                      : FormValidator.validatePassword(
                          _passwordController.text),
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
      ),
    );
  }

  Future<void> login() async {
    await new Future.delayed(Duration(milliseconds: 1000), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScannerView(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
