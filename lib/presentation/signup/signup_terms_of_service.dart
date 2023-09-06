import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SignupTermsOfService extends StatefulWidget {
  final Function(List<bool>) onAgreementsChanged;

  const SignupTermsOfService({Key? key, required this.onAgreementsChanged});

  @override
  State<SignupTermsOfService> createState() => _SignupTermsOfServiceState();
}

class _SignupTermsOfServiceState extends State<SignupTermsOfService> {
  bool allAgreementsChecked = false;
  List<bool> individualAgreementsChecked = [false, false, false];

  //모두 동의
  void toggleAllAgreements(bool? value) {
    if (value != null) {
      setState(() {
        allAgreementsChecked = value;
        for (int i = 0; i < individualAgreementsChecked.length; i++) {
          individualAgreementsChecked[i] = value;
        }
      });
    }
  }

  //개별동의
  void toggleIndividualAgreement(int index, bool? value) {
    if (value != null) {
      setState(() {
        individualAgreementsChecked[index] = value;
        if (!value) {
          allAgreementsChecked = false;
        } else {
          allAgreementsChecked =
              individualAgreementsChecked.every((isChecked) => isChecked);
        }
        // 개별 동의 체크박스 상태를 부모 위젯에 알리기
        widget.onAgreementsChanged(individualAgreementsChecked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.4,
          color: Color(0xFF00233D),
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: allAgreementsChecked,
                onChanged: toggleAllAgreements,
                activeColor: Color(0xFF00233D),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: AutoSizeText(
                  '모두 동의합니다.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          ),
          Divider(
            color: Color(0xFF00233D),
            thickness: 1,
          ),
          Row(
            children: [
              Checkbox(
                value: individualAgreementsChecked[0],
                onChanged: (value) => toggleIndividualAgreement(0, value),
                activeColor: Color(0xFF00233D),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: AutoSizeText(
                  '만 14세 이상입니다.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: individualAgreementsChecked[1],
                    onChanged: (value) => toggleIndividualAgreement(1, value),
                    activeColor: Color(0xFF00233D),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      '서비스 이용약관',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          height: 400,
                          child: SfPdfViewer.asset(
                            'assets/docs/서비스이용약관.pdf',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('닫기'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: AutoSizeText(
                    '자세히',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Color(0xFF00233D),
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: individualAgreementsChecked[2],
                    onChanged: (value) => toggleIndividualAgreement(2, value),
                    activeColor: Color(0xFF00233D),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      '개인정보 수집 및 이용',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SizedBox(
                          height: 400,
                          child: WebView(
                            initialUrl:
                                'https://plip.kr/pcc/148da46f-f4e5-4e54-814a-d6c8b3f8568b/consent/1.html',
                            javascriptMode: JavascriptMode.unrestricted,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('닫기'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: AutoSizeText(
                    '자세히',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Color(0xFF00233D),
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
