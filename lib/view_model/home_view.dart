import 'package:mobx/mobx.dart';

import '../model/contact.dart';
import '../repository/contact_repository.dart';
part 'home_view.g.dart';

class HomeView = _HomeViewBase with _$HomeView;

abstract class _HomeViewBase with Store {
  @observable
  List<Contact> contacts = [];

  ContactRepository contactRepository = ContactRepository();

  _HomeViewBase() {
    getContacts();
  }

  @action
  getContacts() async {
    contacts = await contactRepository.getContacts();
  }

  @action
  addContact({required Contact contact}) async {
    contacts = await contactRepository.addContact(contact: contact);
  }

  @action
  removeContact({required Contact contact}) async {
    contacts = await contactRepository.removeContact(contact: contact);
  }
}
