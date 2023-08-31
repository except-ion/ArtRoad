import 'package:flutter/material.dart';

class SignupTermsOfService extends StatefulWidget {
  const SignupTermsOfService({Key? key});

  @override
  State<SignupTermsOfService> createState() => _SignupTermsOfServiceState();
}

class _SignupTermsOfServiceState extends State<SignupTermsOfService> {
  bool allAgreementsChecked = false;
  List<bool> individualAgreementsChecked = [false, false, false, false];

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
                    '(필수) 이용약관 동의',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Add your action here
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 4),
                ),
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
                    '(필수) 이용약관 동의',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Add your action here
                },
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationThickness: 4),
                ),
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
            children: [
              Checkbox(
                value: individualAgreementsChecked[3],
                onChanged: (value) => toggleIndividualAgreement(3, value),
                activeColor: Color(0xFF00233D),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Text(
                '(선택) 광고성 정보 수신 동의',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
