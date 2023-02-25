class QuestionsData {
  static Map<String, dynamic> qh1 = {
    "? What best describes this dwelling type": [
      'فيلا',
      'فيلا مشتركة',
      'البيت العربي',
      'البيت العربي - مشترك',
      'شقة - عائلة واحدة',
      'شقة -مشتركة بين عائلتين أو أكثر',
      'تملك غرفة فى شقة - شخص واحد',
      'غرفة مشتركة فى شقة مع بعضها البعض',
      'غرفة مشتركة في شقة مع أكثر من واحد / مساحة السرير',
      'أخر'
    ]
  };
  static Map<String, dynamic> qh2 = {
    "Is this dwelling...": [
      'مالك',
      'مستأجر',
      'مقدمة من صاحب العمل',
      'مقدمة من الحكومة',
      'أخر'
    ]
  };
  static Map<String,dynamic> qh6_2 = {
    "Is this dwelling...": [
      'النزهه',
      'السلامه',
      'الربوة',
      'العزيزيه',
      'الرحاب',
      'بني مالك',
      'مشرفه',
      'الورود',
      'الشرفيه',
      'البغداديه',
      'الكندره',
      'العماريه',
      'الصحيفه',
      'السبيل',
      'الهنداويه',
      'البلد',
      'الثعاليه',
      'القريات',
      'بترومين',
      'غليل',
      'النزله اليمانيه',
      'النزله الشرقيه',
      'الوزيريه',
      'الجوهره',
      'الجامعه',
      'الثغر',
      'الرواني',
      'قویژه',
      'المنتزهات',
      'مدائن الفهد',
      'الفاروق',
      'العدل',
      'الفضل',
      'ام السلم',
    ]
  };
  static Map<String, dynamic> qh3 = {
    "?How many bedrooms are there in the accommodation you live in": [
      {"value": '1', "isChick": false},
      {"value": '2', "isChick": false},
      {"value": '3', "isChick": false},
      {"value": '4', "isChick": false},
      {"value": '5', "isChick": false},
      {"value": '6', "isChick": false},
      {"value": '7', "isChick": false},
      {"value": '8', "isChick": false},
      {"value": '9', "isChick": false},
      {"value": '10', "isChick": false},
      {"value": '11', "isChick": false},
      {"value": '>12', "isChick": false},
    ],
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "index": 0
  };
  static Map<String, dynamic> qh4 = {
    "? How many separate families live at this address": [
      {"value": '1', "isChick": false},
      {"value": '2', "isChick": false},
      {"value": '3', "isChick": false},
      {"value": '4', "isChick": false},
      {"value": '5', "isChick": false},
      {"value": '6', "isChick": false},
      {"value": '7', "isChick": false},
      {"value": '8', "isChick": false},
      {"value": '9', "isChick": false},
      {"value": '10', "isChick": false},
    ],
    "subTitle":
        " A separate family is defined as who share the kitchen expenses and meals",
    "index": 0
  };
  static Map<String, dynamic> qh5 = {
    "Qh5": "How many people usually live at this address? ( all families)",
    "subTitle": "Number of people include servants/maid and live-in drivers"
  };
  static Map<String, dynamic> qh6 = {
    "?How many people are in each of the separate family living at this address":
        [],
    "subTitle": "Number of people include servants/maid and live-in drivers"
  };
  q6Answer(adults, child, totalNumber) {
    Map<String, dynamic> qh5Answer = {
      "adults (18yrs +)": adults.toString(),
      "children (under 18yrs)": child.toString(),
      "Total Number of Vehicles in each family": totalNumber.toString()
    };
    return qh5Answer;
  }
  static Map<String, dynamic> qh7 = {
    "?How many years have you/your family lived at this particular address": [
      {"value": 'أقل من 1 سنة', "isChick": false},
      {"value": '- 3 سنوات', "isChick": false},
      {"value": '- 5 سنوات', "isChick": false},
      {"value": '- 10 سنوات', "isChick": false},
      {"value": '+ 10 سنوات', "isChick": false},
    ],
    "index": 0
  };
  static Map<String, dynamic> qh7_2 = {
    'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
        [
      {"value": 'نعم', "isChick": false},
      {"value": 'لا', "isChick": false},
    ],
    "index": 0
  };
  static Map<String, dynamic> hhsHavePastTrip = {
    'Did you move here from any of the Demolished areas of Jeddah, if yes which one':
        [
      {"value": 'نعم', "isChick": false},
      {"value": 'لا', "isChick": false},
    ],
    "index": 0
  };
  static Map<String, dynamic> qh8_1 = {
    "?How many pedal-cycles are owned or used by this household": {
      "adults (18yrs +)": "0",
      "children (under 18yrs)": "0",
      "Total Number of Vehicles in each family": "0"
    },
  };
  static Map<String, dynamic> qh8_2 = {
    "?How many Electric Bicycles are owned or used by this household": {
      'Total number of bikes': "0",
      'Adult bikes (18 yrs.+)': "0",
      'Children\'s bikes (<18 yrs.)': "0",
    }
  };
  static Map<String, dynamic> qh8_3 = {
    "?How many E Scooters are owned or used by this household": {
      'Total number of bikes': "0",
      'Adult bikes (18 yrs.+)': "0",
      'Children\'s bikes (<18 yrs.)': "0",
    }
  };
  static Map<String, dynamic> qh9 = {
    "Please indicate in which of the following bands your total monthly household income inclusive of benefits falls?":
        [
      '< 1500 ريال سعودي',
      '1500 - 2000 ريال سعودي',
      '2000 - 3000 ريال سعودي',
      '3000 - 5000 ريال سعودي',
      '5000 - 8000 ريال سعودي',
      '8000 - 12000 ريال سعودي',
      '12000 - 18000 ريال سعودي',
      '18000 - 25000 ريال سعودي',
      'أكثر من 25,000 ريال سعودي',
      'سرية / مرفوضة',
    ]
  };
}
