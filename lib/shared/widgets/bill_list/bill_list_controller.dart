import 'package:flutter/foundation.dart';
import 'package:pay_flow/shared/models/bill_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillListController {
  final billsNotifier = ValueNotifier<List<Bill>>(<Bill>[]);
  
  List<Bill> get bills => billsNotifier.value;
  set bills(List<Bill> value) => billsNotifier.value = value;

  BillListController() {
    getBills();
  }

  Future<void> getBills() async {
    try {
      final preferences = await SharedPreferences.getInstance();
      final response = preferences.getStringList('bills') ?? <String>[];

      bills = response.map((e) => Bill.fromJson(e)).toList();
    } catch (error) {
      bills = <Bill>[];
    }
  }
}
