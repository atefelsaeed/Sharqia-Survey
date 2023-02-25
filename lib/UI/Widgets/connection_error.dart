import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  final Function reload;
  const ConnectionError(this.reload, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: reload as void Function()?,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Icon(
              Icons.wifi_off,
              size: 46,
            ),
          ),
          Text(
            "خطأ في الإتصال",
          ),
          Text(
            "حاول مرة أخرى",
          )
        ],
      ),
    );
  }
}
