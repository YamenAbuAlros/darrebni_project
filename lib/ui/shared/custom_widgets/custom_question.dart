// import 'package:flutter/material.dart';
// import 'package:template/ui/shared/custom_widgets/custom_radioLisTile.dart';
// import 'package:template/ui/shared/extenssions/extenssions.dart';
// class CustomQuestion extends StatelessWidget {
//   const CustomQuestion({super.key});
//
//   @override
//   Widget build(BuildContext context) {
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
//               // ElevatedButton(
//               //   onPressed: () => _checkAnswer(option.key),
//               //   child: Text(option.value),
//               // ),
//             ),
//           )
//               .toList(),
//         ),
//
//       ],
//     );
//   }
// }
