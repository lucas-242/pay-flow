import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:pay_flow/modules/insert_bill/insert_bill_controller.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/input_text/input_text_widget.dart';
import 'package:pay_flow/shared/widgets/set_label_buttons/set_label_buttons_widget.dart';

class InsertBillPage extends StatefulWidget {
  final String? barcode;
  const InsertBillPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBillPageState createState() => _InsertBillPageState();
}

class _InsertBillPageState extends State<InsertBillPage> {
  final controller = InsertBillController();

  final valueInputTextController =
      MoneyMaskedTextController(leftSymbol: 'R\$', decimalSeparator: ',');

  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: Text(
                  'Preencha os dados do Boleto',
                  style: AppTextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 25),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    InputText(
                      label: 'Nome do boleto',
                      icon: Icons.description_outlined,
                      validator: controller.validateName,
                      onChanged: (value) => controller.onChange(name: value),
                    ),
                    InputText(
                      controller: dueDateInputTextController,
                      label: 'Vencimento',
                      icon: Icons.cancel_outlined,
                      validator: controller.validateDueDate,
                      onChanged: (value) => controller.onChange(dueDate: value),
                    ),
                    InputText(
                      controller: valueInputTextController,
                      label: 'Valor',
                      icon: Icons.account_balance_wallet,
                      validator: (_) => controller
                          .validateValue(valueInputTextController.numberValue),
                      onChanged: (value) => controller.onChange(
                          value: valueInputTextController.numberValue),
                    ),
                    InputText(
                      controller: barcodeInputTextController,
                      label: 'Código',
                      icon: Icons.document_scanner_outlined,
                      validator: controller.validateBarcode,
                      onChanged: (value) => controller.onChange(barcode: value),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: 'Cancelar',
        primaryOnPressed: () => Navigator.pop(context),
        secundaryLabel: 'Cadastrar',
        secundaryOnPressed: () async {
          //TODO: Criar insert_bill_status
        await  controller.createBill();
        Navigator.pop(context);
        },
        enableSecundaryColor: true,
      ),
    );
  }
}
