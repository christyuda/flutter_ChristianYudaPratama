import 'package:flutter/material.dart';
import 'package:flutterasset_dialog_navigation/DetailPage.dart';

class GaleriPage extends StatefulWidget {
  @override
  _GaleriPageState createState() => _GaleriPageState();
}

class _GaleriPageState extends State<GaleriPage> {
  // Daftar nama file gambar di dalam folder assets/img
  List<String> gambar = [
    'gambar1.jpg',
    'gambar2.jpg',
    'gambar3.jpg',
    'gambar4.jpg',

    // Tambahkan lebih banyak nama file gambar sesuai kebutuhan Anda
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeri'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah kolom dalam grid
        ),
        itemCount: gambar.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showImageBottomSheet(context, gambar[index]);
            },
            child: Card(
              child: Image.asset(
                'assets/img/${gambar[index]}', // Menggunakan path gambar dari folder assets/img
                width: 200,
                height: 200,
              ),
            ),
          );
        },
      ),
    );
  }

  void _showImageBottomSheet(BuildContext context, String image) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/img/$image', // Menggunakan path gambar dari folder assets/img
                width: 200,
                height: 200,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Tutup bottom sheet
                      _navigateToDetailPage(
                          context, image); // Pindah ke halaman detail
                    },
                    child: Text('Ya'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Tutup bottom sheet
                    },
                    child: Text('Tidak'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToDetailPage(BuildContext context, String image) {
    // Pindah ke halaman detail dengan mengirimkan gambar yang dipilih
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(selectedImage: 'assets/img/$image'),
      ),
    );
  }
}
