import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:pay_flow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/custom_bottom_sheet/custom_bottom_sheet_widget.dart';
import 'package:pay_flow/shared/widgets/set_label_buttons/set_label_buttons_widget.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, '/insert_bill', arguments: controller.status.barcode);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                    child: controller.cameraController!.buildPreview());
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  'Escaneie o código de barras do boleto',
                  style: AppTextStyles.buttonBackground,
                ),
                backgroundColor: Colors.black,
                centerTitle: true,
                leading: BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.black.withOpacity(0.06),
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.black.withOpacity(0.06),
                  )),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: 'Inserir código do boleto',
                primaryOnPressed: () =>
                    Navigator.pushNamed(context, '/insert_bill'),
                secundaryLabel: 'Carregar da galeria',
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return Align(
                  alignment: Alignment.bottomLeft,
                  child: CustomBottomSheet(
                    title: 'Não foi possível identificar um código de barras.',
                    subtitle:
                        'Tente escanear novamente ou digite o código do seu boleto.',
                    primaryLabel: 'Escanear novamente',
                    primaryOnPressed: () => controller.scanWithCamera(),
                    secundaryLabel: 'Digitar Código',
                    secundaryOnPressed: () =>
                        Navigator.pushNamed(context, '/insert_bill'),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
