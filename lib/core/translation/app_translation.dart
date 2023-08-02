import 'package:template/core/translation/languages/ar_language.dart';
import 'package:template/core/translation/languages/en_language.dart';
import 'package:template/core/translation/languages/tr_language.dart';

import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": EnLanguage.map,
        "ar_SA": ArLanguage.map,
        "tr_TR": TRLanguage.map
      };
}

tr(String key) => key.tr;
