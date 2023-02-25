class TripData {
  // static Map<String, dynamic> purposeOfBeingThere = {
  //   "QPurposeOfBeingThere": [
  //     {"value": ' في المنزل', "isChick": false},
  //     {"value": 'فى بيت العطلات / الفندق', "isChick": false},
  //     {"value": 'العمل - فى مكتب / مقر العمل', "isChick": false},
  //     {"value": 'العمل - خارج مكتب / مقر العمل', "isChick": false},
  //     {"value": 'مكان تعليمى', "isChick": false},
  //     {"value": 'التسوق', "isChick": false},
  //     {"value": 'عمل شخصي', "isChick": false},
  //     {"value": 'طبى / مستشفى', "isChick": false},
  //     {"value": 'زیارة الأصدقاء / الأقار', "isChick": false},
  //     {"value": 'ترفيه / وقت الفراغ', "isChick": false},
  //     {"value": 'توص الى المدرسة / التعليم', "isChick": false},
  //     {"value": 'توص الى مكان آخر', "isChick": false},
  //   ],
  //   "title": "?What was the purpose of being there",
  //   "subTitle":
  //       " A separate family is defined as who share the kitchen expenses and meals",
  //   "chosenIndex": 0,
  // };
  static Map<String, dynamic> travelWithOther = {
    'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
    [
      {"value": 'مع الأخرين', "isChick": false},
      {"value": 'بمفردك', "isChick": false},
    ],
    "index": 0
  };
  // static Map<String, dynamic> tripReason = {
  //   "TripReason": [
  //     {"value": ' في المنزل', "isChick": false},
  //     {"value": 'فى بيت العطلات / الفندق', "isChick": false},
  //     {"value": 'العمل - فى مكتب / مقر العمل', "isChick": false},
  //     {"value": 'العمل - خارج مكتب / مقر العمل', "isChick": false},
  //     {"value": 'مكان تعليمى', "isChick": false},
  //     {"value": 'التسوق', "isChick": false},
  //     {"value": 'عمل شخصي', "isChick": false},
  //     {"value": 'طبى / مستشفى', "isChick": false},
  //     {"value": 'زیارة الأصدقاء / الأقار', "isChick": false},
  //     {"value": 'ترفيه / وقت الفراغ', "isChick": false},
  //     {"value": 'توص الى المدرسة / التعليم', "isChick": false},
  //     {"value": 'توص الى مكان آخر', "isChick": false},
  //   ],
  //   "title": "?What was the purpose of being there",
  //   "subTitle":
  //       " A separate family is defined as who share the kitchen expenses and meals",
  //   "chosenIndex": 0,
  // };

  static Map<String, dynamic> mainMade = {
    "mainMade": [
      'سائق سيارة',
      'ركاب السيارة',
      'تاكسي (اسأل عن نوع التاكسي',
      'الحافلات العامة',
      'حافلة الشركة',
      'باص المدرسة',
      'تاكسي المدرسة',
      'دراجة نارية',
      'المشي <5 دقائق',
      'المشي> 6-10 دقائق',
      'المشي> 11-15 دقيقة',
      'المشي> 16-20 دقيقة',
      'المشي> 20 + ناقص',
      'دراجة هوائية',
      'أخر'
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> AcMode = {
    "AcMode": [
      'سائق سيارة',
      'ركاب السيارة',
      'تاكسي (اسأل عن نوع التاكسي',
      'الحافلات العامة',
      'حافلة الشركة',
      'باص المدرسة',
      'تاكسي المدرسة',
      'دراجة نارية',
      'المشي <5 دقائق',
      'المشي> 6-10 دقائق',
      'المشي> 11-15 دقيقة',
      'المشي> 16-20 دقيقة',
      'المشي> 20 + ناقص',
      'دراجة هوائية',
      'أخر'
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> memberHouseHoldTravel = {
    "?Which members of the household travelled with you": [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8'
    ],
    "title": "?Which members of the household travelled with you",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> whereDidYouPark = {
    "?where did you park": [
      'موقف سيارات خاص - محجوز',
      'موقف سيارات خاص - غير محجوز',
      'موقف سيارات عام - مدفوع',
      'في الشارع - مساحة محددة',
      'في الشارع - مساحة غير محددة',
      'خدمة صف السيارات',
      'تم النزول - خاص',
      'نزلت - سيارة أجرة',
      'أخر'
    ],
    "title": "?where did you park",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> whatTypeOfTravel = {
    "What did you travel to?": [
      'سيارة',
      'تاكسي',
      'وسائل النقل العام',
      'دراجة نارية',
      'دراجة هوائية',
      'المشي'
    ],
    "title": "?where did you park",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> whatTypeOfTaxi = {
    "?what type of taxi did you use and how much fare did you pay": [
      'تاكسي',
      'اوبر',
      'كريم',
      // "أخر"
    ],
    "title": "?where did you park",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> howOftenDoYouMakeThisTrip = {
    "?How often do you make this Trip": [
      '5 أيام في الأسبوع',
      "4 أيام في الأسبوع",
      "3 أيام في الأسبوع",
      "2 أيام في الأسبوع",
      "أقل من مرة فى الأسبوع",
      "أقل من مرة فى الشهر"
    ],
    "title": "?How often do you make this Trip",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
}
