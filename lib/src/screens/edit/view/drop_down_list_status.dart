import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../../constaints/app_sizes.dart';

class DropDownListStatus extends StatelessWidget {
  const DropDownListStatus({
    super.key,
    required GlobalKey<FormState> formKey2,
    required this.formKey,
  }) : _formKey = formKey2;

  final GlobalKey<FormState> _formKey;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Status',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Gaps.h20,
            Form(
              key: formKey,
              child: DropDownTextField(
                textFieldDecoration: const InputDecoration(
                  hintText: 'Select item',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                initialValue: 'Pending',
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
                dropDownItemCount: 6,
                dropDownList: const [
                  DropDownValueModel(name: 'Ready to deploy', value: 1),
                  DropDownValueModel(name: 'Pending', value: 2),
                  DropDownValueModel(name: 'Archived', value: 3),
                  DropDownValueModel(name: 'Broken', value: 4),
                  DropDownValueModel(name: 'Lost', value: 5),
                  DropDownValueModel(name: 'OutOfRepair', value: 6),
                ],
                onChanged: (val) {
                  print(val);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
