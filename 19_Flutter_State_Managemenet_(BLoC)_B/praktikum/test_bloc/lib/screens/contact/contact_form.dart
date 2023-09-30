import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:test_bloc/models/contact.dart'; // Import model Contact

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  // Controller untuk input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateInputController = TextEditingController();
  final TextEditingController _fileInputController = TextEditingController();

  // Variabel untuk menyimpan warna yang dipilih
  Color _selectedColor = Colors.red;

  // Metode untuk menampilkan dialog pemilihan tanggal
  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      _dateInputController.text = formattedDate;
    }
  }

  // Metode untuk menampilkan dialog pemilihan warna
  void _pickColors(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  _selectedColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  // Metode untuk mengambil file
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      _fileInputController.text = file.name;
    }
  }

  // Metode untuk menambahkan atau mengedit kontak
  void _addOrEditContact() {
    final name = _nameController.text.trim();
    final phone = _phoneController.text;
    final date = _dateInputController.text;
    final fileName = _fileInputController.text;
    if (name.isEmpty || phone.isEmpty || date.isEmpty || fileName.isEmpty) {
      // Tampilkan pesan kesalahan jika ada input yang kosong
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Semua field harus diisi.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return; // Keluar dari metode jika ada input yang kosong
    }

    // Buat objek Contact dari data yang diinputkan
    Contact newContact = Contact(
      name: name,
      phone: phone,
      date: date,
      color: _selectedColor,
      fileName: fileName,
    );

    // Lakukan sesuatu dengan objek newContact, misalnya tambahkan ke daftar kontak

    // Setelah selesai, Anda dapat mereset nilai-nilai dalam input fields seperti ini:
    _nameController.clear();
    _phoneController.clear();
    _dateInputController.clear();
    setState(() {
      _selectedColor = Colors.red;
    });
    _fileInputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                hintText: 'Masukkan nama kontak',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                hintText: 'Masukkan no telepon',
              ),
            ),
            TextField(
              controller: _dateInputController,
              decoration: InputDecoration(
                labelText: 'Tanggal',
                hintText: 'Pilih tanggal',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ),
              readOnly: true,
            ),
            TextField(
              controller: _fileInputController,
              decoration: InputDecoration(
                labelText: 'File',
                hintText: 'Pilih file',
                suffixIcon: IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () => _pickFile(),
                ),
              ),
              readOnly: true,
            ),
            ElevatedButton(
              onPressed: _addOrEditContact,
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
