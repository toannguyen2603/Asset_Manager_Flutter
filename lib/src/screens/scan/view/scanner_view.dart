import 'dart:async';

import 'package:asset_manager_flutter/src/screens/asset/service/property_service.dart';
import 'package:asset_manager_flutter/src/screens/profile/view/profile_view.dart';
import 'package:asset_manager_flutter/src/screens/scan/view/scanner_error.dart';
import 'package:asset_manager_flutter/src/themes/colors.dart';
import 'package:asset_manager_flutter/src/widgets/snack_bar/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../constaints/app_sizes.dart';
import '../../../themes/styles.dart';
import '../../../widgets/common/qr_scanner_overlay_shape.dart';
import '../../../widgets/state/loading/loading.dart';
import '../../asset/view/property_view.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView>
    with SingleTickerProviderStateMixin {
  bool isLoading = true;
  bool _isScannerQrCode = false;

  BarcodeCapture? capture;
  MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
    torchEnabled: false,
  );

  PropertyScanner propertyController = PropertyScanner();

  double _zoomFactor = 0.0;

  loadData() {
    Timer(const Duration(seconds: 5), () {
      setState(
        () {
          isLoading = false;
        },
      );
    });
  }

  Future<void> onDetect(BarcodeCapture capture) async {
    setState(() {
      _isScannerQrCode = true;
    });
    final Barcode barcode = capture.barcodes.first;
    if (barcode.rawValue == null) {
    } else {
      final String code = barcode.rawValue!;
      if (_isValidQrCode(code)) {
        notifyClients(code).then(
          (state) {
            if (state) {
              stopCamera();
              showBannerSnackBar(
                title: 'Mã không hợp lệ',
                subtitle: 'Vui lòng quét mã khác',
                context: context,
                backgroundColor: Colors.red[700],
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  startCamera();
                },
                controller: controller,
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PropertyScreen(
                    tag: code,
                  ),
                ),
              );
            }
          },
        );
      } else {
        stopCamera();
        showBannerSnackBar(
          title: 'Mã không hợp lệ',
          subtitle: 'Vui lòng quét mã khác',
          context: context,
          backgroundColor: Colors.yellow[700],
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            startCamera();
          },
          controller: controller,
        );
      }
    }
  }

  Future<void> startCamera() async {
    await controller.start();
  }

  Future<void> stopCamera() async {
    await controller.stop();
  }

  Future<bool> notifyClients(String tag) async {
    final property = await propertyController.getProperty(tag);
    if (property.error == true) {
      return true;
    }
    return false;
  }

  //TODO: Check valid Qrcode
  bool _isValidQrCode(String code) {
    String codePattern = r'^[a-zA-Z0-9]{6}$';
    RegExp regExp = RegExp(codePattern);
    if (!regExp.hasMatch(code)) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    loadData();
    startCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double heightAppBar = AppBar().preferredSize.height * 1.5;
    final double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AColors.background,
              child: Center(
                child: const LoadingState.large(),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      MobileScanner(
                        controller: controller,
                        errorBuilder: (context, error, child) {
                          return ScannerErrorWidget(error: error);
                        },
                        startDelay: true,
                        onDetect: onDetect,
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: ShapeDecoration(
                            shape: QrScannerOverlayShape(
                              borderColor: _isScannerQrCode
                                  ? Colors.yellow
                                  : Colors.white,
                              borderLength: 20,
                              borderWidth: 8,
                              borderRadius: 5,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(left: 15),
                          height: heightAppBar,
                          child: profileButton(),
                        ),
                      ),
                      Align(
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
                                  flashTorch(),
                                  pickImage(),
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
            child: Tooltip(
              message: 'Profile',
              child: Icon(
                Icons.person,
                size: 20.0,
                color: Colors.white,
              ),
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
    stopCamera();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileView(),
      ),
    );
  }

  Widget flashTorch() {
    return IconButton(
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
    );
  }

  Widget pickImage() {
    return IconButton(
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
    );
  }
}
