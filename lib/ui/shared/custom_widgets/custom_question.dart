import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/ui/shared/colors.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_radioLisTile.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';

class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  Question(
      {required this.questionText,
      required this.options,
      required this.correctOptionIndex});
}

class CustomQuestion extends StatefulWidget {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  const CustomQuestion(
      {super.key,
      required this.questionText,
      required this.options,
      required this.correctOptionIndex});

  @override
  State<CustomQuestion> createState() => _CustomQuestionState();
}

class _CustomQuestionState extends State<CustomQuestion> {
  int _currentQuestionIndex = 0;

  List<Question> _questions = [
    Question(
      questionText: 'ما هو عاصمة فرنسا؟',
      options: [
        'باريس',
        'لندن',
        'مدريد',
        'روما',
        'askdklsandk nns alnl nsnd nsa mdn,na nsdn asm,dn ,amsnd ,mans m,dnas,mnd ,mnas,m dn,amsnd'
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'ما هو عاصمة فرنسا؟',
      options: [
        'باريس',
        'لندن',
        'مدريد',
        'روما',
        'askdklsandk nns alnl nsnd nsa mdn,na nsdn asm,dn ,amsnd ,mans m,dnas,mnd ,mnas,m dn,amsnd'
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'ما هو عاصمة فرنسا؟',
      options: [
        'باريس',
        'لندن',
        'مدريد',
        'روما',
        'askdklsandk nns alnl nsnd nsa mdn,na nsdn asm,dn ,amsnd ,mans m,dnas,mnd ,mnas,m dn,amsnd'
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'ما هو عاصمة فرنسا؟',
      options: [
        'باريس',
        'لندن',
        'مدريد',
        'روما',
        'askdklsandk nns alnl nsnd nsa mdn,na nsdn asm,dn ,amsnd ,mans m,dnas,mnd ,mnas,m dn,amsnd'
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'ما هو عاصمة فرنسا؟',
      options: ['باريس', 'لندن', 'مدريد', 'روما', 'برلين'],
      correctOptionIndex: 0,
    ),
    // إضافة المزيد من الأسئلة هنا
  ];

  @override
  Widget build(BuildContext context) {
    double progress = (_currentQuestionIndex + 1) / _questions.length;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (15).sbh,
              CustomText(text: '100/20'),
              (10).sbh,
              LinearProgressIndicator(
                minHeight: 10,
                value: progress,
                color: Colors.lightBlue, // لون الشريط عندما يكون مكتمل
                backgroundColor: AppColors
                    .mainPurple1, // لون الشريط عندما لم يتم تحقيق النسبة المئوية بعد
              ),
              (30).sbh,
              CustomText(
                text:
                    '25. الخدمة بأفضل جهد في بروتوكول الانترنت IPV4 تعني ان :',
                fontsize: width * 0.04,
                textcolor: AppColors.mainBlack,
              ),
              (20).sbh,
              Column(
                children: _questions[_currentQuestionIndex]
                    .options
                    .asMap()
                    .entries
                    .map(
                      (option) => Container(
                        constraints: BoxConstraints(minHeight: width * 0.07),
                        margin: EdgeInsets.symmetric(vertical: width * 0.02),
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: width * 0.03),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: CustomRadioLisTile(
                            heighText: 1.5,
                            text: option.value,
                            value: option.key,
                            groupValue: progress,
                            answer: true,
                            fontSizeText: width * 0.04),
                      ),
                    )
                    .toList(),
              ),
              (10).sbh,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/images/ic_vector.svg',
                      width: width * 0.05),
                  (10).sbw,
                  SvgPicture.asset('assets/images/ic_reference.svg',
                      width: width * 0.05),
                  (10).sbw,
                  SvgPicture.asset('assets/images/ic_star.svg',
                      width: width * 0.05),
                  // SvgPicture.asset('assets/images/ic_star_selected.svg',width: width*0.05),
                ],
              ),
              (20).sbh,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: 'السابق',
                    textColor: AppColors.blueColor,
                    widthSize: width * 0.25,
                    backgroundColor: AppColors.mainWhite,
                    borderColor: AppColors.blueColor,
                  ),
                  CustomButton(
                      text: 'التالي',
                      textColor: AppColors.mainWhite,
                      widthSize: width * 0.25),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
