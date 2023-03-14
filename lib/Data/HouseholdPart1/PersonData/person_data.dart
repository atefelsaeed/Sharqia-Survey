class PersonData {
  static Map<String, dynamic> relationshipToTheHeadOfHouseholdWoman = {
    " Relationship to the Head of Household": [
      'ذاتي / رب الأسرة',
      'زوجة',
      'إبنه',
      'الاباء / الاجداد',
      'إخوة',
      'أقارب أخرين',
      'زميل فى العمل',
      'خادمة',
      'غير ذى صلة',
      'أخرى'
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> relationshipToTheHeadOfHouseholdMan = {
    " Relationship2 to the Head of Household": [
      'ذاتي / رب الأسرة',
      'زوج',
      'إبن',
      'الاباء / الاجداد',
      'إخوة',
      'أقارب أخرين',
      'زميل فى العمل',
      'سائق',
      'غير ذى صلة',
      'أخرى'
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> gender = {
    "gender": [
      'ذكر',
      'أنثى',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> groupAge = {
    "group Age": [
      {"value": '< 6', "isChick": false, "type": "0"},
      {"value": ' 6 - 11', "isChick": false, "type": "2"},
      {"value": '12 - 15', "isChick": false, "type": "2"},
      {"value": '16 - 18', "isChick": false, "type": "1"},
      {"value": '19 -24', "isChick": false, "type": "1"},
      {"value": ' 25 - 34', "isChick": false, "type": "1"},
      {"value": '35 - 44', "isChick": false, "type": "1"},
      {"value": '45 - 54', "isChick": false, "type": "1"},
      {"value": '55 - 64', "isChick": false, "type": "1"},
      {"value": '65 - 74', "isChick": false, "type": "1"},
      {"value": '>74', "isChick": false, "type": "retired"},
    ],
    "title": "MainOccupation",
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> occupationSector = {
    "what is the Occupation Sector": [
      'مكاتب - حكومية',
      ' مكتب - خاص',
      'تعليم- مدرسة',
      'التعليم - الجامعة',
      'مستشفى طبي- مركز صحي (خاص)',
      'مستشفى طبي- مركز صحي (حكومي)',
      'بناء البناء',
      'البناء- البنية التحتية',
      'خادمة في المنزل ، وخادم ، وسائق ، مزارع ، إلخ.',
      'النقل - الميناء / الميناء',
      'صناعية - قطر للبترول / غاز',
      'صناعية / ميكانيكا ، مصنع محلات تجارية ، لوجستية',
      'التجارة التجارية - غير المكتبية',
      'سائق- باص ، تاكسي ، ليموزين',
      ' حدد أخرى',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> occupationSectorUnveristy = {
    "what is the Occupation Sector": [

      'التعليم - الجامعة',


    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> occupationSectorSchool = {
    "what is the Occupation Sector": [
      'تعليم- مدرسة',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> workplace = {
    "what best describe your workplace location(s)?": [
      'سيارة كسائق',
      'سيارة كراكب',
      'أجرة',
      'نقل عام',
      'باص العمل',
      'باص المدرسة',
      'اجرة من المدرسة',
      'دراجة نارية',
      'المشي <5 دقائق',
      'المشي 6-10 دقائق',
      'المشي 11-15 دقيقة',
      'المشي 16-20 دقيقة',
      'مشى +20 دقيقة',
      'دراجة هوائية',
      'أخرى'
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> drivingLiences = {
    "?What type of driving licence do you have": [
      'دائما',
      'بعض الاحيان',
      'أبدا',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> busBuss = {
    " ?Do you have a Bus Pass": [
      'نعم',
      'لا',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> licence = {
    " ? What type of driving licence do you have": [
      'السيارة فقط',
      'دراجة نارية فقط',
      'السيارة والدراجات النارية على حد سواء',
      'مركبات البضائع الخفيفة',
      'مركبات نقل البضائع الثقيلة',
      'رخصة مؤقتة (تصريح / متعلم)',
      'بدون ترخيص',
      'آخر',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> transporterMoblity = {
    "?Do you have any disability/Special Needs for Transport Mobility": [
      'لا مشكلة',
      'مستخدم لكرسي متحرك',
      'أعمى جزئيا',
      'أعمى',
      'ضعف الكلام والعنوان',
      'صعوبة في الوقوف / المشي',
      'أخرى .. حدد',
    ],
    "title": "mainMade",
    "subTitle": "mainMade",
    "chosenIndex": 0,
  };

  static Map<String, dynamic> mainOccupation = {
    "MainOccupation": [
      {
        "value": 'يعمل بدوام كامل',
        "isChick": false,
        "type": "employee",
      },
      {
        "value": 'عاطلين عن العمل',
        "isChick": false,
        "type": "unemployee",
      },
      {
        "value": 'العمل بدوام جزئي (أقل من 5 ساعات في اليوم)',
        "isChick": false,
        "type": "employee"
      },
      {
        "value": 'العاملين لحسابهم الخاص (الأعمال الخاصة)',
        "isChick": false,
        "type": "employee"
      },
      {
        "value": 'طالب - مدرسة ابتدائية',
        "isChick": false,
        "type": "employee",
      },
      {
        "value": 'طالب - مدرسة متوسطة',
        "isChick": false,

        "type": "student",
      },
      {"value": 'طالب - مدرسة ثانوية', "isChick": false, "type": "student"},
      {
        "value": ' طالب - الكلية: بدوام كامل (لا يعمل)',
        "type": "student",
        "isChick": false
      },
      {
        "value": 'الطالب - الكلية: بدوام كامل - يعمل بدوام جزئي',
        "isChick": false,
        "type": "student"
      },
      {
        "value": 'طالب - كلية: دوام جزئي - يعمل بدوام جزئي',
        "isChick": false,
        "type": "student"
      },
      {
        "value": 'طالب - جامعي: دوام كامل (لا يعمل) ',
        "isChick": false,
        "type": "student"
      },
      {
        "value": 'طالب - جامعي: دوام كامل - يعمل بدوام جزئي',
        "isChick": false,
        "type": "student"
      },
      {
        "value": 'طالب - جامعي: دوام جزئي - يعمل بدوام جزئي',
        "isChick": false,
        "type": "student"
      },
      {"value": 'شخص البيت', "isChick": false, "type": "student"},
      {"value": 'معاق / مريض', "isChick": false, "type": "student"},
      {
        "value": 'طفل فى الحضانة',
        "isChick": false,
        "type": "retired",
      },
      {
        "value": 'طفل ليس فى الحضانة',
        "isChick": false,
        "type": "retired",
      },
      {
        "value": 'متقاعد',
        "isChick": false,
        "type": "retired",
      },
      {
        "value": 'رفض',
        "isChick": false,
        "type": "retired",
      },
    ],
    "title": "MainOccupation",
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "chosenIndex": 0,
  };
  static Map<String, dynamic> mainOccupationUnder5 = {
    "MainOccupation": [
         {
        "value": 'طفل فى الحضانة',
        "isChick": false,
        "type": "retired",
      },
      {
        "value": 'طفل ليس فى الحضانة',
        "isChick": false,
        "type": "retired",
      },

    ],
    "title": "MainOccupation",
    "subTitle":
    " A separate family is defined as who share the kitchen expenses and meals",
    "chosenIndex": 0,
  };
}
