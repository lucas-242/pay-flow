import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/bill_info/bill_info.dart';
import 'package:pay_flow/shared/widgets/bill_list/bill_list_controller.dart';
import 'package:pay_flow/shared/widgets/bill_list/bill_list_widget.dart';

class MyBillsPage extends StatefulWidget {
  const MyBillsPage({Key? key}) : super(key: key);

  @override
  _MyBillsPageState createState() => _MyBillsPageState();
}

class _MyBillsPageState extends State<MyBillsPage> {
  final BillListController controller = BillListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 80,
            child: Stack(
              children: [
                Container(
                  height: 40,
                  color: AppColors.primary,
                ),
                AnimatedCard(
                  direction: AnimatedCardDirection.top,
                  child: BillInfo(
                    key: UniqueKey(),
                  ),
                ),
                // BillInfo()
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Row(
              children: [
                Text("Meus boletos", style: AppTextStyles.titleBoldHeading),
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
