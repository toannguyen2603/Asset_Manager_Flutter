import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constaints/app_sizes.dart';

typedef OnPickImageCallback = void Function(XFile? image);
typedef ErrorImageCallback = void Function(String error);

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({
    super.key,
    required this.errorCallback,
    required this.imageCallback,
  });
  final ErrorImageCallback errorCallback;
  final OnPickImageCallback imageCallback;

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  XFile? imageFile;
  final ImagePicker _picker = ImagePicker();
  dynamic _pickImageError;

  Future<void> getImage(
    ImageSource source, {
    required BuildContext context,
  }) async {
    try {
      final _file = await _picker.pickImage(source: source);
      if (_file?.path != null) {
        setState(() {
          imageFile = _file;
        });
      }
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.h16,
          const Text(
            'Choose image',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Gaps.h20,
          Container(
            width: double.maxFinite,
            clipBehavior: Clip.hardEdge,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 160,
                  height: double.maxFinite,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showBottomSheetImageOption();
                    },
                    icon: const Icon(Icons.upload_file),
                    label: const Text(
                      'Choose image',
                      overflow: TextOverflow.ellipsis,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero), // <-- Radius
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        imageFile?.path.substring(150) ?? 'image',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheetImageOption() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext cont) {
          return CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  hiddenNavigator();
                  getImage(ImageSource.camera, context: context);
                },
                child: const Text(
                  'Use Camera',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  hiddenNavigator();
                  getImage(ImageSource.gallery, context: context);
                },
                child: const Text(
                  'Upload from file',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                hiddenNavigator();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 17.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        });
  }

  void hiddenNavigator() {
    Navigator.pop(context);
  }
}
