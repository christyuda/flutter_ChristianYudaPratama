import 'package:flutter/material.dart';
import 'package:openai/screens/result_recommendation.dart';
import 'package:openai/viewmodels/recommendation_view_model.dart';
import 'package:provider/provider.dart';

// Import ViewModel

class RecommendationView extends StatefulWidget {
  @override
  _RecommendationViewState createState() => _RecommendationViewState();
}

class _RecommendationViewState extends State<RecommendationView> {
  final TextEditingController priceController = TextEditingController();
  final TextEditingController cameraController = TextEditingController();
  final TextEditingController storageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final openAIViewModel = Provider.of<RecommendationViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Smartphone Recommendations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Harga'),
            ),
            TextField(
              controller: cameraController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Kamera (MP)'),
            ),
            TextField(
              controller: storageController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: 'Kapasitas Penyimpanan (GB)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final double price = double.tryParse(priceController.text) ?? 0;
                final int cameraMP = int.tryParse(cameraController.text) ?? 0;
                final int storageGB = int.tryParse(storageController.text) ?? 0;

                openAIViewModel.sendOpenAIRequest(price, cameraMP, storageGB);
              },
              child: Text('Get Recommendations'),
            ),
            if (openAIViewModel.isLoading)
              CircularProgressIndicator()
            else if (openAIViewModel.errorText.isNotEmpty)
              Text(openAIViewModel.errorText)
            else if (openAIViewModel.responseText.isNotEmpty)
              ResultScreen(openAIViewModel.responseText),
          ],
        ),
      ),
    );
  }
}
