import 'dart:convert';

import 'package:asset_manager_flutter/src/constaints/export_constraints.dart';
import 'package:asset_manager_flutter/src/screens/edit/view/edit_screen.dart';
import 'package:asset_manager_flutter/src/screens/maintenance/view/maintenance_screen.dart';
import 'package:asset_manager_flutter/src/screens/scan/view/scanner_view.dart';
import 'package:asset_manager_flutter/src/widgets/common/big_text.dart';
import 'package:asset_manager_flutter/src/widgets/common/small_text.dart';
import 'package:asset_manager_flutter/src/widgets/state/loading/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../constaints/type_defs/type_defs.dart';
import '../../../themes/colors.dart';
import '../../../utils/status.dart';
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
                    backgroundColor: AColors.white,
                    leading: backButton(context),
                    expandedHeight: 280,
                    flexibleSpace: FlexibleSpaceBar(
                        background: Image.memory(
                      base64Decode(data.image ?? ''),
                      width: double.maxFinite,
                      fit: BoxFit.contain,
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
                            fontWeight: FontWeight.bold,
                          ),
                          Gaps.h8,
                          BigText(
                            text: 'Details',
                          ),
                          Table(
                            columnWidths: const {
                              0: FlexColumnWidth(2),
                              1: FlexColumnWidth(4)
                            },
                            border: TableBorder.all(
                                width: 1.5, color: Colors.black),
                            children: [
                              _TableRow(
                                'Serial',
                                data.serial ?? '---',
                              ),
                              _TableRow(
                                'Cost',
                                NumberFormat.simpleCurrency(
                                        name: 'VND', decimalDigits: 2)
                                    .format(data.cost),
                              ),
                              _TableRow(
                                'Brand',
                                data.brand ?? '---',
                              ),
                              _TableRow(
                                'Purchase date',
                                getDate(data.purchaseDay),
                              ),
                              _TableRow(
                                'Warranty',
                                '${data.warranty} Month',
                              ),
                              _TableRow(
                                'Supplier',
                                data.supplier ?? '---',
                              ),
                              _TableRow(
                                'Location',
                                data.location ?? '---',
                              ),
                              _TableRow(
                                'Create day',
                                getDate(data.createDay),
                              ),
                              _TableRow(
                                'Update day',
                                getDate(data.updateDay),
                              ),
                              _TableRow(
                                'Check out',
                                data.isCheckOut ? 'Yes' : 'No',
                              ),
                            ],
                          ),
                          Gaps.h8,
                          BigText(text: 'Description'),
                          Gaps.h8,
                          Text(data.description == null
                              ? 'No description'
                              : '${data.description}'),
                          Gaps.h20,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.black, // Background color
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditView(status: data.status,),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  height: 30,
                                  child: Center(
                                    child: BigText(
                                      text: 'Edit',
                                      color: AColors.white,
                                      size: Sizes.p14,
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.black, // Background color
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MaintenanceScreen(),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  height: 30,
                                  child: Center(
                                    child: BigText(
                                      text: 'Maintenance',
                                      color: AColors.white,
                                      size: Sizes.p14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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

  TableRow _TableRow(String title, String description) {
    return TableRow(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              description,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ),
        ),
      ],
    );
  }

  Widget backButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ScannerView(),
          ),
        );
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }
}
