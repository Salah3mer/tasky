// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:tasky/config/router/routes.dart';
// import 'package:tasky/core/utils/helper/widget/extension.dart';
// import 'package:tasky/features/home/presentation/cubits/home_cubit/home_cubit.dart';

// class QRScanner extends StatefulWidget {
//   const QRScanner({super.key});

//   @override
//   State<QRScanner> createState() => _QRScannerState();
// }

// class _QRScannerState extends State<QRScanner> {
//   final GlobalKey qrkey = GlobalKey(debugLabel: 'Qr');
//   Barcode? result;
//   QRViewController? controller;

//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('Scan QR Code')),
//         body: Column(
//           children: [
//             Expanded(
//                 flex: 5,
//                 child: QRView(key: qrkey, onQRViewCreated: _onCreatedView, )),
//             Expanded(
//               flex: 1,
//               child: result != null
//                   ? Center(child: Text(result!.code!))
//                   : const Center(child: Text('Scan Code')),
//             ),
//           ],
//         ));
//   }

//   void _onCreatedView(QRViewController controller) {
//      setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//         if (result != null) {
//           HomeCubit.get(context).getTaskByQr(qrID: scanData.code.toString());
//           context.pushReplacementNamed(Routes.task);
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
