import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:tasky/config/router/routes.dart';
import 'package:tasky/config/styles/app_colors.dart';
import 'package:tasky/core/utils/app_constans.dart';
import 'package:tasky/core/utils/helper/widget/extension.dart';
import 'package:tasky/core/utils/local/cash_helper.dart';
import 'package:tasky/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:tasky/features/home/presentation/widget/qr_scanner.dart';

class CustomFloatingButtons extends StatelessWidget {
  const CustomFloatingButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            radius: 28,
            splashColor: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20),
            onTap: () async {
              final qrCode = await FlutterBarcodeScanner.scanBarcode(
                  '#ff6666', 'Cancel', true, ScanMode.QR);

              HomeCubit.get(context).getTaskByQr(qrID: qrCode).then((val){
                context.pushReplacementNamed(Routes.task,
                  arguments: HomeCubit.get(context).qrTask);
              });
              
            },
            child: CircleAvatar(
                backgroundColor: AppColor.secFloatingActionButton,
                radius: 28,
                child: Icon(
                  FontAwesomeIcons.qrcode,
                  color: AppColor.primaryColor,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            splashColor: Colors.deepPurple,
            radius: 32,
            borderRadius: BorderRadius.circular(24),
            hoverColor: Colors.deepPurple,
            onTap: () {
              context.pushNamed(Routes.newTask);
            },
            child: CircleAvatar(
                backgroundColor: AppColor.primaryColor,
                radius: 32,
                child: const Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
