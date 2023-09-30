import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:test_bloc/bloc/contact_bloc.dart';
import 'package:test_bloc/bloc/contact_event.dart';
import 'package:test_bloc/models/contact.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateInputController = TextEditingController();
  final TextEditingController _fileInputController = TextEditingController();

  Color _selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Create New Contact',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Enter contact name',
            ),
          ),
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              hintText: 'Enter phone number',
            ),
          ),
          TextField(
            controller: _dateInputController,
            decoration: InputDecoration(
              labelText: 'Date',
              hintText: 'Select date',
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
              hintText: 'Select file',
              suffixIcon: IconButton(
                icon: Icon(Icons.attach_file),
                onPressed: () => _pickFile(),
              ),
            ),
            readOnly: true,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  _addContact(context);
                },
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
        ],
      ),
    );
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

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _fileInputController.text = file.name;
      });
    }
  }

  void _addContact(BuildContext context) {
    try {
      final name = _nameController.text.trim();
      final phone = _phoneController.text;
      final date = _dateInputController.text;
      final fileName = _fileInputController.text;

      if (name.isEmpty || phone.isEmpty || date.isEmpty || fileName.isEmpty) {
        _showErrorDialog(context, 'All fields must be filled.');
        return;
      }

      final newContact = Contact(name, phone, date, _selectedColor, fileName);
      final contactBloc = BlocProvider.of<ContactBloc>(context);

      if (contactBloc != null) {
        contactBloc.add(AddContactEvent(newContact));
        _clearForm();
      } else {
        _showErrorDialog(context, 'ContactBloc is not initialized.');
      }
    } catch (e) {
      _showErrorDialog(context, 'An error occurred while adding contact: $e');
    }
  }

  void _clearForm() {
    _nameController.clear();
    _phoneController.clear();
    _dateInputController.clear();
    _fileInputController.clear();
    setState(() {
      _selectedColor = Colors.red;
    });
  }

  void _showErrorDialog(BuildContext context, String message) {
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
}
