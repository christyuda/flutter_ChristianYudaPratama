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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Color> _selectedColors = [Colors.red]; // Default selected color is red
  TextEditingController _dateInputController = TextEditingController();
  TextEditingController _fileInputController = TextEditingController();

  @override
  void initState() {
    _dateInputController.text = '';
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
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

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _fileInputController.text = file.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          height: 600,
          child: Column(
            children: <Widget>[
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
              TextField(
                controller: _fileInputController,
                decoration: InputDecoration(
                  icon: Icon(Icons.attach_file),
                  labelText: "Tempat Upload File",
                ),
                readOnly: true,
              ),
              TextButton(
                onPressed: _pickFile,
                child: Text('Select File'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
