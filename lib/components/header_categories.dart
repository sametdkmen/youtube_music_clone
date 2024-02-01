// import 'package:flutter/material.dart';
// import 'package:youtube_music_app/core/extension/context_extension.dart';

// class HeaderCategory extends StatelessWidget {
//   const HeaderCategory({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//               padding: EdgeInsets.only(left: 5.00),
//               child: SizedBox(
//                 height: context.dynamicHeight(0.04),
//                 child: Row(
//                   children: [
//                     TextButton(
//                       onPressed: () {
                        
//                       },
//                       style: TextButton.styleFrom(
//                         side: BorderSide(
//                           width: 0.8, //dış kenarlık kalınlığı
//                           color: Colors.grey.withAlpha(50),
//                         ),
//                         backgroundColor: Colors.white24.withAlpha(38),
//                         shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(8))),
//                         alignment: Alignment.center,
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Text(
//                           Categories.upCategoryList[index].name,
//                           style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 13,
//                               overflow: TextOverflow.visible,
//                               letterSpacing: 0.6,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//   }
// }