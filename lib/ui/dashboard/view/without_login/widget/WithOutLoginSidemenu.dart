import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sb_portal/ui/auth/view/SellerLogin.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/WithoutLoginALangWorldScreen.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_images.dart';

import '../WithOutLoginContactUs.dart';

class WithOutLoginSidemenu extends StatefulWidget {
  const WithOutLoginSidemenu({Key? key}) : super(key: key);

  @override
  _WithOutLoginSidemenuState createState() => _WithOutLoginSidemenuState();
}

class _WithOutLoginSidemenuState extends State<WithOutLoginSidemenu> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.colorWhite,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 60,),
          Image.asset(APPImages.IC_SPLASH_LOGO,
            width: 123, height: 123,),
          const SizedBox(height: 64,),
          ListTile(
            title: const Text('Login as Seller'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const SellerLogin(
                        isFromSeller: true,
                      )),
                      (route) => false);
            },
          ),
          ListTile(
            title: const Text('Login as Buyer'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const SellerLogin(
                        isFromSeller: false,
                      )),
                      (route) => false);
            },
          ),

          ListTile(
            title: const Text('Alang World'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const WithoutLoginALangWorldScreen()));
            },
          ),
          ListTile(
            title: const Text('Contact US'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const WithOutLoginContactUs()));
            },
          ),
        ],
      ),
    );
  }
}
