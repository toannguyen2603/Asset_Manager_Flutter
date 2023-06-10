import 'dart:convert';
import 'dart:ffi';

import 'package:asset_manager_flutter/src/constaints/export_constraints.dart';
import 'package:asset_manager_flutter/src/screens/scan/view/scan_view.dart';
import 'package:asset_manager_flutter/src/widgets/common/big_text.dart';
import 'package:asset_manager_flutter/src/widgets/common/double_row.dart';
import 'package:asset_manager_flutter/src/widgets/common/small_text.dart';
import 'package:asset_manager_flutter/src/widgets/state/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../constaints/type_defs/type_defs.dart';
import '../../../themes/colors.dart';
import '../../../utils/status.dart';
import '../../../widgets/common/submit_button.dart';
import '../controller/property_reponsitory.dart';

class PropertyScreen extends ConsumerWidget {
  const PropertyScreen({
    super.key,
    required this.tag,
  });

  final Tag tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String getDate(DateTime? date) {
      var formatter = DateFormat('dd-MM-yyyy');
      String formatDate = date == null ? 'dd/MM/yyyy' : formatter.format(date);
      return formatDate;
    }

    final state = ref.watch(propertyProvider(tag));
    return Scaffold(
        body: state.when(
            data: (data) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    leading: backButton(context),
                    expandedHeight: 300,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Image.memory(
                      base64Decode(data.image ?? ''),
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    )),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: UiParameters.paddingSize,
                        left: UiParameters.paddingSize,
                        right: UiParameters.paddingSize,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: data.name ?? '--'),
                          Gaps.h8,
                          SmallText(
                            text:
                                '${data.type} - ${ref.read(statusProvider).checkStatus(data.status ?? 0)}',
                            size: Sizes.p13,
                          ),
                          Gaps.h8,
                          BigText(
                            text: 'Details',
                            size: Sizes.p20,
                          ),
                          Gaps.h8,
                          DoubleRow(
                            title: 'type',
                            description: data.type ?? '--',
                          ),
                          Gaps.h8,
                          DoubleRow(
                            title: 'Serial',
                            description: data.serial ?? '--',
                          ),
                          Gaps.h8,
                          DoubleRow(
                            title: 'Cost',
                            description: NumberFormat.simpleCurrency(
                                    name: 'VND', decimalDigits: 2)
                                .format(data.cost),
                          ),
                          Gaps.h8,
                          DoubleRow(
                            title: 'Brand',
                            description: data.brand ?? '--',
                          ),
                          Gaps.h8,
                          DoubleRow(
                            title: 'Purchase date',
                            description: getDate(data.purchaseDay),
                          ),
                          Gaps.h8,
                          DoubleRow(
                            title: 'Warranty',
                            description: '${data.warranty} month',
                          ),
                          Gaps.h8,
                          DoubleRow(
                            title: 'Supplier',
                            description: data.supplier ?? '---',
                          ),
                          Gaps.h8,
                          DoubleRow(
                            title: 'Create at',
                            description: getDate(data.createDay),
                          ),
                          Gaps.h8,
                          DoubleRow(
                            title: 'Update at',
                            description: getDate(data.updateDay),
                          ),
                          Gaps.h8,
                          DoubleRow(
                            title: 'Check-out',
                            description: data.isCheckOut ? 'Yes' : 'No',
                          ),
                          Gaps.h8,
                          BigText(text: 'Description'),
                          Gaps.h8,
                          Text(data.description == null
                              ? 'No description'
                              : '${data.description}'),
                          Gaps.h20,
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SubmitButton(label: 'Edit'),
                              SubmitButton(label: 'Maintenance'),
                            ],
                          ),
                          Gaps.h32,
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            error: (_, __) => const Center(
                  child: Text('No lectures'),
                ),
            loading: LoadingState.new));
  }

  Widget backButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ScannerView(),
            ));
      },
      icon: Icon(
        Icons.arrow_back,
        color: AColors.white,
      ),
    );
  }
}
