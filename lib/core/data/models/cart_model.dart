// import 'dart:convert';

// // import 'package:template/core/data/models/apis/meal_model.dart';

// class CartModel {
//   int? count;
//   double? total;
//   // MealModel? meal;

//   CartModel({this.count, this.total,
//    this.meal
  
//   });

//   CartModel.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     total = json['total'];
//     // meal = json['meal'] != null ?
//     //  MealModel.fromJson(json['meal']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['count'] = count;
//     data['total'] = total;
//     if (meal != null) {
//       data['meal'] = meal!.toJson();
//     }
//     return data;
//   }

//   static Map<String, dynamic> toMap(CartModel model) {
//     return {
//       'count': model.count,
//       'total': model.total,
//       'meal': model.meal,
//     };
//   }

//   static String encode(List<CartModel> list) => json.encode(
//         list
//             .map<Map<String, dynamic>>((element) => CartModel.toMap(element))
//             .toList(),
//       );

//   static List<CartModel> decode(String strList) =>
//       (json.decode(strList) as List<dynamic>)
//           .map<CartModel>((item) => CartModel.fromJson(item))
//           .toList();
// }
