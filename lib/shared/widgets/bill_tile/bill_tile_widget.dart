import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/bill_model.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

class BillTile extends StatelessWidget {
  final Bill bill;
  const BillTile({Key? key, required this.bill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            bill.name ?? 'Boleto sem nome',
            style: AppTextStyles.titleListTile,
          ),
          subtitle: Text(
            'Vence em ${bill.dueDate}',
            style: AppTextStyles.captionBody,
          ),
          trailing: Text.rich(TextSpan(
            text: "R\$ ",
            style: AppTextStyles.trailingRegular,
            children: [
              TextSpan(
                text: "${bill.value!.toStringAsFixed(2)}",
                style: AppTextStyles.trailingBold,
              ),
            ],
          ))),
    );
  }
}
