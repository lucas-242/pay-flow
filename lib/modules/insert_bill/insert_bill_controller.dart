import 'package:flutter/cupertino.dart';
import 'package:pay_flow/shared/models/bill_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBillController {
  final formKey = GlobalKey<FormState>();
  Bill bill = Bill();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateDueDate(String? value) => value?.isEmpty ?? true
      ? "A data de vencimento não pode estar vazia"
      : null;
  String? validateValue(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateBarcode(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    bill = bill.copyWith(
        name: name, dueDate: dueDate, value: value, barcode: barcode);
  }

  Future<void> createBill() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      return await saveBill();
    }
  }

  Future<void> saveBill() async {
    final preferences = await SharedPreferences.getInstance();
    final bills = preferences.getStringList('bills') ?? <String>[];

    bills.add(bill.toJson());
    await preferences.setStringList('bills', bills);
    return;
  }
}
