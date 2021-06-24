import 'package:flutter/material.dart';

class InsertBillPage extends StatefulWidget {
  const InsertBillPage({Key? key}) : super(key: key);

  @override
  _InsertBillPageState createState() => _InsertBillPageState();
}

class _InsertBillPageState extends State<InsertBillPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserir Boleto'),
      ),
    );
  }
}
