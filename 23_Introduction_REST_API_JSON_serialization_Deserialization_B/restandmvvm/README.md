# restandmvvm

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

restandmvvm/
├── lib/
│ ├── main.dart
│ ├── models/
│ │ ├── contact.dart
│ │ └── post_data.dart
│ ├── bloc/
│ │ ├── contact_bloc.dart
│ │ ├── contact_event.dart
│ │ └── contact_state.dart
│ ├── service/
│ │ ├── api_service.dart // Untuk menangani HTTP requests
│ │ └── ...
│ ├── provider/
│ │ ├── contact_provider.dart // Untuk manajemen state global
│ │ └── ...
│ ├── viewmodel/
│ │ └── contact_viewmodel.dart
│ └── screens/
│ └── contact_form.dart
├── pubspec.yaml
└── ...
