import 'package:flutter/cupertino.dart';

class VehiclesData {
  static List<VecModel> vecModel = [
    VecModel(
        title: "سيارة صغيرة",//0
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "سيارة كبيرة",
        isChosen: false,//1
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "ونيت",
        isChosen: false,//2
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "شاحنة",//3
        isChosen: false,
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "دراجة نارية",
        isChosen: false,//4
        number: 0,
        textEditingController: TextEditingController()),
    VecModel(
        title: "دراجة هوائية",
        isChosen: false,
        number: 0,//5
        textEditingController: TextEditingController()),
    VecModel(
        title: " اسكوتر",
        isChosen: false,
        number: 0,//6
        textEditingController: TextEditingController()),
  ];

  static Map<String, List<dynamic>> fuelTypeCodes = {
    "Fuel type codes- V2-F": [
      'بنزين',
      'ديزل',
      'المكونات الكهربائية الهجينة (PHEV)',
      'هجين بالكامل (HEV)',
      'هجين معتدل (HEV)',
      'PNG / غاز البترول المسال',
      'كهربائى',
      'دراجة كهربائية',
      'أخر'
    ]
  };

  static Map<String, List<dynamic>> ownership = {
    "Ownership codes- V3-O": [
      'أسرة',
      'أرباب العمل',
      'مستأجرة',
      'أخر',
    ]
  };
  static Map<String, List<dynamic>> largeCar = {
    "LargeCar": [
      'عربية بضائع خفيفة',
      'عربية بضائع ثقيلة',
      'مينى باص',
      'كوستر',
      'اوتوبيس',
      'أخرى',
    ]
  };
  static Map<String, List<dynamic>> parkThisCar = {
    /*"Ownership codes- V3-O": [
      'المرأب الشخصى (المنزل)',
      'على جانب الطريق خالية',
      'على جانب الطريق مشحونة',
      'خارج الطريق / شاعرة',
      'الطرق الوعرة خالية',
      'خارج الطريق مشحونة',
      'فى الموقع سكنى مجانى',
      'على الموقع الدقة المشحونة'
    ]*/
    "Ownership codes- V3-O": [
      'كراج (داخل المنزل)',
      'الشارع - مجانى',
      'الشارع - مدفوع',
      'خارج الطريق - غير منظم',
      'خارج الطريق منظم - مجانى',
      'خارج الطريق منظم - مدفوع',
      'فى الموقع سكنى مجانى',
      'فى الموقع سكنى مدفوع',
      'أخرى'
    ]
  };

  static Map<String, dynamic> q3VecData = {
    " How far is the nearest public transport bus stop from your home by walk (in minutes) ?":
        [
      {"value": '<5 دقائق سيرا على الأقدام', "isChick": false},
      {"value": '6-10 دقائق سيرا على الأقدام', "isChick": false},
      {"value": '11 - 15 دقيقة مشي', "isChick": false},
      {"value": ' أكثر من 15 دقيقة', "isChick": false},
      {"value": 'لا اعرف', "isChick": false},
      {"value": 'لا يوجد محطة', "isChick": false},
    ],
    "index":0
  };
}

class VecModel {
  late String title;
  late int number = 0;
  late bool isChosen = false;
  late TextEditingController textEditingController;

  VecModel({
    required this.title,
    required this.isChosen,
    required this.number,
    required this.textEditingController,
  });
}
