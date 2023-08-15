// import 'package:flutter/material.dart';
// import 'package:template/ui/shared/custom_widgets/custom_radioLisTile.dart';
// import 'package:template/ui/shared/extenssions/extenssions.dart';
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
//   int _score = 0;
//
//   List<Question> _questions = [
//     Question(
//       questionText: 'ما هو عاصمة فرنسا؟',
//       options: ['باريس', 'لندن', 'مدريد', 'روما', 'برلين'],
//       correctOptionIndex: 0,
//     ),
//     // إضافة المزيد من الأسئلة هنا
//   ];
//
//   void _checkAnswer(int selectedIndex) {
//     setState(() {
//       if (selectedIndex == _questions[_currentQuestionIndex].correctOptionIndex) {
//         _score++;
//       }
//       _currentQuestionIndex++;
//
//       if (_currentQuestionIndex >= _questions.length) {
//         // تم الانتهاء من الأسئلة
//         // يمكنك القيام بتنفيذ أي شيء تريده هنا
//       }
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     double progress = (_currentQuestionIndex + 1) / _questions.length;
//     return  Column(
//       children: [
//         LinearProgressIndicator(
//           value: progress,
//           color: Colors.green, // لون الشريط عندما يكون مكتمل
//           backgroundColor: Colors.grey, // لون الشريط عندما لم يتم تحقيق النسبة المئوية بعد
//         ),
//         (10).sbw,
//         Row(children: [
//           Text(''),
//           Text('')
//         ],),
//         Column(
//           children: _questions[_currentQuestionIndex]
//               .options
//               .asMap()
//               .entries
//               .map(
//                 (option) => Container(
//               margin: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black, width: 2.0),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//               child:CustomRadioLisTile(text:option.value,  value: option.key,
//                 groupValue: _selectedOption,
//                 onChanged: (selectedValue) => _checkAnswer(selectedValue),),
//             ),
//           )
//               .toList(),
//         ),
//
//       ],
//     );
//   }
// }
