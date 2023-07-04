import 'package:asset_manager_flutter/src/constaints/app_sizes.dart';
import 'package:asset_manager_flutter/src/constaints/type_defs/type_defs.dart';
import 'package:asset_manager_flutter/src/screens/edit/model/lsupplier.dart';
import 'package:asset_manager_flutter/src/screens/maintenance/service/supplier_service.dart';
import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/themes/styles.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../utils/form_validator.dart';
import '../../../widgets/snack_bar/message_snack_bar.dart';
import '../../../widgets/state/data_state.dart';
import '../controller/maintenance_reponsitory.dart';
import 'drow_down_list_maintenance.dart';

class MaintenanceScreen extends ConsumerStatefulWidget {
  const MaintenanceScreen({
    super.key,
    required this.nameProperty,
    required this.nameSupplier,
    required this.propertyID,
  });

  final String nameProperty;

  final String nameSupplier;
  final int propertyID;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MaintenanceScreenState();
}

class _MaintenanceScreenState extends ConsumerState<MaintenanceScreen> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController propertyController = TextEditingController();
  TextEditingController supplierController = TextEditingController();

  // Drop down
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController _cnt;
  late MultiValueDropDownController _cntMulti;
  final formKey = GlobalKey<FormState>();

  UserId? userId;
  int newIndex = 0;

  SupplierService service = SupplierService();

  bool _isLoading = false;
  late LSupplier listSupplier;
  int indexSupplier = 0;
  bool _isValidate = false;
  @override
  void initState() {
    // TODO: implement initState
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    startDateController.text = '';
    endDateController.text = '';
    propertyController.text = widget.nameProperty;
    supplierController.text = widget.nameSupplier;
    getSupplier();
    super.initState();
  }

  void _startLoading() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }

    // Wait for 3 seconds
    // You can replace this with your own task like fetching data, proccessing images, etc
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> getSupplier() async {
    final listSupplier = await service.getSupplier();
    this.listSupplier = listSupplier;
    var index = await compareSupplier(supplierController.text);
    indexSupplier = index;
  }

  int compareSupplier(String name) {
    var index = 0;
    for (var i = 0; i < listSupplier.id!.length; i++) {
      if (listSupplier.name![i] == name) {
        index = listSupplier.id![i];
      }
    }
    return index;
  }

  void _handleCreateMaintenance() {
    if (endDateController.text.isEmpty || startDateController.text.isEmpty) {
      if (this.mounted) {
        setState(() {
          _isValidate = true;
        });
      }
    } else {
      if (this.mounted) {
        setState(() {
          _isValidate = false;
        });
      }
      _startLoading();
      Map<String, dynamic> credentials = {
        'assetID': widget.propertyID,
        'supplierID': indexSupplier,
        'type': newIndex,
        'startDate': startDateController.text,
        'endDate': endDateController.text
      };
      ref.read(maintenanceNotify.notifier).createMaintenance(credentials);
    }
  }

  @override
  Widget build(BuildContext context) {
    final editStatus = ref.watch(maintenanceNotify);

    ref.listen<DataState>(maintenanceNotify, (_, state) {
      state.maybeWhen(
        success: (user) {
          Navigator.pop(context);
        },
        error: (err, _) {
          print(err);
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Create maintenance',
          style: PStyle.poppins(context)!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.p20,
            color: AColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Gaps.h20,
              _PropertyField(
                label: 'Property',
                controller: propertyController,
              ),
              Gaps.h20,
              _PropertyField(
                label: 'Supplier',
                controller: supplierController,
              ),
              Gaps.h20,
              DropDownListMaintenance(
                formKey2: _formKey,
                formKey: formKey,
                callback: (val) {
                  setState(() {
                    newIndex = val;
                  });
                },
              ),
              Gaps.h20,
              TextFormField(
                controller: startDateController,
                readOnly: true,
                decoration: InputDecoration(
                    errorText: _isValidate
                        ? FormValidator.validateDate(
                            startDateController.text,
                          )
                        : null,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    suffixIcon:
                        const Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Date" //label text of field
                    ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    print(
                        'pickedDate ${pickedDate}'); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        'formattedDate ${formattedDate}'); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      startDateController.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              Gaps.h20,
              TextFormField(
                controller: endDateController,
                readOnly: true,
                decoration: InputDecoration(
                    errorText: _isValidate
                        ? FormValidator.validateDate(
                            endDateController.text,
                          )
                        : null,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    suffixIcon:
                        const Icon(Icons.calendar_today), //icon of text field
                    labelText: "End Date" //label text of field
                    ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  if (picked != null) {
                    print(
                        picked); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(picked);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      endDateController.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              Gaps.h20,
              ElevatedButton(
                onPressed: editStatus.maybeWhen(
                  loading: () => null,
                  orElse: () => _handleCreateMaintenance,
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
            ],
          ),
        ),
      ),
    );
  }
}

class _PropertyField extends StatelessWidget {
  const _PropertyField({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1)),
          labelText: label //label text of field

          ),
      readOnly: true,
    );
  }
}
