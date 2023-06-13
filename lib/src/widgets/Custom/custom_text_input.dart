import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constaints/export_constraints.dart';

class ATextField extends StatefulWidget {
  const ATextField({
    super.key,
    required this.hintTextString,
    required this.textEditController,
    required this.inputType,
    this.themeColor,
    this.cornerRadius,
    this.maxLength,
    this.prefixIcon,
    this.textColor,
    this.errorMessage,
    this.labelText,
    this.suffixIcon,
    this.textInputAction,
    this.errorText,
  });

  // ignore: prefer_typing_uninitialized_variables
  final hintTextString;
  final TextEditingController? textEditController;
  final InputType? inputType;
  final Color? themeColor;
  final double? cornerRadius;
  final int? maxLength;
  final Widget? prefixIcon;
  final Color? textColor;
  final String? errorMessage;
  final String? labelText;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final String? errorText;

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

// input text state
class _CustomTextInputState extends State<ATextField> {
  bool visibility = false;
  int oldTextSize = 0;

  // build method for UI rendering
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: TextField(
        controller: widget.textEditController,
        decoration: InputDecoration(
          hintText: widget.hintTextString as String,
          errorText: widget.errorText,
          counterText: '',
          labelStyle: getTextStyle(),
          prefixIcon: widget.prefixIcon ?? getPrefixIcon(),
          suffixIcon: widget.suffixIcon ?? getSuffixIcon(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AColors.lightGrey, width: 1.8),
          ),
        ),
        keyboardType: getInputType(),
        obscureText: widget.inputType == InputType.Password && !visibility,
        style: TextStyle(
          color: widget.textColor ?? Colors.black,
        ),
        inputFormatters: [getFormatter()],
        textInputAction: widget.textInputAction ?? getInputAction(),
      ),
    );
  }

  // formatter on basis of text input type
  TextInputFormatter getFormatter() {
    return TextInputFormatter.withFunction((oldValue, newValue) => newValue);
  }

  // text style for text input
  TextStyle getTextStyle() {
    return TextStyle(color: widget.themeColor ?? AColors.lightGrey);
  }

  // return input type for setting keyboard
  TextInputType getInputType() {
    switch (widget.inputType) {
      case InputType.Default:
        return TextInputType.text;
      case InputType.Email:
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  // get max length of text
  int getMaxLength() {
    switch (widget.inputType) {
      case InputType.Default:
        return 36;
      case InputType.Email:
        return 36;
      case InputType.Password:
        return 24;
      default:
        return 36;
    }
  }

  // get prefix Icon
  Icon getPrefixIcon() {
    switch (widget.inputType) {
      case InputType.Default:
        return getIcon(Icons.person);
      case InputType.Email:
        return getIcon(Icons.email);
      case InputType.Password:
        return getIcon(Icons.lock);
      default:
        return getIcon(Icons.person);
    }
  }

  Icon getIcon(IconData icon) {
    return Icon(
      icon,
      color: widget.themeColor ?? AColors.lightGrey,
    );
  }

  // get input action keyboard
  TextInputAction getInputAction() {
    if (widget.inputType == InputType.Default) {
      return TextInputAction.next;
    } else {
      return TextInputAction.done;
    }
  }

  // get suffix icon
  Widget getSuffixIcon() {
    if (widget.inputType == InputType.Password) {
      return IconButton(
        onPressed: () {
          visibility = !visibility;
          setState(() {});
        },
        icon: Icon(
          visibility ? Icons.visibility : Icons.visibility_off,
          color: widget.themeColor ?? AColors.lightGrey,
          size: UiParameters.iconSize,
        ),
      );
    } else {
      if (widget.textEditController!.text.isNotEmpty) {
        return IconButton(
          onPressed: () {
            setState(() {
              widget.textEditController!.clear();
            });
          },
          icon: Icon(
            Icons.cancel,
            color: widget.themeColor ?? AColors.lightGrey,
            size: UiParameters.iconSize,
          ),
        );
      } else {
        return const Opacity(opacity: 0, child: Icon(Icons.phone));
      }
    }
  }
}

//input types
enum InputType { Default, Email, Password }
