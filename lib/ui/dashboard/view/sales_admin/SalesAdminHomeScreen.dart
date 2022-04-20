import 'package:flutter/material.dart';
import 'package:sb_portal/utils/NavKey.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';

import 'SellerProductListScreen.dart';

class SalesAdminHomeScreen extends StatefulWidget {
  const SalesAdminHomeScreen({Key? key}) : super(key: key);

  @override
  _SalesAdminHomeScreenState createState() => _SalesAdminHomeScreenState();
}

class _SalesAdminHomeScreenState extends State<SalesAdminHomeScreen> {

  final TextEditingController _mobileController = TextEditingController();
  final FocusNode _mobileFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.colorWhite,
          body: Column(
            children: [
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          '+91',
                          style: AppFont.NUNITO_REGULAR_BLACK_14,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          color: AppColors.colorBtnBlack,
                          width: 32,
                          height: 1,
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _mobileController,
                            maxLength: 10,
                            textInputAction: TextInputAction.next,
                            style: AppFont.NUNITO_REGULAR_BLACK_14,
                            keyboardType: TextInputType.number,
                            focusNode: _mobileFocus,
                            onFieldSubmitted: (term) {
                              _mobileFocus.unfocus();
                              FocusScope.of(context).requestFocus(null);
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              counterText: "",
                              hintText: 'Mobile number',
                              hintStyle: AppFont.NUNITO_REGULAR_BLACK_14,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none
                            ),
                          ),
                          Container(
                            color: AppColors.colorBtnBlack,
                            width: double.maxFinite,
                            height: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 72),
                child: GestureDetector(
                  child: Material(
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.colorOrange,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      child: MaterialButton(
                          onPressed: null,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: AppColors.colorWhite,
                              ),
                              const SizedBox(width: 4),
                              Text('SEARCH SELLER',
                                  style: AppFont.NUNITO_BOLD_WHITE_18),
                            ],
                          )),
                    ),
                  ),
                  onTap: () {

                  },
                ),
              ),
              const SizedBox(height: 22),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return buildSellerItem();
                  },
                  itemCount: 4,
                ),
              ),
            ],
          ),
        ),
    );
  }

  buildSellerItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.colorLightBlueGrey,
          border: Border.all(color: AppColors.colorBorder, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: InkWell(
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.business,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'company',
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.account_circle,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'test',
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.call,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '111111111111',
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.email,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'test@gmail.com',
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_16,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'address',
                    style: AppFont.NUNITO_SEMI_BOLD_BLACK_16,
                  ),
                ],
              ),
            ],
          ),
          onTap: () {
            NavKey.navKey.currentState!.push(MaterialPageRoute(builder: (_) => const SellerProductListScreen(
              sellerId: '12',
            )));
          },
        ),
      ),
    );
  }
}
