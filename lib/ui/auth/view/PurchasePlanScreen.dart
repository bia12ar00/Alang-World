import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

class PurchasePlanScreen extends StatefulWidget {
  const PurchasePlanScreen({Key? key}) : super(key: key);

  @override
  _PurchasePlanScreenState createState() => _PurchasePlanScreenState();
}

class _PurchasePlanScreenState extends State<PurchasePlanScreen> {

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                APPImages.IC_SPLASH_LOGO,
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 24),
              Text('Thank You for Registration \nAs Seller on Alang World', style: AppFont.NUNITO_REGULAR_BLACK_18,),
              const SizedBox(height: 24,),
              Text('Our Customer Support Executive Will\nGet in touch with you in next 48 Hours\nfor necessary Verification & On Boarding...', style: AppFont.NUNITO_REGULAR_BLACK_14,),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Email:', style: AppFont.NUNITO_REGULAR_DARK_BLACK_16,),
                  const SizedBox(width: 2),
                  InkWell(
                    onTap: () {
                      _openUrl('mailto:${'support@alangworld.com'}');
                    },
                    child: Text('support@alangworld.com', style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.colorBlue,
                      fontSize: 16
                    ),),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Mobile:', style: AppFont.NUNITO_REGULAR_DARK_BLACK_16,),
                  const SizedBox(width: 2),
                  InkWell(
                    onTap: () {
                      _openUrl('tel:${'+911111111111'}');
                    },
                    child: Text('+91 1111111111', style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.colorBlue,
                        fontSize: 16
                    ),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
