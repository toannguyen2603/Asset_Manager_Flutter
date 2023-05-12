import 'package:asset_manager_flutter/src/constaints/app_sizes.dart';
import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../widgets/common/qr_scanner_overlay_shape.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView>
    with SingleTickerProviderStateMixin {
  BarcodeCapture? capture;
  MobileScannerController controller = MobileScannerController();

  double _zoomFactor = 0.0;

  Future<void> onDetect(BarcodeCapture barcode) async {
    setState(() {
      this.capture = barcode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scanner',
          style: PStyle.poppins(context)!.copyWith(
            color: AColors.textColor,
            fontSize: Sizes.p16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
      ),
      body: SafeArea(
          child: Container(
        child: Stack(children: [
          MobileScanner(controller: controller, onDetect: onDetect),
          Positioned.fill(
            child: Container(
              decoration: ShapeDecoration(
                shape: QrScannerOverlayShape(
                  borderColor: Colors.white,
                  borderLength: 20,
                  borderWidth: 4,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        color: Colors.white,
                        icon: ValueListenableBuilder(
                          valueListenable: controller.torchState,
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
                        onPressed: () => controller.toggleTorch(),
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: ValueListenableBuilder(
                          valueListenable: controller.cameraFacingState,
                          builder: (context, state, child) {
                            if (state == null) {
                              return const Icon(Icons.camera_front);
                            }
                            switch (state as CameraFacing) {
                              case CameraFacing.front:
                                return const Icon(Icons.camera_front);
                              case CameraFacing.back:
                                return const Icon(Icons.camera_rear);
                            }
                          },
                        ),
                        iconSize: 32.0,
                        onPressed: () => controller.switchCamera(),
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.image),
                        iconSize: 32.0,
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          // Pick an image
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {
                            if (await controller.analyzeImage(image.path)) {
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Barcode found!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else {
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('No barcode found!'),
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
        ]),
      )),
    );
  }
}

