import 'package:gerenciadores_de_estado/blocs/contact_event.dart';
import 'package:gerenciadores_de_estado/blocs/contact_state.dart';

import '../repository/contact_repository.dart';
import 'package:bloc/bloc.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final _contactRepository = ContactRepository();

  ContactBloc() : super(ContactInitState()) {
    on<GetContactsEvent>(((event, emit) async => emit(ContactSuccessState(
        contacts: await _contactRepository.getContacts()))));

    on<AddContactEvent>((event, emit) async => emit(ContactSuccessState(
        contacts:
            await _contactRepository.addContact(contact: event.contact))));

    on<RemoveContact>((event, emit) async => emit(ContactSuccessState(
        contacts:
            await _contactRepository.removeContact(contact: event.contact))));
  }
}
