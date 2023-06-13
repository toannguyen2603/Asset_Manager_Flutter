import 'package:asset_manager_flutter/src/widgets/common/scaffold.dart';
import 'package:flutter/material.dart';

import 'package:dropdown_textfield/dropdown_textfield.dart';

import '../../../constaints/app_sizes.dart';
import 'drop_down_list_status.dart';

class EditView extends StatefulWidget {
  const EditView({Key? key}) : super(key: key);

  @override
  State<EditView> createState() => _TestPage2State();
}

class _TestPage2State extends State<EditView> {
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
        title: const Text('Update Asset'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropDownListStatus(formKey2: _formKey, formKey: formKey),
            DescriptionAsset(textarea: textarea),
            const UpdateImage(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  _isLoading ? null : _startLoading();
                },
                icon: _isLoading
                    ? const CircularProgressIndicator()
                    : const Icon(
                        Icons.add,
                      ),
                label: Text(
                  _isLoading ? 'Please wait ...' : 'Update',
                ),
                style: ElevatedButton.styleFrom(fixedSize: Size(300, 50)),
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
          const Text('Choose image'),
          Gaps.h20,
          Container(
            width: 50,
            height: 50,
            color: Colors.amber,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_enhance_outlined),
            ),
          ),
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
