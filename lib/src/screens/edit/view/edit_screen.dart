import 'dart:io';

import 'package:asset_manager_flutter/src/screens/property/view/property_view.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constaints/app_sizes.dart';
import '../../../constaints/type_defs/type_defs.dart';
import '../../../themes/colors.dart';
import '../../../themes/styles.dart';
import '../../../widgets/common/scaffold.dart';
import '../../../widgets/state/data_state.dart';
import '../controller/edit_reponsitory.dart';
import 'description_property.dart';
import 'drop_down_list_status.dart';
import 'image_picker.dart';

typedef refreshCallBack = void Function(bool status);

class EditScreen extends ConsumerStatefulWidget {
  const EditScreen({
    Key? key,
    required this.status,
    required this.tag,
    required this.callback,
  }) : super(key: key);

  final int? status;
  final Tag? tag;
  final refreshCallBack callback;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditScreenState();
}

class _EditScreenState extends ConsumerState<EditScreen> {
  int? newStatus;

  XFile? imageFile;

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

  void _handleEditScreen() {
    FocusScope.of(context).unfocus();
    uploadImage();
    if (textarea.text.isEmpty || widget.tag == null || newStatus == null) {
      print('error');
    } else {
      _startLoading();
      Future.delayed(const Duration(seconds: 3));
      Map<String, dynamic> credentials = {
        'tag': widget.tag!,
        'status': newStatus,
        'description': textarea.text,
      };
      ref.read(editNotifier.notifier).editProperty(credentials);
    }
  }

  void uploadImage() {
    ref
        .read(uploadImageServiceProvider)
        .uploadingImage(widget.tag!, File(imageFile!.path));
  }

  @override
  Widget build(BuildContext context) {
    final editStatus = ref.watch(editNotifier);
    ref.listen<DataState>(editNotifier, (_, state) {
      state.maybeWhen(
        success: (user) async {
          print('success');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PropertyScreen(
                tag: widget.tag ?? '',
              ),
            ),
          );
          widget.callback(true);
        },
        error: (err, _) {
          print(err);
        },
        orElse: () {},
      );
    });

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
                setState(() {
                  newStatus = val;
                });
              },
            ),
            DescriptionProperty(textarea: textarea),
            ImagePickerView(
              errorCallback: (error) {
                print(error);
              },
              imageCallback: (image) {
                setState(() {
                  imageFile = image;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: editStatus.maybeWhen(
                  loading: () => null,
                  orElse: () => _handleEditScreen,
                ),
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
