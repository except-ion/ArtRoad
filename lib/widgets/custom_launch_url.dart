import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

CustomLaunchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw Fluttertoast.showToast(
      msg: '링크를 열 수 없습니다.',
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}