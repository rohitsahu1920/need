import 'package:get/get.dart';
import 'package:need_flutter_app/translations/languages/english.dart';
import 'package:need_flutter_app/translations/languages/portuguese.dart';

import 'languages/spanish.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnglishLanguage.values,
        'es': SpanishLanguage.values,
        'pt': PortugueseLanguage.values,
      };
}
