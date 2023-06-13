import 'package:asset_manager_flutter/gen/assets.gen.dart';
import 'package:asset_manager_flutter/src/constaints/app_sizes.dart';
import 'package:asset_manager_flutter/src/screens/scan/view/scanner_view.dart';
import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/themes/styles.dart';
import 'package:asset_manager_flutter/src/widgets/common/snack_bars.dart';
import 'package:asset_manager_flutter/src/widgets/custom/custom_text_input.dart';
import 'package:asset_manager_flutter/src/widgets/common/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/form_validator.dart';
import '../../../../widgets/state/data_state.dart';
import '../../controller/auth_reponsitory.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInView> {
  bool _isValidate = true;
  bool isLoading = false;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

// key message
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void showSnack(String title) {
    final snackbar = SnackBar(
        content: Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 15,
      ),
    ));
    scaffoldMessengerKey.currentState?.showSnackBar(snackbar);
  }

  void _handleUserLogin() {
    FocusScope.of(context).unfocus();
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _isValidate = false;
        isLoading = false;
      });
    } else {
      setState(() {
        _isValidate = true;
        isLoading = true;
      });
      Map<String, dynamic> credentials = {
        'username': _usernameController.text,
        'password': _passwordController.text,
      };
      ref.read(authNotifier.notifier).login(credentials);
    }
  }

  setStateLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifier);

    ref.listen<DataState>(authNotifier, (_, state) {
      state.maybeWhen(
        success: (user) async {
          setStateLoading();
          final showSuccessfulMsg = ASnackBar.success(content: 'Login success');
          scaffoldMessengerKey.currentState?.showSnackBar(showSuccessfulMsg);
          login();
        },
        error: (err, _) {
          setStateLoading();
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
                Gaps.h24,
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Image.asset(
                    Assets.images.logo.path,
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 50,
                    right: 50,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(
                        double.maxFinite,
                        45,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // <-- Radius
                      ),
                    ),
                    onPressed: authState.maybeWhen(
                      loading: () => null,
                      orElse: () => _handleUserLogin,
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Login',
                            style: PStyle.poppins(context)!.copyWith(
                              fontSize: Sizes.p14,
                              fontWeight: FontWeight.bold,
                              color: AColors.white,
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    await Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ScannerView(),
          ),
        );
      },
    );
  }
}
