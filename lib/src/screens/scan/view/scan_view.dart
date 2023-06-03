import 'package:asset_manager_flutter/src/screens/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../constaints/app_sizes.dart';
import '../../../themes/colors.dart';
import '../../../themes/styles.dart';
import '../../../widgets/common/qr_scanner_overlay_shape.dart';
import '../../asset/view/property_view.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView>
    with SingleTickerProviderStateMixin {
  BarcodeCapture? capture;
  MobileScannerController controller = MobileScannerController();
  bool _isDetect = false;

  double _zoomFactor = 0.0;

  Future<void> onDetect(BarcodeCapture barcode) async {
    setState(() {
      this.capture = barcode;
      _isDetect = true;
    });
    handleScanner();
  }

  Future<void> handleScanner() async {
    try {
      if (capture == null) {}
      final String tag = await capture?.barcodes.first.rawValue ?? 'Unknown';
      if (!tag.isEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyScreen(),
          ),
        );
      }
      print('Tag is: $tag');
    } on PlatformException catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    final double heightAppBar = AppBar().preferredSize.height * 1.5;
    final double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      color: AColors.greenColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          MobileScanner(
                              // TODO: scanner
                              controller: controller,
                              startDelay: true,
                              onDetect: onDetect),
                          Positioned.fill(
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: QrScannerOverlayShape(
                                  borderColor:
                                      _isDetect ? Colors.yellow : Colors.white,
                                  borderLength: 20,
                                  borderWidth: 8,
                                  borderRadius: 5,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            // TODO: profile button
                            alignment: Alignment.topCenter,
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              margin: EdgeInsets.only(left: 15),
                              height: heightAppBar,
                              child: profileButton(),
                            ),
                          ),
                          Align(
                            // TODO: app bar title
                            alignment: Alignment.topCenter,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              height: heightAppBar,
                              width: widthScreen,
                              child: appBar(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 120,
                              child: Column(
                                children: [
                                  Slider(
                                    activeColor: Colors.white,
                                    inactiveColor: Colors.grey,
                                    value: _zoomFactor,
                                    onChanged: (value) {
                                      setState(() {
                                        _zoomFactor = value;
                                        controller.setZoomScale(value);
                                      });
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        color: Colors.white,
                                        icon: ValueListenableBuilder(
                                          valueListenable:
                                              controller.torchState,
                                          builder: (context, state, child) {
                                            if (state == null) {
                                              return const Icon(
                                                Icons.flash_off,
                                                color: Colors.grey,
                                              );
                                            }
                                            switch (state) {
                                              case TorchState.off:
                                                return const Icon(
                                                  Icons.flash_off,
                                                  color: Colors.grey,
                                                );
                                              case TorchState.on:
                                                return const Icon(
                                                  Icons.flash_on,
                                                  color: Colors.yellow,
                                                );
                                            }
                                          },
                                        ),
                                        iconSize: 32.0,
                                        onPressed: () =>
                                            controller.toggleTorch(),
                                      ),
                                      IconButton(
                                        color: Colors.white,
                                        icon: const Icon(Icons.image),
                                        iconSize: 32.0,
                                        onPressed: () async {
                                          final ImagePicker picker =
                                              ImagePicker();
                                          // Pick an image
                                          final XFile? image =
                                              await picker.pickImage(
                                            source: ImageSource.gallery,
                                          );
                                          if (image != null) {
                                            if (await controller
                                                .analyzeImage(image.path)) {
                                              if (!mounted) return;
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content:
                                                      Text('Barcode found!'),
                                                  backgroundColor: Colors.green,
                                                ),
                                              );
                                            } else {
                                              if (!mounted) return;
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content:
                                                      Text('No barcode found!'),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            }
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 1000));
    return true;
  }

  Widget profileButton() {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey.shade200.withOpacity(0.5), width: 1.0),
          color: Colors.grey.shade500.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(1000.0),
          onTap: () {
            navigationToProfile();
          },
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(
              Icons.person,
              size: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      width: 150,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200.withOpacity(0.5),
      ),
      child: Center(
        child: Text(
          'Scanner QR code',
          style: PStyle.poppins(context)!.copyWith(fontSize: Sizes.p13),
        ),
      ),
    );
  }

  Future<void> navigationToProfile() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileView(),
      ),
    );
  }
}
