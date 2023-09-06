import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SignupTermsOfService extends StatefulWidget {
  const SignupTermsOfService({Key? key});

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
              Text(
                '모두 동의합니다.',
                style: TextStyle(
                  fontSize: 16,
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
              Text(
                '만 14세 이상입니다.',
                style: TextStyle(
                  fontSize: 16,
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
                  Text(
                    '서비스 이용약관',
                    style: TextStyle(
                      fontSize: 16,
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
                          height: 400, // PDF 뷰어의 높이를 조절할 수 있습니다.
                          child: SfPdfViewer.asset(
                            'assets/docs/서비스이용약관.pdf', // PDF 파일 경로
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
                child: Text(
                  '자세히',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Color(0xFF00233D),
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
                  Text(
                    '개인정보 수집 및 이용',
                    style: TextStyle(
                      fontSize: 16,
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
                          height: 400, // PDF 뷰어의 높이를 조절할 수 있습니다.
                          child: SfPdfViewer.asset(
                            'assets/docs/서비스이용약관.pdf', // PDF 파일 경로
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
                child: Text(
                  '자세히',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Color(0xFF00233D),
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
