// import 'package:flutter/material.dart';
// import 'package:template/ui/shared/colors.dart';
// import 'package:template/ui/shared/custom_widgets/custom_radioLisTile.dart';
// import 'package:template/ui/shared/extenssions/extenssions.dart';
// import 'package:template/ui/shared/utils.dart';
// class Question {
//   final String questionText;
//   final List<String> options;
//   final int correctOptionIndex;
//
//   Question({required this.questionText, required this.options, required this.correctOptionIndex});
// }
// class CustomQuestion extends StatefulWidget {
//   final String questionText;
//   final List<String> options;
//   final int correctOptionIndex;
//   const CustomQuestion({super.key, required this.questionText, required this.options, required this.correctOptionIndex});
//
//   @override
//   State<CustomQuestion> createState() => _CustomQuestionState();
// }
//
// class _CustomQuestionState extends State<CustomQuestion> {
//   int _currentQuestionIndex = 0;
//
//   // int _score = 0;
//
//   List<Question> _questions = [
//     Question(
//       questionText: 'ما هو عاصمة فرنسا؟',
//       options: ['باريس', 'لندن', 'مدريد', 'روما', 'askdklsandk nns alnl nsnd nsa mdn,na nsdn asm,dn ,amsnd ,mans m,dnas,mnd ,mnas,m dn,amsnd'],
//       correctOptionIndex: 0,
//     ),
//     Question(
//       questionText: 'ما هو عاصمة فرنسا؟',
//       options: ['باريس', 'لندن', 'مدريد', 'روما', 'askdklsandk nns alnl nsnd nsa mdn,na nsdn asm,dn ,amsnd ,mans m,dnas,mnd ,mnas,m dn,amsnd'],
//       correctOptionIndex: 0,
//     ),
//     Question(
//       questionText: 'ما هو عاصمة فرنسا؟',
//       options: ['باريس', 'لندن', 'مدريد', 'روما', 'askdklsandk nns alnl nsnd nsa mdn,na nsdn asm,dn ,amsnd ,mans m,dnas,mnd ,mnas,m dn,amsnd'],
//       correctOptionIndex: 0,
//     ),
//     Question(
//       questionText: 'ما هو عاصمة فرنسا؟',
//       options: ['باريس', 'لندن', 'مدريد', 'روما', 'askdklsandk nns alnl nsnd nsa mdn,na nsdn asm,dn ,amsnd ,mans m,dnas,mnd ,mnas,m dn,amsnd'],
//       correctOptionIndex: 0,
//     ),
//     Question(
//       questionText: 'ما هو عاصمة فرنسا؟',
//       options: ['باريس', 'لندن', 'مدريد', 'روما', 'برلين'],
//       correctOptionIndex: 0,
//     ),
//     // إضافة المزيد من الأسئلة هنا
//   ];
//
//   // void _checkAnswer(int selectedIndex) {
//   //   setState(() {
//   //     if (selectedIndex == _questions[_currentQuestionIndex].correctOptionIndex) {
//   //       _score++;
//   //     }
//   //     _currentQuestionIndex++;
//   //
//   //     if (_currentQuestionIndex >= _questions.length) {
//   //       // تم الانتهاء من الأسئلة
//   //       // يمكنك القيام بتنفيذ أي شيء تريده هنا
//   //     }
//   //   });
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     double progress = (_currentQuestionIndex + 1) / _questions.length;
//     return  SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             (100).sbh,
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: LinearProgressIndicator(
//                 minHeight: 10,
//                 value: progress,
//                 color: Colors.lightBlue, // لون الشريط عندما يكون مكتمل
//                 backgroundColor: AppColors.mainPurple1, // لون الشريط عندما لم يتم تحقيق النسبة المئوية بعد
//               ),
//             ),
//             (20).sbh,
//             Padding(
//               padding:  EdgeInsets.only(left: width*0.6),
//               child: Text(_questions[_currentQuestionIndex].questionText,),
//             ),
//             (20).sbh,
//             Column(
//               children: _questions[_currentQuestionIndex]
//                   .options
//                   .asMap()
//                   .entries
//                   .map(
//                     (option) => Container(
//                   constraints: const BoxConstraints(minHeight: 70),
//                   margin: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
//                   padding: EdgeInsets.symmetric(horizontal:5,vertical: 10),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black, width: 2.0),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child:CustomRadioLisTile(text:option.value,  value: option.key,
//                       groupValue: progress,answer: true,fontSizeText:20),
//                 ),
//               )
//                   .toList(),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
