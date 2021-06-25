import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/bill_list/bill_list_controller.dart';
import 'package:pay_flow/shared/widgets/bill_list/bill_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final BillListController controller = BillListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Row(
              children: [
                Text("Meu extrato", style: AppTextStyles.titleBoldHeading),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: BillList(
              key: UniqueKey(), controller: controller,
            ),
          )
        ],
      ),
    );
  }
}
