import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar', 'ko'];

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
    String? esText = '',
    String? deText = '',
    String? arText = '',
    String? koText = '',
  }) =>
      [enText, esText, deText, arText, koText][languageIndex] ?? '';

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
  // homepage0125
  {
    'xn2so8km': {
      'en': 'ECO 발자국',
      'ar': 'بطاقتي',
      'de': 'Meine Karte',
      'es': 'Mi tarjeta',
      'ko': 'ECO 발자국',
    },
    '6t7n9ugd': {
      'en': '나의 탄소 발자국은?',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
      'ko': '나의 탄소 발자국은?',
    },
    'dplhmclv': {
      'en': '발자국',
      'ar': '벨재국',
      'de': '',
      'es': '',
      'ko': '발자국',
    },
    'vjwn5zu8': {
      'en': '공과금 고지서 찍고',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '공과금 고지서 찍고',
    },
    'tgc6xclf': {
      'en': '포인트 받기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '포인트 받기',
    },
    '9qtc3801': {
      'en': '친환경 소비하고',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '친환경 소비하고',
    },
    'tkov3ilr': {
      'en': '포인트 받기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '포인트 받기',
    },
    'en2fjl2t': {
      'en': '매일 미션하고 ',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '매일 미션하고 ',
    },
    'zxfgir4f': {
      'en': '포인트 모으기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '포인트 모으기',
    },
    'mjni2ir0': {
      'en': '대중교통 이용 인증하고',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '대중교통 이용 인증하고',
    },
    'hwv1sm7b': {
      'en': '포인트 받기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '포인트 받기',
    },
    'm8rhanhc': {
      'en': '.',
      'ar': '•',
      'de': '•',
      'es': '•',
      'ko': '',
    },
  },
  // mission0125
  {
    'eginb3ts': {
      'en': '지금 얻을 수 있는 발자국',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
      'ko': '지금 얻을 수 있는 발자국',
    },
    'iulzmk9i': {
      'en': '발자국',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '발자국',
    },
    'gybh9i2w': {
      'en': '지금 출석하면',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '지금 출석하면',
    },
    'l3fnkcyv': {
      'en': '1 발자국',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '1 발자국',
    },
    '4vrftdjp': {
      'en': '지금 친환경 shop 방문하면',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '지금 친환경 shop 방문하면',
    },
    'vpaqegwm': {
      'en': '2 발자국',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '2 발자국',
    },
    'o99rhxpe': {
      'en': '지금 만보인증하면',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '지금 만보인증하면',
    },
    'oa8m820e': {
      'en': '3 발자국',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '3 발자국',
    },
    'ctkhthi2': {
      'en': '지금 개인컵 사용 인증하면',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '지금 개인컵 사용 인증하면',
    },
    '2ygy5ell': {
      'en': '4 발자국',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '4 발자국',
    },
    'bqm8gdwr': {
      'en': '미션 페이지',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '미션 페이지',
    },
    'i4r9jqwn': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'ko': '',
    },
  },
  // mypage0125
  {
    'i61y9ibx': {
      'en': '프로필 설정',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
      'ko': '프로필 설정',
    },
    '6w6wv95p': {
      'en': '알림설정',
      'ar': 'إعدادات الإشعار',
      'de': 'Benachrichtigungseinstellungen',
      'es': 'Configuración de las notificaciones',
      'ko': '알림설정',
    },
    '9aogde79': {
      'en': '회원탈퇴',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
      'ko': '회원탈퇴',
    },
    '8srr2k0j': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
      'ko': '',
    },
  },
  // editProfile0127
  {
    '4rzqov3y': {
      'en': '프로필 수정하기',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
      'ko': '프로필 수정하기',
    },
    '05x895qv': {
      'en': '이름',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
      'ko': '',
    },
    'xqxgp59p': {
      'en': 'Please enter a valid number...',
      'ar': 'من فضلك أدخل رقما صالحا...',
      'de': 'Bitte geben Sie eine gültige Nummer ein...',
      'es': 'Por favor ingrese un número valido...',
      'ko': '',
    },
    'yisi3fr2': {
      'en': '주소',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
      'ko': '',
    },
    'gjc2bzyf': {
      'en': 'address',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
      'ko': '',
    },
    '55ilrnow': {
      'en': '주소 검색',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '주소 검색',
    },
    'bscqfra7': {
      'en': '수정하기',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
      'ko': '수정하기',
    },
    '59naq8ur': {
      'en': 'home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'ko': '',
    },
  },
  // firstlogin0125
  {
    'b1e16gzg': {
      'en': 'Ecoing\n',
      'ar': '',
      'de': '',
      'es': '',
      'ko': 'Ecoing',
    },
    '017bo1eh': {
      'en': 'Continue with Google',
      'ar': '',
      'de': '',
      'es': '',
      'ko': 'Continue with Google',
    },
    'u7qxvujc': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
  },
  // shoppinglist0126
  {
    '5ma9uwoy': {
      'en': 'shop',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'cxz3k3r2': {
      'en': 'LG생활건강',
      'ar': '',
      'de': '',
      'es': '',
      'ko': 'LG생활건강',
    },
    'wlo4h2j6': {
      'en': 'beyond',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '바디워시',
    },
    'iamhfodv': {
      'en': 'refreshing',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '리프레싱 로션',
    },
    'yxlqpgkh': {
      'en': '15000원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '15000원',
    },
    'b2bswics': {
      'en': '크리미 로션',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '크리미 로션',
    },
    't47xnl7u': {
      'en': '17000원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '17000원',
    },
    'dr6kafd7': {
      'en': '풀무원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '풀무원',
    },
    'cyatu92t': {
      'en': '유기농 두부',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '유기농 두부',
    },
    'ld0l5cg4': {
      'en': '찌개두부',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '찌개두부',
    },
    '6kk1mc4x': {
      'en': '1500원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '1500원',
    },
    'klb0jo0w': {
      'en': '고단백 두부',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '고단백 두부',
    },
    '0as82h5l': {
      'en': '3000원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '3000원',
    },
    'mrhgmukd': {
      'en': '두부면',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '두부면',
    },
    'ojtnwipi': {
      'en': '2500원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '2500원',
    },
    'njb8wjwj': {
      'en': '부침두부',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '옛 두부',
    },
    'yyx5cf18': {
      'en': '1700원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '4000원',
    },
    'al3kocmq': {
      'en': '고소한 손맛 두부',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '옛 두부',
    },
    'r9jj35t2': {
      'en': '4800원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '4000원',
    },
    'u3ehykri': {
      'en': 'Lotte',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '롯데',
    },
    '6z3trgl7': {
      'en': '저탄소 칠성 사이다',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '저탄소 칠성 사이다',
    },
    'z4gy5vh6': {
      'en': '사이다 1.5L 20페트',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '사이다',
    },
    'z2l9om2e': {
      'en': '29000원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '5000원',
    },
    '5ta2n5iu': {
      'en': '장바구니 담기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '장바구니 담기',
    },
    'hxgdkhej': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
  },
  // deleteAccount0126
  {
    '2ez28p3q': {
      'en': 'password',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
      'ko': 'password',
    },
    'yw422mq5': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
      'ko': '',
    },
    '79p29vp1': {
      'en': '비밀번호를 입력해주세요.',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '비밀번호를 입력해주세요.',
    },
    '53dg6laj': {
      'en': '회원탈퇴 유의사항\n\n',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '회원탈퇴 유의사항\n\n',
    },
    'dl3au5oo': {
      'en':
          '- 회원탈퇴가 완료되면 회원님의 개인정보는 삭제됩니다.\n- 회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없습니다.\n- 보유하신 마일리지는 복구할 수 없습니다.\n\n본인의 회원가입 시점부터 탈퇴 요청일까지 모든 마일리지를 포기하는 것에 동의합니다.',
      'ar': '',
      'de': '',
      'es': '',
      'ko':
          '- 회원탈퇴가 완료되면 회원님의 개인정보는 삭제됩니다.\n- 회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없습니다.\n- 보유하신 마일리지는 복구할 수 없습니다.\n\n본인의 회원가입 시점부터 탈퇴 요청일까지 모든 마일리지를 포기하는 것에 동의합니다.',
    },
    'x2d9i68e': {
      'en': '위의 유의사항을 확인하였고, 에코잉 회원 탈퇴에 동의합니다.',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '위의 유의사항을 확인하였고, 에코잉 회원 탈퇴에 동의합니다.',
    },
    '0avxc0q2': {
      'en': '탈퇴 그만두기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '탈퇴 그만두기',
    },
    'ezkzr1f4': {
      'en': '탈퇴하기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '탈퇴하기',
    },
    'q8ei7o89': {
      'en': '회원 탈퇴',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '회원 탈퇴',
    },
    'gruj49od': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'ko': '',
    },
  },
  // notificationSettings0126
  {
    'opmzmx1v': {
      'en': '알림 설정',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '알림 설정',
    },
    'ka5qu2zk': {
      'en': '(선택) 개인정보 수집 및 이용 동의',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '(선택) 개인정보 수집 및 이용 동의',
    },
    'tnh16rv4': {
      'en': '알림 > 알림 설정에서 변경 가능',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '알림 > 알림 설정에서 변경 가능',
    },
    'eefrpojr': {
      'en': '공지사항',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'z21zqksi': {
      'en': '앱 공지사항을 기기를 통해 전달합니다.',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '앱 공지사항을 기기를 통해 전달합니다.',
    },
    '8rek0hgi': {
      'en': '광고/이벤트',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '광고/이벤트',
    },
    '2om9o7tw': {
      'en': '상품 광고 및 이벤트를 기기를 통해 전달합니다.',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '상품 광고 및 이벤트를 기기를 통해 전달합니다.',
    },
    '65v2puy5': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'ko': '',
    },
  },
  // uploadTaxbills0126
  {
    'kjheluhg': {
      'en': '고지서 업로드',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '고지서 업로드',
    },
    'sqwl653v': {
      'en': '고지서를 업로드 해주세요.\n\n',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '98rhv3pw': {
      'en': 'jpeg, png만 업로드 가능합니다.',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'fgywpyfr': {
      'en': 'Hello World',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'toewajx0': {
      'en': '업로드 시 주의사항\n',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'x93f2rzl': {
      'en': '아래 예시를 참고하여 업로드 해주세요.',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'f22xttav': {
      'en': '다시 업로드',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '다시 업로드',
    },
    '6s8n4lx0': {
      'en': '업로드 하기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '업로드 하기',
    },
    'byg6jzjf': {
      'en': '현재 보유 발자국',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '현재 보유 발자국',
    },
    '5qh9cqj5': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'ko': '',
    },
  },
  // uploadTumblr0126
  {
    'v8rxt9dh': {
      'en': '텀블러 인증',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '텀블러 인증',
    },
    'ly743ry9': {
      'en': '영수증을 업로드 해주세요.\n\n',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'faa45s6h': {
      'en': 'jpeg, png만 업로드 가능합니다.',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'nk7iif6o': {
      'en': '업로드 시 주의사항\n',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'zi2z8b9l': {
      'en': '아래 예시를 참고하여 업로드 해주세요.',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'qma6ilx2': {
      'en': '다시 업로드',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '다시 업로드',
    },
    '1bvfmzcq': {
      'en': '업로드 하기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '업로드 하기',
    },
    'buxi3gmu': {
      'en': '현재 보유 발자국',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '현재 보유 발자국',
    },
    'zou08g1s': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'ko': '',
    },
  },
  // walking0127
  {
    'ugyckvuf': {
      'en': '만보기 인증',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '만보기 인증',
    },
    'isvu1jo9': {
      'en': '만보 발자국 받기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '만보 발자국 받기',
    },
    'jyq8all8': {
      'en': '현재 보유 발자국',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '현재 보유 발자국',
    },
    'nov6cccj': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'ko': '',
    },
  },
  // editaddress0127
  {
    '8pfydogv': {
      'en': '우편번호 입력',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '6xkt22a4': {
      'en': '주소찾기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '주소찾기',
    },
    '5fvqxl83': {
      'en': '주소 입력',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'iu53v6qh': {
      'en': '상세 주소 입력',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '5qlnmixq': {
      'en': '주소 수정하기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'l1anm621': {
      'en': '주소 검색',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '주소 검색',
    },
    'nxrx55w8': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
  },
  // footprintlist0127
  {
    'np5sb91k': {
      'en': '당신의 소중한 발자국',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '당신의 소중한 발자국',
    },
    'f6qjcqct': {
      'en': 'Transactions',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '적립 내역',
    },
    'myy1grgn': {
      'en': '당신의 발자취',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '당신의 발자취',
    },
    '8b4rrg24': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
  },
  // basket0203
  {
    '5p8ti7z3': {
      'en': '지원 농장',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '지원 농장',
    },
    'ku07fv8z': {
      'en': '옥천 저탄소 꿀사과',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '옥천 저탄소 꿀사과',
    },
    'ecdj9rbj': {
      'en': '수량 1개',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '수량 1개',
    },
    'mijfnfah': {
      'en': '10500',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '10500',
    },
    'ecen05sx': {
      'en': '원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '원',
    },
    'opfcizdu': {
      'en': '풀무원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '풀무원',
    },
    '83mu270y': {
      'en': '큰 두부',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '큰 두부',
    },
    '2ap4eus2': {
      'en': '수량 1개',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '수량 1개',
    },
    'ft5x6fgs': {
      'en': '2000',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '2000',
    },
    '2akfuq9m': {
      'en': '원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '원',
    },
    '5fup7bjg': {
      'en': '결제할 상품',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '결제할 상품',
    },
    'evdpm0xn': {
      'en': '상품 금액',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '상품 금액',
    },
    '2wu6jc3v': {
      'en': '12500',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'tabck4my': {
      'en': '원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '원',
    },
    'zp3b1u1z': {
      'en': '할인 금액 예상 ',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '할인 금액 예상 ',
    },
    'tc4o4kjp': {
      'en': '-',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'hwo0u6x5': {
      'en': '원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '원',
    },
    'vmnsjvgk': {
      'en': '보유 발자국 사용',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '보유 발자국 사용',
    },
    'y4cgk3sg': {
      'en': '사용',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '사용',
    },
    'jvgsdvm3': {
      'en': '결제 금액',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '결제 금액',
    },
    'vqs70swi': {
      'en': '원',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '원',
    },
    '6cywtbb4': {
      'en': '원 결제하기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '원 결제하기',
    },
    '0vnb5uf4': {
      'en': '장바구니',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '장바구니',
    },
    '21nw5t1h': {
      'en': '.',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
  },
  // alarm0203
  {
    'mavnji04': {
      'en': 'Below are messages with your friends.',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'oqir5wen': {
      'en': 'Randy Mcdonald',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'w7qywy62': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'fspr84a2': {
      'en': 'Mon. July 3rd - 4:12pm',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'bv932fqa': {
      'en': 'My Messages',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'i6q1guqo': {
      'en': '__',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
  },
  // uploadTransport0318
  {
    'jp1mkbvb': {
      'en': '대중교통 이용 인증 업로드',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '고지서 업로드',
    },
    'twks4s4g': {
      'en': '텍스트 제출시 주의사항\n',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '16ab2mg6': {
      'en': '아래 예시를 참고하여 제출해주세요.',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'lkufajp3': {
      'en': '해당 부분에 대한 문자 텍스트를 복사해서 넣어 주세요',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '6rakhtl0': {
      'en': '제출하고 3발자국 얻기',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '제출하고 3발자국 얻기',
    },
    'totry4tl': {
      'en': '현재 보유 발자국',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '현재 보유 발자국',
    },
    'ru17lpmr': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'ko': '',
    },
  },
  // attendance0125
  {
    'xjwfd4tr': {
      'en': '오늘의 발자국',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '오늘의 발자국',
    },
    '3xcep7cq': {
      'en': '1일차',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '1일차',
    },
    'isg2af0z': {
      'en': '2일차',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '2일차',
    },
    'vme7pku7': {
      'en': '3일차',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '3일차',
    },
    'iaut9klf': {
      'en': '4일차',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '4일차',
    },
    'zjzc33gx': {
      'en': '5일차',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '5일차',
    },
    'k5nz2uio': {
      'en': '6일차',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '6일차',
    },
    '1xyvk6yb': {
      'en': '7일차',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '7일차',
    },
    '2wf63trf': {
      'en': '출석하기',
      'ar': '출힉학',
      'de': '',
      'es': '',
      'ko': '출석하기',
    },
    'h09bmnmy': {
      'en': '보유 발자국',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
      'ko': '보유 발자국',
    },
    '7jrrxozu': {
      'en': '발자국',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '발자국',
    },
    'hr0ap150': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '9g1jqzqb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '1x9fu3be': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'asegiyhn': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'xxyl721o': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'mzgf9dig': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'zl0yq906': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'z7m33vih': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'waa75g3r': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'ckiidv35': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'p4kxdrg6': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'qc4j0t52': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'ko': '',
    },
  },
].reduce((a, b) => a..addAll(b));
