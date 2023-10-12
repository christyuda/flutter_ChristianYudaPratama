import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_testing/blocs/contact_form/contact_form_event.dart';
import 'package:ui_testing/blocs/contact_form/contact_form_state.dart';

class ContactFormBloc extends Bloc<ContactFormEvent, ContactFormState> {
  ContactFormBloc() : super(ContactFormInitial());

  @override
  Stream<ContactFormState> mapEventToState(ContactFormEvent event) async* {
    if (event is SubmitContact) {
      yield ContactFormEditing(event.contact);
    } else if (event is EditContact) {
      yield ContactFormEditing(event.contact);
    }
  }
}
