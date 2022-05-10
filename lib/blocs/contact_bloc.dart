import 'dart:async';

import 'package:gerenciadores_de_estado/blocs/contact_event.dart';
import 'package:gerenciadores_de_estado/blocs/contact_state.dart';
import 'package:gerenciadores_de_estado/model/contact.dart';

import '../repository/contact_repository.dart';

class ContactBloc {
  final _contactRepository = ContactRepository();

  final StreamController<ContactEvent> _inputContactController =
      StreamController<ContactEvent>();

  final StreamController<ContactState> _outputContactController =
      StreamController<ContactState>();

  Sink<ContactEvent> get inputContact => _inputContactController.sink;
  Stream<ContactState> get stream => _outputContactController.stream;

  ContactBloc() {
    _inputContactController.stream.listen(_mapEventToState);
  }

  _mapEventToState(ContactEvent contactEvent) async {
    List<Contact> contacts = [];
    if (contactEvent is GetContactsEvent) {
      contacts = await _contactRepository.getContacts();
    } else if (contactEvent is AddContactEvent) {
      contacts =
          await _contactRepository.addContact(contact: contactEvent.contact);
    } else if (contactEvent is RemoveContact) {
      contacts =
          await _contactRepository.removeContact(contact: contactEvent.contact);
    }

    _outputContactController.add(ContactSuccessState(contacts: contacts));
  }
}
