import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sb_portal/ui/auth/model/CommonModel.dart';
import 'package:sb_portal/ui/auth/view/SellerLogin.dart';
import 'package:sb_portal/ui/dashboard/model/ProductListModel.dart';
import 'package:sb_portal/ui/dashboard/model/WIthOutLoginProductListModel.dart';
import 'package:sb_portal/ui/dashboard/provider/HomeProvider.dart';
import 'package:sb_portal/ui/dashboard/view/without_login/widget/WithOutLoginSidemenu.dart';
import 'package:sb_portal/utils/app_colors.dart';
import 'package:sb_portal/utils/app_font.dart';
import 'package:sb_portal/utils/app_images.dart';
import 'package:sb_portal/utils/app_string.dart';

class CategoryNameScreen extends StatefulWidget {
  const CategoryNameScreen({Key? key}) : super(key: key);

  @override
  _CategoryNameScreenState createState() => _CategoryNameScreenState();
}

class _CategoryNameScreenState extends State<CategoryNameScreen> {

  final TextEditingController _searchController = TextEditingController();
  WIthOutLoginProductListModel productListModel = WIthOutLoginProductListModel();
  HomeProvider? mHomeProvider;
  List<Product> searchProd = [];

  @override
  void initState() {
    callProductListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mHomeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: mHomeProvider!.isRequestSend,
        child: Scaffold(
          drawer: const WithOutLoginSidemenu(),
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
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Category Name', style: AppFont.NUNITO_SEMI_BOLD_BLACK_24),
              ),
              const SizedBox(height: 6),
              Container(height: 1, width: 150,color: AppColors.colorBlack,),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.colorWhite,
                    border: Border.all(color: AppColors.colorBorder, width: 1.0),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _searchController,
                          textInputAction: TextInputAction.search,
                          style: AppFont.NUNITO_REGULAR_BLACK_14,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.sentences,
                          onChanged: (value) {
                            onSearchTextChanged(value);
                          },
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Search product',
                              hintStyle: AppFont.NUNITO_REGULAR_SILVER_14,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none),
                        ),
                      ),
                      const Icon(
                        Icons.search,
                      ),
                    ],
                  ),
                ),
              ),
              _searchController.text.isNotEmpty
                  ? searchProd.isNotEmpty
                  ? Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return buildProductItem(
                        searchProd[index]);
                  },
                  itemCount:
                  searchProd.length,
                ),
              )
                  : const SizedBox()
                  : productListModel.results != null && productListModel.results!.product!.isNotEmpty
                  ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return buildProductItem(
                          productListModel.results!.product![index]);
                    },
                    itemCount:
                    productListModel.results!.product!.length,
                  ))
                  : const SizedBox(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        child: Column(
                          children: [
                            Text('SIGN UP/SIGN IN', style: AppFont.NUNITO_REGULAR_WHITE_12,),
                            Text('SELLER', style: AppFont.NUNITO_BOLD_WHITE_18,),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        color: AppColors.colorOrange,
                      ),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SellerLogin(
                                  isFromSeller: true,
                                )),
                                (route) => false);
                      },
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SellerLogin(
                                  isFromSeller: false,
                                )),
                                (route) => false);
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Text('SIGN UP/SIGN IN',style: AppFont.NUNITO_REGULAR_WHITE_12,),
                            Text('BUYER', style: AppFont.NUNITO_BOLD_WHITE_18,),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        color: AppColors.colorSKyBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildProductItem(Product product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.only(left: 12,bottom: 8, top: 8,),
        decoration: BoxDecoration(
          color: AppColors.colorLightBlueGrey,
          border: Border.all(color: AppColors.colorBorder, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            Image.network(product.image1!, width: 100, height: 100,
              fit: BoxFit.fill,
              errorBuilder: (BuildContext? context, Object? exception, StackTrace? stackTrace) {
                return const Icon(
                  Icons.error_outlined,
                  size: 100,
                );
              },),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.productName!),
                  const SizedBox(height: 8),
                  Text(product.categoryname!),
                ],
              ),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              child: Material(
                elevation: 0.0,
                borderRadius: BorderRadius.circular(6),
                color: AppColors.colorBtnBlack,
                child: Container(
                  alignment: Alignment.center,
                  height: 28,
                  child: MaterialButton(
                      onPressed: null,
                      child: Text('CONTACT NOW',
                          style: AppFont.NUNITO_REGULAR_WHITE_10)),
                ),
              ),
              onTap: () {
                Fluttertoast.showToast(msg: 'Please SIGN UP/SIGN IN IN BUYER');
              },
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    searchProd.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var userDetail in productListModel.results!.product!) {
      if (userDetail.productName!.toLowerCase().contains(text.toLowerCase()) ||
          userDetail.categoryname!.toString().contains(text.toLowerCase())) {
        searchProd.add(userDetail);
      }
    }
    setState(() {});
  }

  callProductListApi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      mHomeProvider!.productListWithOutSellerId().then((value) {
        if (value != null) {
          try {
            CommonModel streams = CommonModel.fromJson(value);
            if (streams.response != null && streams.response == "error") {
              Fluttertoast.showToast(msg: streams.message);
            } else {
              productListModel = WIthOutLoginProductListModel.fromJson(value);
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
