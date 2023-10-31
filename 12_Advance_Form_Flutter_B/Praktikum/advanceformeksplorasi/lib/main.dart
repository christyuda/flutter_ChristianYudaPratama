import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Contact {
  late String name;
  late String phone;
  late String date;
  late Color color;
  late String fileName;

  Contact(this.name, this.phone, this.date, this.color, this.fileName);
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateInputController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _fileInputController = TextEditingController();
  List<Contact> contacts = [];
  int editingIndex = -1;

  Color _selectedColor = Colors.red;

  @override
  void initState() {
    super.initState();
    _dateInputController.text = '';
    _colorController.text = '';
  }

  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        _dateInputController.text = formattedDate;
      });
    }
  }

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

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _fileInputController.text = file.name;
      });
    }
  }

  void _addContact() {
    final name = _nameController.text.trim();
    final phone = _phoneController.text;
    final date = _dateInputController.text;
    final color = _selectedColor;
    final fileName = _fileInputController.text;
    print('Name: $name');
    print('Phone: $phone');
    print('Date: $date');
    print('Color: $color');
    print('File Name: $fileName');

    // Validasi data

    if (name.isEmpty || phone.isEmpty || date.isEmpty || fileName.isEmpty) {
      _showErrorDialog('Semua field harus diisi.');
      return;
    }

    // Tambahkan ke daftar kontak
    final newContact = Contact(name, phone, date, color, fileName);
    setState(() {
      if (editingIndex == -1) {
        contacts.add(newContact);
      } else {
        contacts[editingIndex] = newContact;
        editingIndex = -1;
      }
    });

    // Bersihkan field input
    _nameController.clear();
    _phoneController.clear();
    _dateInputController.clear();
    _colorController.clear();
    _selectedColor = Colors.red;
    _fileInputController.clear();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
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
  }

  void _editContact(int index) {
    final contact = contacts[index];
    setState(() {
      _nameController.text = contact.name;
      _phoneController.text = contact.phone;
      _dateInputController.text = contact.date;
      _selectedColor = contact.color;
      _fileInputController.text = contact.fileName;
      editingIndex = index;
    });
  }

  void _deleteContact(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Contact'),
          content: Text('Apakah Anda yakin ingin menghapus kontak ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  contacts.removeAt(index);
                  editingIndex = -1;
                });
                Navigator.of(context).pop();
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Deskripsi'),
                    content: Text('Ini adalah aplikasi Kontak Flutter.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Tutup'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Create New Contact',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
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
                      controller: _colorController,P
                      decoration: InputDecoration(
                        labelText: 'Warna',
                        hintText: 'Pilih warna',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.color_lens),
                          onPressed: () => _pickColors(context),
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _addContact,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    editingIndex == -1 ? 'Submit' : 'Update',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'List Contacts',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(contact.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone: ${contact.phone}'),
                        Text('Date: ${contact.date}'),
                        Text('File: ${contact.fileName}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editContact(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteContact(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
