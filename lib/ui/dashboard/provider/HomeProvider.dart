import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sb_portal/service/network_repository.dart' as api;
import 'package:sb_portal/utils/app_string.dart';

class HomeProvider extends ChangeNotifier {
  BuildContext? mContext;
  bool isRequestSend = false;

  HomeProvider(context) {
    mContext = context;
  }

  Future<Map<String, dynamic>> productList(String sellerId) {
    isRequestSend = true;
    notifyListeners();
    return api.callGetMethodToken(mContext!, APPStrings.apiGetProduct + '/' + sellerId).then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> productListWithOutSellerId() {
    isRequestSend = true;
    notifyListeners();
    return api.callGetMethodToken(mContext!, APPStrings.apiGetProduct).then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> sliders() {
    isRequestSend = true;
    notifyListeners();
    return api.callGetMethodToken(mContext!, APPStrings.apiSliders).then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> addProduct(Map<String, String> params, List<String> listOfImage) {
    isRequestSend = true;
    notifyListeners();
    return api.callPostMethodWithMultipleImage(mContext!, APPStrings.apiAddProduct, params, listOfImage).then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> editProduct(Map<String, String> params, List<String> listOfImage) {
    isRequestSend = true;
    notifyListeners();
    return api.callPostMethodWithMultipleImage(mContext!, APPStrings.apiEditProduct, params, listOfImage).then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> deleteProduct(String id) {
    isRequestSend = true;
    notifyListeners();
    return api.callPostMethodWithToken(mContext!, APPStrings.apiDeleteProduct + '/' + id, {}).then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> getUserProfile() {
    isRequestSend = true;
    notifyListeners();
    return api.callGetMethodToken(mContext!, APPStrings.apiUserProfile).then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> getUserPlan() {
    isRequestSend = true;
    notifyListeners();
    return api.callGetMethodToken(mContext!, APPStrings.apiUserPlan).then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> getProductCategory() {
    isRequestSend = true;
    notifyListeners();
    return api.callGetMethodToken(mContext!, APPStrings.apiGetProductCategory).then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> editProfile(Map<String, dynamic> params) {
    isRequestSend = true;
    notifyListeners();
    return api.callPostMethodWithToken(mContext!, APPStrings.apiUpdateProfile, params).then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }

  Future<Map<String, dynamic>> contactNow(Map<String, String> params) {
    isRequestSend = true;
    notifyListeners();
    return api.callPostMethodWithToken(mContext!, APPStrings.apiClickProduct, params).then((value) {
      isRequestSend = false;
      notifyListeners();
      Map<String, dynamic> data = jsonDecode(value);
      return data;
    }).catchError((e) {
      isRequestSend = false;
      notifyListeners();
      throw e;
    });
  }
}
