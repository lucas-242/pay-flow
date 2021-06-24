import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/set_label_buttons/set_label_buttons_widget.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final String primaryLabel;
  final VoidCallback? primaryOnPressed;
  final String secundaryLabel;
  final VoidCallback? secundaryOnPressed;
  const CustomBottomSheet({
    Key? key,
    required this.primaryLabel,
    this.primaryOnPressed,
    required this.secundaryLabel,
    this.secundaryOnPressed,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Material(
        child: Container(
          color: AppColors.shape,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.black.withOpacity(0.06),
              )),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: Text.rich(
                      TextSpan(
                        text: title,
                        style: AppTextStyles.buttonBoldHeading,
                        children: [
                          TextSpan(
                            text: '\n$subtitle',
                            style: AppTextStyles.buttonHeading,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(height: 1, color: AppColors.stroke),
                  SetLabelButtons(
                    enablePrimaryColor: true,
                    primaryLabel: primaryLabel,
                    primaryOnPressed: primaryOnPressed,
                    secundaryLabel: secundaryLabel,
                    secundaryOnPressed: secundaryOnPressed,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
