import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'About Us',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            // List of Programs/Services/Products in Cards
            Card(
              child: ListTile(
                title: Text('Program/Jasa/Barang 1'),
                subtitle: Text('Deskripsi Program/Jasa/Barang 1'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Program/Jasa/Barang 2'),
                subtitle: Text('Deskripsi Program/Jasa/Barang 2'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Program/Jasa/Barang 3'),
                subtitle: Text('Deskripsi Program/Jasa/Barang 3'),
              ),
            ),
            // Add more cards as needed
          ],
        ),
      ),
    );
  }
}
