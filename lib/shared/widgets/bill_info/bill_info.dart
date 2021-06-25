import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/bill_model.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_images.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/bill_list/bill_list_controller.dart';

class BillInfo extends StatefulWidget {
  BillInfo({Key? key}) : super(key: key);

  @override
  _BillInfoState createState() => _BillInfoState();
}

class _BillInfoState extends State<BillInfo> {
  final controller = BillListController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.secondary, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppImages.logomini,
                width: 56,
                height: 34,
                color: AppColors.background,
              ),
              Container(
                width: 1,
                height: 32,
                color: AppColors.background,
              ),
              ValueListenableBuilder<List<Bill>>(
                valueListenable: controller.billsNotifier,
                builder: (_, boletos, __) => Text.rich(
                  TextSpan(
                    text: "Você tem ",
                    style: AppTextStyles.captionBackground,
                    children: [
                      TextSpan(
                        text: "${boletos.length} boletos\n",
                        style: AppTextStyles.captionBoldBackground,
                      ),
                      TextSpan(
                        text: "cadastrados para pagar",
                        style: AppTextStyles.captionBackground,
                      ),
                    ],
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
