import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

class InputText extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;

  const InputText({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.left,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              initialValue: initialValue,
              validator: validator,
              onChanged: onChanged,
              style: AppTextStyles.input,
              decoration: InputDecoration(
                  labelText: label,
                  labelStyle: AppTextStyles.input,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Icon(icon, color: AppColors.primary),
                      ),
                      Container(
                        width: 1,
                        height: 48,
                        color: AppColors.stroke,
                      )
                    ],
                  )),
            ),
            Divider(
              color: AppColors.stroke,
              height: 1,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
