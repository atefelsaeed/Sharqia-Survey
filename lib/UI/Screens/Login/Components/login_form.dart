// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/sizes.dart';
import 'package:provider/provider.dart';

import '../../../../Helper/validator.dart';
import '../../../../Providers/auth.dart';
import '../../../../Resources/colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isView = true;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<Auth>(context, listen: false);
    try {
      debugPrint('featch auth');
      _auth.fetch();
    } catch (e) {
      rethrow;
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.email_outlined,
                color: ColorManager.grayColor,
              ),
              AppSize.spaceWidth1(context),
              Text(
                'البريد الالكترونى',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: width(context) * .04,
                ),
              ),
            ],
          ),
          AppSize.spaceHeight1(context),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1.5, color: ColorManager.primaryColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: ColorManager.error),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: "أدخل البريد الإلكترونى"),
            textDirection: TextDirection.ltr,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => Validator.validateEmail(
              value: value!,
              message: "خطأ فى البريد الإلكترونى",
            ),
          ),
          AppSize.spaceHeight3(context),
          Row(
            children: [
              Icon(
                Icons.vpn_key_outlined,
                color: ColorManager.grayColor,
              ),
              AppSize.spaceWidth1(context),
              Text(
                ' كلمة السر',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: width(context) * .04,
                ),
              ),
            ],
          ),
          AppSize.spaceHeight1(context),
          TextFormField(
            controller: password,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isView = !_isView;
                      });
                    },
                    icon: Icon(
                      _isView == true
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: ColorManager.gray2Color,
                      size: width(context) * .06,
                    )),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1.5, color: ColorManager.primaryColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5, color: ColorManager.error),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: "أدخل كلمة السر"),
            textDirection: TextDirection.ltr,
            obscureText: _isView,
            enableSuggestions: false,
            autocorrect: false,
            validator: (value) => Validator.validatePassword(
              value: value!,
              message: "خطأ فى كلمة السر",
            ),
          ),
          const SizedBox(height: 30),
          MaterialButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                showCustomDialog(
                  context,
                  SizedBox(
                    height: 220,
                    child: WillPopScope(
                      onWillPop: () async => false,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                );
                try {
                  final output = await Provider.of<Auth>(context, listen: false)
                      .login(email.text, password.text);
                  Navigator.of(context).pop();
                  if (!output) {
                    showCustomDialog(
                      context,
                      Column(
                        children: [
                          Center(
                            child: Transform.rotate(
                              angle: 0.785398,
                              child: const Icon(
                                Icons.add,
                                color: Colors.red,
                                size: 150,
                              ),
                            ),
                          ),
                          const Text("Verify your data"),
                        ],
                      ),
                    );
                  } else {
                    // Navigator.of(context)
                    //     .pushReplacementNamed(SurveysScreen.routeName);
                  }
                } catch (e) {
                  debugPrint(e.toString());
                  Navigator.of(context).pop();
                  showCustomDialog(
                    context,
                    Column(
                      children: const [
                        Center(
                          child: Icon(
                            Icons.wifi_off,
                            size: 150,
                          ),
                        ),
                        Text("خطأ فى الإتصال"),
                      ],
                    ),
                  );
                }
              }

              if (_formKey.currentState!.validate()) {
                _auth.login(email.text, password.text);
              }
            },
            color: ColorManager.primaryColor,
            child: Text(
              "تسجيل الدخول",
              style: TextStyle(
                color: ColorManager.wight,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showCustomDialog(BuildContext context, Widget content) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        content: SizedBox(
          height: 220,
          child: content,
        ),
      ),
    );
  }
}
