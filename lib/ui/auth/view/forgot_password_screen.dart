// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/auth/provider/AuthProvider.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/app_widgets.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  AuthProvider? mAuthProvider;
  FocusNode emailFocus = FocusNode();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorWhite,
        body: Container(
          margin: EdgeInsets.only(top: 65, left: 66, right: 66),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "FORGOT PASSWORD",
                  style: TextStyle(
                      color: AppColors.colorBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 23),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                width: 176,
                height: 1,
                color: AppColors.colorBlack,
              ),
              const SizedBox(height: 35),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Enter Your Registered \n Email Address or Mobile Number \n for Re-Generate Your New Password",
                  style: TextStyle(color: AppColors.colorBlack, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 36),
              AppWidgets.buildInputFields(
                emailController,
                "Mobile Number/Email Address",
                false,
                emailFocus,
                emailFocus,
                context,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                child: Material(
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.colorOrange,
                  child: Container(
                    margin: EdgeInsets.only(left: 18, right: 18),
                    alignment: Alignment.center,
                    height: 40,
                    child: MaterialButton(
                        onPressed: null,
                        child: Text('CONFIRM',
                            style: AppFont.NUNITO_BOLD_WHITE_24)),
                  ),
                ),
                onTap: () {
                  callForgotPassword();
                },
              ),
              const SizedBox(height: 44),
              Image.asset(
                APPImages.IC_SPLASH_LOGO,
                width: 107,
                height: 107,
              ),
            ],
          ),
        ),
      ),
    );
  }

  callForgotPassword() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      print(emailController.text);
      Map<String, String> body = {
        APPStrings.paramEmail: emailController.text.toString(),
      };

      var url = APPStrings.baseUrl + "forgote_password";

      var value = await http.post(Uri.parse(url), body: body);

      var jsonValue = json.decode(value.body) as Map<String, dynamic>;
      if (jsonValue["response"] == "success") {
        Fluttertoast.showToast(msg: jsonValue["response"]);
      }
      // mAuthProvider!.forgotPassword(body).then((value) {
      //   if (value != null) {
      //     try {
      //       CommonModel streams = CommonModel.fromJson(value);
      //       if (streams.response != null && streams.response == "error") {
      //         Fluttertoast.showToast(msg: streams.message);
      //       } else {
      //         CommonModel commonModel = CommonModel.fromJson(value);
      //         Fluttertoast.showToast(msg: commonModel.message!);
      //       }
      //     } catch (ex) {
      //       Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
      //     }
      //   } else {
      //     Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
      //   }
      // });
    } else {
      Fluttertoast.showToast(msg: APPStrings.noInternetConnection);
    }
  }
}
