import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/bill_model.dart';
import 'package:pay_flow/shared/widgets/bill_list/bill_list_controller.dart';
import 'package:pay_flow/shared/widgets/bill_tile/bill_tile_widget.dart';

class BillList extends StatefulWidget {
  final BillListController controller;
  const BillList({Key? key, required this.controller}) : super(key: key);

  @override
  _BillListState createState() => _BillListState();
}

class _BillListState extends State<BillList> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Bill>>(
        valueListenable: widget.controller.billsNotifier,
        builder: (_, bills, __) {
          return Column(children: bills.map((e) => BillTile(bill: e)).toList());
        });
  }
}
