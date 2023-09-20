// import 'package:flutter/material.dart';
// import 'package:flutterasset_dialog_navigation/DetailPage.dart';

// void _showImageBottomSheet(BuildContext context, String image) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Image.asset(
//               'assets/img/$image', // Menggunakan path gambar dari folder assets/img
//               width: 200,
//               height: 200,
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context); // Tutup bottom sheet
//                     _navigateToDetailPage(
//                         context, image); // Pindah ke halaman detail
//                   },
//                   child: Text('Ya'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context); // Tutup bottom sheet
//                   },
//                   child: Text('Tidak'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// void _navigateToDetailPage(BuildContext context, String image) {
//   // Implementasikan navigasi ke halaman detail sesuai kebutuhan Anda
//   // Anda dapat menggunakan Navigator.push untuk berpindah ke halaman detail.
// }
