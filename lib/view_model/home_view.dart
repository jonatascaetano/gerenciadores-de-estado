import 'package:scoped_model/scoped_model.dart';

import '../model/contact.dart';
import '../repository/contact_repository.dart';

class HomeView extends Model {
  List<Contact> contacts = [];

  ContactRepository contactRepository = ContactRepository();

  HomeView() {
    getContacts();
  }

  getContacts() async {
    contacts = await contactRepository.getContacts();
    notifyListeners();
  }

  addContact({required Contact contact}) async {
    contacts = await contactRepository.addContact(contact: contact);
    notifyListeners();
  }

  removeContact({required Contact contact}) async {
    contacts = await contactRepository.removeContact(contact: contact);
    notifyListeners();
  }
}
