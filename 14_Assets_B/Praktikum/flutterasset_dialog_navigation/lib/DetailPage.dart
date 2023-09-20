import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String selectedImage;

  DetailPage({required this.selectedImage});

  @override
  Widget build(BuildContext context) {
    final topContent = Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(selectedImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration:
              BoxDecoration(color: Color.fromRGBO(115, 142, 211, 0.898)),
          child: Center(
            child: Text(
              'Selamat datang halaman details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context); // Kembali ke halaman GaleriPage
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          topContent,
          SizedBox(height: 20),
          Center(
            child: Image.asset(
              selectedImage,
              width: 200,
              height: 200,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
