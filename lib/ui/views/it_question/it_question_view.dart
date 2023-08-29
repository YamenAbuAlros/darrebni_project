import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:template/ui/shared/custom_widgets/custom_app_bar.dart';
import 'package:template/ui/shared/custom_widgets/custom_button.dart';
import 'package:template/ui/shared/custom_widgets/custom_question.dart';
import 'package:template/ui/shared/custom_widgets/custom_radioLisTile.dart';
import 'package:template/ui/shared/custom_widgets/custom_text.dart';
import 'package:template/ui/shared/extenssions/extenssions.dart';
import 'package:template/ui/shared/utils.dart';
import 'package:template/ui/views/it_question/it_question_controller.dart';

import '../../shared/colors.dart';

class ItQuestionView extends StatefulWidget {
  const ItQuestionView(
      {super.key,
      required this.collageName,
      required this.materialName,
      required this.typeOfQuestion});

  final String collageName;
  final String materialName;
  final String typeOfQuestion;

  @override
  State<ItQuestionView> createState() => _ItQuestionViewState();
}

class _ItQuestionViewState extends State<ItQuestionView> {
  late ItQuestionController controller;
  List<Question> _questions = [
    Question(
      questionText: 'ما هو عاصمة فرنسا؟',
      options: [
        'بروتوكول الانترنت يقدم اليات تحكم بالتدفق و التحكم بالأخطاء',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات'
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'ما هو عاصمة فرنسا؟',
      options: [
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات'
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'ما هو عاصمة فرنسا؟',
      options: [
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات'
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'ما هو عاصمة فرنسا؟',
      options: [
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات'
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'ما هو عاصمة فرنسا؟',
      options: [
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات',
        'بروتوكول الانترنت هو بروتوكول موثوق و أمن لنقل المعطيات'
      ],
      correctOptionIndex: 0,
    ),
    // إضافة المزيد من الأسئلة هنا
  ];

  // get itemBuilder => null;
  int _currentQuestionIndex = 0;

  @override
  void initState() {
    controller = Get.put(ItQuestionController(
        collageName: widget.collageName,
        materialName: widget.materialName,
        typeOfQuestion: widget.typeOfQuestion));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentQuestionIndex + 1) / _questions.length;
    return Scaffold(
      body: Column(children: [
        CustomAppBar(
            iconName: 'ic_back',
            text:
                '${controller.collageName}/${widget.materialName}/${widget.typeOfQuestion}'),
        // CustomQuestion(questionText: questionText, options: options, correctOptionIndex: correctOptionIndex)
      ]),
    );
  }
}
