// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:social/lib/models/user_books_model.dart';
//
// class OfflineBooksScreen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Offline books'),
//       ),
//       body: ListView.separated(
//           physics: const BouncingScrollPhysics(),
//           itemBuilder: (context,index) => offlineBooksItem(BooksModel()),
//           separatorBuilder:(context,index)=> Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 1.0,
//               width: double.infinity,
//               color: Colors.grey,
//             ),
//           ),
//           itemCount: 10),
//
//
//
//     );
//   }
//
//
//   Widget offlineBooksItem(BooksModel model) => Column(
//     children: [
//       const SizedBox(height: 10.0,),
//       Column(
//         children: const [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Image(
//               image: AssetImage("assets/images/life_book.jpg"),
//               width: double.infinity,
//               height: 200.0,
//             ),
//           ),
//         ],
//       ),
//       const SizedBox(width: 20.0,),
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             const Text(
//               'كتاب حياتي ياعين',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Spacer(),
//             IconButton(onPressed: (){}, icon: const Icon(Icons.file_download_done))
//           ],
//         ),
//       ),
//       const SizedBox(height: 10.0,)
//     ],
//   );
//
// }
