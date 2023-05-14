import 'package:asset_manager_flutter/src/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/common/snack_bars.dart';

extension AsyncValueUi on AsyncValue {
  void showLoadingDialog(BuildContext context, AsyncValue<dynamic>? previous) {
    if (isLoading) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => WillPopScope(
          onWillPop: () => Future.value(false),
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if ((previous?.isLoading ?? false) && !isLoading) {
      ACoordinator.onBack();
    }
  }

  void showSuccess(BuildContext context, {required String content}) {
    if (!isRefreshing && hasValue) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(ASnackBar.success(content: content));
    }
  }

   void showFailure(BuildContext context, {required String content}) {
    if (!isRefreshing && hasValue) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(ASnackBar.failure(errorMessage: content));
    }
  }

  void showErrorLoadingSuccessState(
    BuildContext context, {
    required AsyncValue<dynamic>? previousState,
    String? errorMessage,
    required String successMessage,
  }) {
    showLoadingDialog(context, previousState);
    showSuccess(context, content: successMessage);
  }
}
