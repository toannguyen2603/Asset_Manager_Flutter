import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/themes/styles.dart';
import 'package:asset_manager_flutter/src/widgets/common/scaffold.dart';
import 'package:flutter/material.dart';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import '../../../constaints/app_sizes.dart';
import 'description_property.dart';
import 'drop_down_list_status.dart';
import 'image_picker.dart';

class EditView extends StatefulWidget {
  const EditView({
    Key? key,
    required this.status,
  }) : super(key: key);

  final int? status;

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
            DropDownListStatus(
              formKey2: _formKey,
              formKey: formKey,
              status: widget.status ?? 1,
              callback: (val) {
                print('Result dropdown: ${val}');
              },
            ),
            DescriptionProperty(textarea: textarea),
            ImagePickerView(
              errorCallback: (error) {
                print(error);
              },
              imageCallback: (image) {},
            ),
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
