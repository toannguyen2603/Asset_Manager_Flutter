import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../../constaints/app_sizes.dart';
import '../../../utils/status.dart';

typedef StatusCallback = void Function(int val);

class DropDownListMaintenance extends StatelessWidget {
  const DropDownListMaintenance({
    super.key,
    required GlobalKey<FormState> formKey2,
    required this.formKey,
    required this.callback,
  }) : _formKey = formKey2;

  final GlobalKey<FormState> _formKey;
  final GlobalKey<FormState> formKey;
  final StatusCallback callback;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Form(
        key: formKey,
        child: DropDownTextField(
          textFieldDecoration: const InputDecoration(
            hintText: 'Select item',
            labelText: 'Status', //label text of field
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
          ),
          initialValue: 'Maintenance',
          clearOption: true,
          keyboardType: TextInputType.number,
          clearIconProperty: IconProperty(
            color: Colors.grey,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Required field';
            } else {
              return null;
            }
          },
          dropDownItemCount: 7,
          dropDownList: const [
            DropDownValueModel(name: 'Maintenance', value: 1),
            DropDownValueModel(name: 'Repair', value: 2),
            DropDownValueModel(name: 'Upgrade', value: 3),
            DropDownValueModel(name: 'Testing', value: 4),
            DropDownValueModel(name: 'Calibration', value: 5),
            DropDownValueModel(name: 'SoftwareSupport', value: 6),
            DropDownValueModel(name: 'HardwareSupport', value: 7),
          ],
          onChanged: (val) {
            callback(val?.value);
          },
        ),
      ),
    );
  }
}
