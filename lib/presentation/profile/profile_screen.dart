import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int templateId = 98054;
  // 카카오톡 실행 가능 여부 확인
  Future<void> share () async {
	if (await isKakaoTalkInstalled()) {
      final Uri uri = await ShareClient.instance.shareCustom(templateId: templateId);
      await ShareClient.instance.launchKakaoTalk(uri);
   } else {
    try {
        Uri shareUrl = await WebSharerClient.instance.makeCustomUrl(templateId: templateId);
        await launchBrowserTab(shareUrl, popupOpen: true);
      } catch (error) {
        print('카카오톡 공유 실패 $error');
      }
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              await share();
            },
            child: const Text('Kakao share'),
          )
        ],
      ),
    ));
  }
}
