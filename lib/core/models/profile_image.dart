// import 'package:dio/dio.dart';

// class ProfileImage {
//   final MultipartFile data;

//   ProfileImage({
//     required this.data,
//   });

//   Map<String, dynamic> toJson() {
//     return FormData.fromMap({
//       'files': [
//         data,
//       ]
//     }).fields.fold<Map<String, dynamic>>(
//       {},
//       (previousValue, element) {
//         previousValue[element.key] = element.value;
//         return previousValue;
//       },
//     );
//   }
// }