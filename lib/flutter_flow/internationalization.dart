import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'vi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? viText = '',
  }) =>
      [enText, viText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'epvgp9n0': {
      'en': 'Promotion',
      'vi': 'Khuyến mãi',
    },
    '32iyptih': {
      'en': 'announcement',
      'vi': 'thông báo',
    },
    'hoebktwo': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // loginPage
  {
    '9zrl75vf': {
      'en': 'Sign In',
      'vi': 'Đăng nhập',
    },
    'xwdb0su2': {
      'en': 'ID Card',
      'vi': 'Chứng minh nhân dân',
    },
    '0e4h923o': {
      'en': 'Enter your ID card...',
      'vi': 'Nhập chứng minh nhân dân của bạn...',
    },
    '6opikl67': {
      'en': 'Field is required',
      'vi': 'Lĩnh vực được yêu cầu',
    },
    'aq3v8iu1': {
      'en': 'Please enter 12 characters',
      'vi': 'Vui lòng nhập 12 ký tự',
    },
    '7f50fpiv': {
      'en': 'Please enter 12 characters',
      'vi': 'Vui lòng nhập 12 ký tự',
    },
    'jtuxldtx': {
      'en': 'Please choose an option from the dropdown',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
    },
    'oqly3he2': {
      'en': 'Fullname',
      'vi': 'Họ và tên',
    },
    '30kfnu0s': {
      'en': 'Enter your Name...',
      'vi': 'Nhập tên của bạn...',
    },
    'ez80wyxg': {
      'en': 'Phone Number',
      'vi': 'Số điện thoại',
    },
    '8xxd5ozt': {
      'en': 'Enter your phone number...',
      'vi': 'Nhập số điện thoại của bạn...',
    },
    'd1gnnf7n': {
      'en': 'Field is required',
      'vi': 'Lĩnh vực được yêu cầu',
    },
    'g94st846': {
      'en': 'Please enter 10 characters',
      'vi': 'Vui lòng nhập 10 ký tự',
    },
    'fjdgot2v': {
      'en': 'Please enter 10 characters',
      'vi': 'Vui lòng nhập 10 ký tự',
    },
    'gie56m45': {
      'en': 'Please choose an option from the dropdown',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
    },
    'orrifajl': {
      'en': 'license plates',
      'vi': 'biển số xe',
    },
    '67eutsax': {
      'en': 'Enter your license plates...',
      'vi': 'Nhập biển số xe của bạn...',
    },
    'cusgvgiy': {
      'en': 'Sign In',
      'vi': 'Đăng nhập',
    },
    '3r7mymh6': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // PinCode
  {
    'h34zv0k5': {
      'en': 'Confirm your Code',
      'vi': 'Xác nhận Mã của bạn',
    },
    '3exq6syi': {
      'en': 'This code helps keep your account safe and secure.',
      'vi': 'Mã này giúp giữ cho tài khoản của bạn an toàn và bảo mật.',
    },
    'wezws3ab': {
      'en': 'Confirm & Continue',
      'vi': 'Xác nhận & Tiếp tục',
    },
    '4jehudom': {
      'en': 'Enter Pin Code Below',
      'vi': 'Nhập mã pin bên dưới',
    },
    '165lram6': {
      'en': 'Home',
      'vi': 'Trang chủ',
    },
  },
  // Miscellaneous
  {
    'blb590zq': {
      'en':
          'Your information will help us to analyse and give you better service and benefit',
      'vi': 'Cho phép truy cập danh bạ của bạn',
    },
    'h1h88p9h': {
      'en': '',
      'vi': '',
    },
    'gqqr4qqh': {
      'en': '',
      'vi': '',
    },
    'w5xe8bvx': {
      'en': '',
      'vi': '',
    },
    'uh39l7n0': {
      'en': '',
      'vi': '',
    },
    'gxnr6ni9': {
      'en': '',
      'vi': '',
    },
    'rbf1933o': {
      'en': '',
      'vi': '',
    },
    'xw9ajmz7': {
      'en': '',
      'vi': '',
    },
    '6fa15s1w': {
      'en': '',
      'vi': '',
    },
    '45986myg': {
      'en': '',
      'vi': '',
    },
    'qoiahx2o': {
      'en': '',
      'vi': '',
    },
    '93j4vuof': {
      'en': '',
      'vi': '',
    },
    '4yfpwvbu': {
      'en': '',
      'vi': '',
    },
    'zunrpizw': {
      'en': '',
      'vi': '',
    },
    'c1dp1b9b': {
      'en': '',
      'vi': '',
    },
    'vukcrjj7': {
      'en': '',
      'vi': '',
    },
    '9f8y6dwl': {
      'en': '',
      'vi': '',
    },
    'agborskv': {
      'en': '',
      'vi': '',
    },
    '4e0luj25': {
      'en': '',
      'vi': '',
    },
    'ku4fzjce': {
      'en': '',
      'vi': '',
    },
    '2io5q2z3': {
      'en': '',
      'vi': '',
    },
    'mk2tanw8': {
      'en': '',
      'vi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
