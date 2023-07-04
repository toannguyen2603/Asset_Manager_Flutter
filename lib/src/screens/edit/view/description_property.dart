import 'package:asset_manager_flutter/src/utils/form_validator.dart';
import 'package:flutter/material.dart';

import '../../../constaints/app_sizes.dart';

class DescriptionProperty extends StatefulWidget {
  const DescriptionProperty({
    super.key,
    required this.textarea,
  });

  final TextEditingController textarea;

  @override
  State<DescriptionProperty> createState() => _DescriptionAssetState();
}

class _DescriptionAssetState extends State<DescriptionProperty> {
  bool _isValidate = false;
  @override
  void dispose() {
    widget.textarea.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.textarea.text.isEmpty) {
      setState(() {
        _isValidate = false;
      });
    } else {
      setState(() {
        _isValidate = true;
      });
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.h16,
          const Text(
            'Description',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Gaps.h20,
          TextField(
            controller: widget.textarea,
            keyboardType: TextInputType.multiline,
            maxLines: 10,
            decoration: InputDecoration(
              hintText: 'Enter description',
              errorText: _isValidate
                  ? FormValidator.validateDescription(widget.textarea.text)
                  : null,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
