import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trans_intl/translations.dart';

/// 国际化方案设计
/// 1, 支持默认语言选择功能
/// 2, 支持国家语言选择功能(语言切换)

enum LangType {
  CN, // 中文
  CN_HK, // 繁体
  EN, // 英文
  FR, // 法文
  DE, // 德文
  ES, // 西班牙文
}

class I18nManager {
  I18nManager._internal();

  static final I18nManager _singleton = I18nManager._internal();

  factory I18nManager() {
    return _singleton;
  }

  /// storage key
  static const String storageKey = 'languageCode_kkrjpddt';

  /// 当前语言编码
  static LangType languageCode = LangType.CN;

  /// 语言包
  static Translations translations = Translations();

  /// 初始化, 初始化默认语言包, 当前语言包
  static Future<void> init({required Translations trans, required LangType current}) async {
    languageCode = current;
    translations = trans;
    await getLanguageCache();
  }

  static Future<void> changeLanguage(LangType language) async {
    languageCode = language;
    await setLanguageCache(languageCode);

    /// 重启应用
    await WidgetsFlutterBinding.ensureInitialized().performReassemble();
  }

  static void reset() {
    languageCode = LangType.CN;
  }

  /// 获取系统语言
  static String getSystemLanguage() {
    return Platform.localeName;
  }

  /// 缓存设置语言
  static Future<void> setLanguageCache(LangType type) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(storageKey, type.toString());
    } catch (e) {
      print(e);
    }
  }

  /// 从缓存中获取语言设置
  static Future<void> getLanguageCache() async {
    SharedPreferences? prefs;
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {
      print(e);
    }
    final key = prefs?.getString(storageKey) ?? 'LanguageType.CN_ZH';
    switch (key) {
      case 'LanguageType.CN_ZH':
        languageCode = LangType.CN;
        break;
      case 'LanguageType.CN_HK':
        languageCode = LangType.CN_HK;
        break;
      case 'LanguageType.EN':
        languageCode = LangType.EN;
        break;
      case 'LanguageType.FR':
        languageCode = LangType.FR;
        break;
      case 'LanguageType.DE':
        languageCode = LangType.DE;
        break;
      case 'LanguageType.ES':
        languageCode = LangType.ES;
        break;
      default:
        languageCode = LangType.CN;
        break;
    }
  }
}
