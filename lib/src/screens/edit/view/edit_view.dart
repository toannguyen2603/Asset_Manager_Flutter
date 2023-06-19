import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/themes/styles.dart';
import 'package:asset_manager_flutter/src/widgets/common/scaffold.dart';
import 'package:flutter/material.dart';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constaints/app_sizes.dart';
import 'drop_down_list_status.dart';

class EditView extends StatefulWidget {
  const EditView({Key? key}) : super(key: key);

  @override
  State<EditView> createState() => _TestPage2State();
}

class _TestPage2State extends State<EditView> {
  // Drop down
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  final formKey = GlobalKey<FormState>();

  TextEditingController textarea = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  void _startLoading() async {
    setState(() {
      _isLoading = true;
    });

    // Wait for 3 seconds
    // You can replace this with your own task like fetching data, proccessing images, etc
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      appBar: AppBar(
        title: Text(
          'Edit Property',
          style: PStyle.poppins(context)!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.p20,
            color: AColors.white,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropDownListStatus(formKey2: _formKey, formKey: formKey),
            DescriptionAsset(textarea: textarea),
            const UpdateImage(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  _isLoading ? null : _startLoading();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 50),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  _isLoading ? 'Please wait ...' : 'Submit',
                  style: PStyle.poppins(context)!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AColors.white,
                    fontSize: Sizes.p14,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UpdateImage extends StatelessWidget {
  const UpdateImage({
    super.key,
  });

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
                    width: 180,
                    height: double.maxFinite,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final ImagePicker picker = ImagePicker();
                        // Pick an image
                        final XFile? image = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        print('Get Image: ${image}');
                      },
                      icon: const Icon(Icons.upload_file),
                      label: const Text(
                        'Choose image file ...',
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
                          'wall.png',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class DescriptionAsset extends StatefulWidget {
  const DescriptionAsset({
    super.key,
    required this.textarea,
  });

  final TextEditingController textarea;

  @override
  State<DescriptionAsset> createState() => _DescriptionAssetState();
}

class _DescriptionAssetState extends State<DescriptionAsset> {
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
    ;
  }
}
