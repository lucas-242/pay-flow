import 'package:flutter/material.dart';
import 'package:pay_flow/modules/extract/extract_page.dart';
import 'package:pay_flow/modules/my_bills/my_bills_page.dart';
import 'package:pay_flow/shared/models/user_model.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.2),
        child: Container(
          height: size.height * 0.2,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: 'Olá, ',
                    style: AppTextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: widget.user.name,
                          style: AppTextStyles.titleBoldBackground)
                    ]),
              ),
              subtitle: Text(
                'Mantenha suas contas em dia',
                style: AppTextStyles.captionShape,
              ),
              trailing: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(widget.user.photoUrl ?? ''))),
              ),
            ),
          ),
        ),
      ),
      body: [
        MyBillsPage(
          key: UniqueKey(),
        ),
        ExtractPage(
          key: UniqueKey(),
        ),
      ][controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              icon: Icon(Icons.home),
              color: controller.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, '/barcode_scanner');
                setState(() {});
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {});
              },
              icon: Icon(Icons.description_outlined),
              color: controller.currentPage == 1
                  ? AppColors.primary
                  : AppColors.body,
            ),
          ],
        ),
      ),
    );
  }
}
