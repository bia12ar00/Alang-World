import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/auth/provider/AuthProvider.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';
import 'package:sb_portal/utils/app_widgets.dart';

class SellerChangePasswordScreen extends StatefulWidget {
  const SellerChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _SellerChangePasswordScreenState createState() => _SellerChangePasswordScreenState();
}

class _SellerChangePasswordScreenState extends State<SellerChangePasswordScreen> {
  AuthProvider? mAuthProvider;
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FocusNode _oldPasswordFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    mAuthProvider = Provider.of<AuthProvider>(context);
    return ModalProgressHUD(
      inAsyncCall: mAuthProvider!.isRequestSend,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      InkWell(
                        child: const Icon(
                          Icons.arrow_back,
                          size: 32,
                        ),
                        onTap: () {
                          NavKey.navKey.currentState!.pop();
                        },
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        children: [
                          Text('CHANGE PASSWORD',
                              style: AppFont.NUNITO_SEMI_BOLD_BLACK_24),
                          Container(
                            color: AppColors.colorBtnBlack,
                            width: 160,
                            height: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppWidgets.buildInputFields(
                    _oldPasswordController,
                    "Enter Old Password",
                    true,
                    _oldPasswordFocus,
                    _passwordFocus,
                    context,
                  ),
                  const SizedBox(height: 16),
                  AppWidgets.buildInputFields(
                    _passwordController,
                    "Enter Password",
                    true,
                    _passwordFocus,
                    _confirmPasswordFocus,
                    context,
                  ),
                  const SizedBox(height: 16),
                  AppWidgets.buildInputFields(
                    _confirmPasswordController,
                    "Enter Confirm Password",
                    true,
                    _confirmPasswordFocus,
                    null,
                    context,
                  ),
                  const SizedBox(height: 32),
                  GestureDetector(
                    child: Material(
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.colorOrange,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: MaterialButton(
                            onPressed: null,
                            child: Text('CHANGE PASSWORD',
                                style:
                                AppFont.NUNITO_BOLD_WHITE_24)),
                      ),
                    ),
                    onTap: () {
                      if(_oldPasswordController.text.toString().trim().isEmpty){
                        Fluttertoast.showToast(msg: 'Please enter old password');
                      } else if(_passwordController.text.toString().trim().isEmpty){
                        Fluttertoast.showToast(msg: 'Please enter old password');
                      } else if(_confirmPasswordController.text.toString().trim().isEmpty){
                        Fluttertoast.showToast(msg: 'Please enter old password');
                      } else if(_passwordController.text.toString() != _confirmPasswordController.text.toString()) {
                        Fluttertoast.showToast(msg: 'Password and confirm password does not match');
                      } else {
                        callChangePasswordApi();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  callChangePasswordApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Map<String, String> body = {
        APPStrings.paramOldPassword: _oldPasswordController.text.toString(),
        APPStrings.paramPassword: _passwordController.text.toString(),
        APPStrings.paramConfirmPassword: _confirmPasswordController.text.toString(),
      };
      mAuthProvider!.getCityList(body).then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              Fluttertoast.showToast(msg: streams.message);
            }
          } catch (ex) {
            print(ex);
            Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
          }
        } else {
          Fluttertoast.showToast(msg: APPStrings.INTERNAL_SERVER_ISSUE);
        }
      });
    } else {
      Fluttertoast.showToast(msg: APPStrings.noInternetConnection);
    }
  }
}
