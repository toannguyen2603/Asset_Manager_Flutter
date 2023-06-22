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
  @override
  Widget build(BuildContext context) {
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
            decoration: const InputDecoration(
              hintText: 'Enter description',
              border: OutlineInputBorder(
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
