import 'package:flutter/material.dart';
import 'package:sharqia_household_survey/Resources/colors.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key, required this.notes}) : super(key: key);
  final String notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملاحظات'),
        backgroundColor: ColorManager.primaryColor,
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(notes),
        ),
      ),
    );
  }
}
