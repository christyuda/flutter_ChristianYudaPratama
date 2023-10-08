import 'package:restandmvvm/bloc/contact_bloc.dart';

class ContactViewModel {
  final contactBloc = ContactBloc();

  fetchContact() {
    contactBloc.fetchContact();
  }

  dispose() {
    contactBloc.close();
  }
}
