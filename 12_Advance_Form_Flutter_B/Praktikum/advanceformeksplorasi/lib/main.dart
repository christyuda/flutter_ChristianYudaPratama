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
  List<Color> _selectedColors = [Colors.red];
  String _selectedFileName = '';
  List<Contact> contacts = [];
  int editingIndex = -1;

  void _addContact() {
    final name = _nameController.text.trim();
    final phone = _phoneController.text;
    final date = _dateInputController.text;
    final color = _selectedColors.isNotEmpty ? _selectedColors[0] : Colors.red;
    final fileName = _selectedFileName;

    if (editingIndex == -1) {
      final newContact = Contact(name, phone, date, color, fileName);
      setState(() {
        contacts.add(newContact);
        _nameController.clear();
        _phoneController.clear();
        _dateInputController.clear();
        _selectedColors = [Colors.red];
        _selectedFileName = '';
      });
    } else {
      setState(() {
        contacts[editingIndex].name = name;
        contacts[editingIndex].phone = phone;
        contacts[editingIndex].date = date;
        contacts[editingIndex].color = color;
        contacts[editingIndex].fileName = fileName;
        editingIndex = -1;
        _nameController.clear();
        _phoneController.clear();
        _dateInputController.clear();
        _selectedColors = [Colors.red];
        _selectedFileName = '';
      });
    }
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

  void _deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void _editContact(int index) {
    setState(() {
      final contact = contacts[index];
      _nameController.text = contact.name;
      _phoneController.text = contact.phone;
      _dateInputController.text = contact.date;
      _selectedColors = [contact.color];
      _selectedFileName = contact.fileName;
      editingIndex = index;
    });
  }

  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
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
          title: const Text('Pick Colors'),
          content: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: _selectedColors.isNotEmpty
                      ? _selectedColors[0]
                      : Colors.white,
                  border: Border.all(color: Colors.black),
                ),
              ),
              SizedBox(height: 16.0),
              MultipleChoiceBlockPicker(
                pickerColors: _selectedColors,
                onColorsChanged: (List<Color> colors) {
                  setState(() {
                    _selectedColors = colors;
                  });
                },
              ),
            ],
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

  void _pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String fileName = result.files.first.name ?? '';
      setState(() {
        _selectedFileName = fileName;
      });
    } else {
      // User canceled the file picker
      print('File picker canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //...
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //...
            Stack(
              alignment: Alignment.topRight,
              children: [
                TextField(
                  controller: _dateInputController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: "Enter Date",
                  ),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Colors',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: _selectedColors.isNotEmpty
                    ? _selectedColors[0]
                    : Colors.white,
                border: Border.all(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickColors(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Pick Colors'),
                  const SizedBox(width: 5),
                  Icon(Icons.color_lens),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: _selectedColors.isNotEmpty
                    ? _selectedColors[0]
                    : Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickFile(context),
              child: Text('Pick File'),
            ),
            SizedBox(height: 20),
            //...
          ],
        ),
      ),
    );
  }
}
