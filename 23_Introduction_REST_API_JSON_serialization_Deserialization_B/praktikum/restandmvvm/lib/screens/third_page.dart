import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:restandmvvm/bloc/jsonplace_bloc.dart';
import 'package:restandmvvm/bloc/jsonplace_event.dart';
import 'package:restandmvvm/services/jsonplace_service.dart';
import 'package:restandmvvm/viewmodels/editpost_viewmodel.dart';

class EditPostPage extends StatefulWidget {
  @override
  _EditPostPageState createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  bool _isUpdated = false;
  @override
  Widget build(BuildContext context) {
    final editPostBloc = BlocProvider.of<EditPostBloc>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                try {
                  final newTitle = _titleController.text;
                  final newBody = _bodyController.text;

                  // Dispatch the UpdatePostEvent with newTitle and newBody
                  context
                      .read<EditPostBloc>()
                      .add(UpdatePostEvent(newTitle, newBody));

                  setState(() {
                    _isUpdated = true; // Mark the update as successful
                  });
                } catch (e) {
                  // Handle errors here
                }
              },
              child: Text(_isUpdated ? 'Updated' : 'Update'),
            )
          ],
        ),
      ),
    );
  }
}
