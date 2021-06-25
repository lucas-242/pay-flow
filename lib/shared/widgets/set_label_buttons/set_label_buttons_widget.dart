import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/label_button/label_button_widget.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback? primaryOnPressed;
  final String secundaryLabel;
  final VoidCallback? secundaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecundaryColor;

  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    this.primaryOnPressed,
    required this.secundaryLabel,
    this.secundaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecundaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.085,
      color: AppColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: size.height * 0.08,
            child: Row(
              children: [
                Expanded(
                  child: LabelButton(
                    label: primaryLabel,
                    onPressed: primaryOnPressed,
                    style:
                        enablePrimaryColor ? AppTextStyles.buttonPrimary : null,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  child: LabelButton(
                    label: secundaryLabel,
                    onPressed: secundaryOnPressed,
                    style:
                        enableSecundaryColor ? AppTextStyles.buttonPrimary : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
