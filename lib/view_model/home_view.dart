import 'package:get/get.dart';

import '../model/contact.dart';
import '../repository/contact_repository.dart';

class HomeView extends GetxController {
  List<Contact> contacts = [];

  ContactRepository contactRepository = ContactRepository();

  HomeView() {
    getContacts();
  }

  getContacts() async {
    contacts = await contactRepository.getContacts();
    update();
  }

  addContact({required Contact contact}) async {
    contacts = await contactRepository.addContact(contact: contact);
    update();
  }

  removeContact({required Contact contact}) async {
    contacts = await contactRepository.removeContact(contact: contact);
    update();
  }
}
