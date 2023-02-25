class UserSurveyStatus {
  UserSurveyStatusData? data;

  UserSurveyStatus({this.data});

  UserSurveyStatus.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserSurveyStatusData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserSurveyStatusData {
  int? formFilled;
  int? formNotFilled;
  int? allForms;

  UserSurveyStatusData({this.formFilled, this.formNotFilled, this.allForms});

  UserSurveyStatusData.fromJson(Map<String, dynamic> json) {
    formFilled = json['form_filled'];
    formNotFilled = json['form_not_filled'];
    allForms = json['all_forms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['form_filled'] = formFilled;
    data['form_not_filled'] = formNotFilled;
    data['all_forms'] = allForms;
    return data;
  }
}
