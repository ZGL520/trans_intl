import 'package:trans_intl/i18n_manager.dart';

extension I18nTrans on String {
  String get intl {
    if (I18nManager.translations.keys[this]?[I18nManager.languageCode] == null) return this;
    return I18nManager.translations.keys[this]?[I18nManager.languageCode] ?? this;
  }
}
