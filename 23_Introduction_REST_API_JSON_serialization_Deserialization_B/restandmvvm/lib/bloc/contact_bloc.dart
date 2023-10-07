import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restandmvvm/models/contact.dart';
import 'package:restandmvvm/services/apiget_service.dart';

class ContactBloc extends Cubit<Contact?> {
  final ContactService repository = ContactService();

  ContactBloc() : super(null);

  Future<void> fetchContact() async {
    try {
      final contact = await repository.fetchContact();
      emit(contact);
    } catch (e) {
      emit(null);
    }
  }
}
