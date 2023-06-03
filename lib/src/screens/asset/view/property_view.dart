import 'package:asset_manager_flutter/src/screens/scan/view/scan_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constaints/app_sizes.dart';
import '../../../themes/colors.dart';
import '../../../themes/styles.dart';

class PropertyScreen extends ConsumerStatefulWidget {
  const PropertyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AssetScreenState();
}

class _AssetScreenState extends ConsumerState<PropertyScreen> {
  final double heightAppBar = AppBar().preferredSize.height / 1.5;
  final cornerRadius = Radius.circular(30);
  final double paddingSize = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/flight.png"),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            left: 10,
            top: heightAppBar,
            child: Row(
              children: [
                backButton(context),
              ],
            ),
          ),
          Positioned(
            top: 320,
            child: Container(
              padding: EdgeInsets.only(
                  left: paddingSize,
                  right: paddingSize,
                  top: paddingSize + paddingSize),
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: BoxDecoration(
                color: AColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: cornerRadius,
                  topRight: cornerRadius,
                ),
              ),
              child: Column(children: [
                Text(
                  'MÀN CHIẾU QUANG HỌC DNP BLADE 153INCH (2.35:1)',
                  style: PStyle.poppins(context)!.copyWith(
                      fontSize: Sizes.p16, fontWeight: FontWeight.bold),
                )
              ]),
            ),
          )
        ],
      ),
      
    ));
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
