import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sb_portal/ui/dashboard/view/HomeNavigationScreen.dart';
import 'package:sb_portal/ui/dashboard/view/widgets/SideMenu.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: SideMenu(),
        appBar: AppBar(
            toolbarHeight: 80,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  Expanded(child: Image.asset(APPImages.IC_SPLASH_LOGO, height: 73, width: 73,)),
                  IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            backgroundColor: AppColors.colorWhite,
            elevation: 0.0),
        backgroundColor: AppColors.colorWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contact Us',
              style: AppFont.NUNITO_SEMI_BOLD_BLACK_20,
            ),
            const SizedBox(height: 32),
            Image.asset(APPImages.IC_SPLASH_LOGO,
            width: 150, height: 150,),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.email,
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    _openUrl('mailto:${'support@alangworld.com'}');
                  },
                  child: Text(
                    'support@alangworld.com',
                    style: AppFont.NUNITO_BOLD_BLACK_16
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.call,
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    _openUrl('tel:${'+911111111111'}');
                  },
                  child: Text(
                    '+91 1111111111',
                    style: AppFont.NUNITO_BOLD_BLACK_16
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            Text('Copyright Line/Web URL', style: AppFont.NUNITO_REGULAR_DARK_BLACK_16)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (_position) {
            NavKey.navKey.currentState!.pushAndRemoveUntil(MaterialPageRoute(builder: (_) =>
                HomeScreenNavigation(selectedIndex: _position,)), (route) => false);
          },
          showSelectedLabels: false,
          selectedItemColor: AppColors.colorWhite,
          backgroundColor: AppColors.colorBlack,
          selectedFontSize: 12.00,
          unselectedFontSize: 12.00,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 32,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline,  size: 32,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle,  size: 32,),
              label: '',
            ),
          ],
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
