import 'dart:convert';

import 'package:template/app/app_config.dart';
import 'package:template/core/data/models/apis/token_info.dart';
import 'package:template/core/enums/data_type.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRepositories {
  static SharedPreferences globalSharedPreferences = Get.find();

  //!----Keys----
  static String PREF_FIRST_LUNCH = 'first_lunch';
  static String PREF_ISLOGEED = 'first_login';
  static String PREF_TOKEN = 'token';
  static String APP_PREF_LANG = 'app_language';
  String PREF_CART_LIST = 'cart_list';
  String PREF_SUB_STATUS = 'sub_status';
  String PREF_NUM_NOTIFICATION = 'num_notification';

  void setSubStatus(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_SUB_STATUS,
      value: value,
    );
  }

  bool getSubStatus() {
    if (Get.find<SharedPreferences>().containsKey(PREF_SUB_STATUS)) {
      return getPreference(key: PREF_SUB_STATUS);
    } else {
      return true;
    }
  }

  void setNumberOfNotifications(int value) {
    setPreference(
        dataType: DataType.INT, key: PREF_NUM_NOTIFICATION, value: value);
  }

  int getNumberOfNotifications() {
    if (globalSharedPreferences.containsKey(PREF_NUM_NOTIFICATION)) {
      return getPreference(key: PREF_NUM_NOTIFICATION);
    } else {
      return 0;
    }
  }

  // void setCartList(List<CartModel> list) {
  //   setPreference(
  //     dataType: DataType.STRING,
  //     key: PREF_CART_LIST,
  //     value: CartModel.encode(list),
  //   );
  // }

  // List<CartModel> getCartList() {
  //   if (globalSharedPreferences.containsKey(PREF_CART_LIST)) {
  //     return CartModel.decode(getPreference(key: PREF_CART_LIST));
  //   } else {
  //     return [];
  //   }
  // }

  void setFirstLunch(bool value) {
    setPreference(dataType: DataType.BOOL, key: PREF_FIRST_LUNCH, value: value);
  }

  bool getFirstLunch() {
    if (globalSharedPreferences.containsKey(PREF_FIRST_LUNCH)) {
      return getPreference(key: PREF_FIRST_LUNCH);
    } else {
      return true;
    }
  }

  void setAppLanguage(String value) {
    setPreference(dataType: DataType.STRING, key: APP_PREF_LANG, value: value);
  }

  String getAppLanguage() {
    if (globalSharedPreferences.containsKey(APP_PREF_LANG)) {
      return getPreference(key: APP_PREF_LANG);
    } else {
      return AppConfig.defaultLanguage;
    }
  }

  void setTokenIno(TokenInfo value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_TOKEN,
      value: jsonEncode(value.toJson()),
    );
  }

  TokenInfo? getTokenInfo() {
    if (globalSharedPreferences.containsKey(PREF_TOKEN)) {
      return TokenInfo.fromJson(
        jsonDecode(getPreference(key: PREF_TOKEN)),
      );
    } else {
      return null;
    }
  }

  bool get isLoggedIn => getTokenInfo() != null ? true : false;

  setPreference(
      {required DataType dataType,
      required String key,
      required dynamic value}) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPreferences.setInt(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPreferences.setDouble(key, value);
        break;
      case DataType.STRING:
        await globalSharedPreferences.setString(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPreferences.setBool(key, value);
        break;
      case DataType.STRINGLIST:
        await globalSharedPreferences.setStringList(key, value);
        break;
    }
  }

  dynamic getPreference({required String key}) {
    return globalSharedPreferences.get(key);
  }

  clearPreference() {
    globalSharedPreferences.clear();
  }
}
