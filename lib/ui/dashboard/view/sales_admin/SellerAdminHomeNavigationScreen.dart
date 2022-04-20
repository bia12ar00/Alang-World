import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sb_portal/ui/dashboard/view/sales_admin/SalesAdminHomeScreen.dart';
import 'package:sb_portal/ui/dashboard/view/sales_admin/SalesAdminSideMenu.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/common/show_single_dialog.dart';

class SellerAdminHomeNavigationScreen extends StatefulWidget {
  int? selectedIndex = 0;
  SellerAdminHomeNavigationScreen({Key? key, this.selectedIndex}) : super(key: key);

  @override
  _SellerAdminHomeNavigationScreenState createState() => _SellerAdminHomeNavigationScreenState();
}

class _SellerAdminHomeNavigationScreenState extends State<SellerAdminHomeNavigationScreen> {
  int page = 0;

  @override
  void initState() {
    page = widget.selectedIndex!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onWillPop();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          drawer: const SalesAdminSideMenu(),
          backgroundColor: AppColors.colorWhite,
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
          body: getBody(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: page,
            onTap: (_position) {
              setState(() {
                page = _position;
              });
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
                icon: Icon(Icons.home, size: 32,),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget? getBody() {
    if (page == 0) {
      return const SalesAdminHomeScreen();
    }
  }

  _onWillPop()  {
    DialogSingleClick.showCustomDialog(context,
        title: 'Do you want to exit an app',
        okBtnText: 'OK',
        cancelBtnText: 'Cancel',
        okBtnFunction: () {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        });
  }
}
