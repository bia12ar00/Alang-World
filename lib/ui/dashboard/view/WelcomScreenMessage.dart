import 'package:flutter/material.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';

class WelcomeScreenMessage extends StatefulWidget {
  const WelcomeScreenMessage({Key? key}) : super(key: key);

  @override
  _WelcomeScreenMessageState createState() => _WelcomeScreenMessageState();
}

class _WelcomeScreenMessageState extends State<WelcomeScreenMessage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorWhite,
        body: Column(
          children: [
            Image.asset(APPImages.IC_SPLASH_LOGO),
            const SizedBox(height: 64),
            Text('WELCOME MSG', style: AppFont.NUNITO_BOLD_DARK_CHARCOALBLACK_20,),
            const SizedBox(height: 40),
            Text('Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Et proin morbi\nadipiscing  iaculis eget amet. Felis,\nultrices nec massa et at.', style: AppFont.NUNITO_BOLD_DARK_CHARCOALBLACK_20,),
          ],
        ),
      ),
    );
  }
}
