import 'package:flutter/material.dart';
import 'package:openai/screens/form_recommendation.dart';
import 'package:openai/viewmodels/recommendation_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecommendationViewModel()),
      ],
      child: MaterialApp(
        home: RecommendationView(),
      ),
    );
  }
}
