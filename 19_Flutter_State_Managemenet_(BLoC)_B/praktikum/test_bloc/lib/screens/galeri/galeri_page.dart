import 'package:flutter/material.dart';
import 'package:test_bloc/screens/galeri/detail_page.dart'; // Sesuaikan dengan lokasi DetailPage

class GaleriPage extends StatefulWidget {
  @override
  _GaleriPageState createState() => _GaleriPageState();
}

class _GaleriPageState extends State<GaleriPage> {
  List<String> gambar = [
    'gambar1.jpg',
    'gambar2.jpg',
    'gambar3.jpg',
    'gambar4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeri'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: gambar.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showImageBottomSheet(context, gambar[index]);
            },
            child: Card(
              child: Image.asset(
                'assets/img/${gambar[index]}',
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
                'assets/img/$image',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _navigateToDetailPage(context, image);
                    },
                    child: Text('Ya'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(selectedImage: 'assets/img/$image'),
      ),
    );
  }
}
