import 'package:flutter/material.dart';
import 'package:sb_portal/ui/dashboard/view/buyer/BuyerSideMenu.dart';
import 'package:sb_portal/ui/dashboard/view/widgets/SideMenu.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/preference_helper.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: PreferenceHelper.getBool(PreferenceHelper.IS_SELLER_SIGN_IN)
            ? SideMenu()
            : const BuyerSideMenu(),
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
                  Expanded(
                      child: Image.asset(
                    APPImages.IC_SPLASH_LOGO,
                    height: 73,
                    width: 73,
                  )),
                  IconButton(
                    color: Colors.black,
                    icon: const Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            backgroundColor: AppColors.colorWhite,
            elevation: 0.0),
        body: Column(
          children: [
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.colorLightBlueGrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Text(
                    "Notification 1",
                    style: TextStyle(
                        color: AppColors.colorBlack,
                        fontWeight: FontWeight.w500,
                        fontFamily: "RobotRegular",
                        fontSize: 15),
                  ),
                ),
                trailing: const SizedBox(),
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: AppColors.colorLightBlueGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tempor lorem felis nec arcu, morbi. Ut facilisis enim sagittis, consequat ullamcorper tincidunt mauris varius. Fringilla.",
                      style: TextStyle(
                          color: AppColors.colorBlack,
                          fontWeight: FontWeight.w500,
                          fontFamily: "RobotRegular",
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
