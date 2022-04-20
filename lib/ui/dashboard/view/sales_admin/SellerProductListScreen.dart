import 'package:flutter/material.dart';
import 'package:sb_portal/utils/app_colors.dart';

class SellerProductListScreen extends StatefulWidget {
  final String? sellerId;
  const SellerProductListScreen({Key? key,
  this.sellerId}) : super(key: key);

  @override
  _SellerProductListScreenState createState() => _SellerProductListScreenState();
}

class _SellerProductListScreenState extends State<SellerProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
        ),
    );
  }
}
