import '../model/contact.dart';

class ContactRepository {
  List<Contact> contacts = [];

  ContactRepository() {
    contacts = [
      Contact(
        id: 0,
        name: "Marley",
        email: "marley@gmail.com",
        phone: "14 954684312",
      ),
      Contact(
        id: 1,
        name: "Mel",
        email: "mel@gmail.com",
        phone: "14 954321212",
      ),
      Contact(
        id: 2,
        name: "Bela",
        email: "bela@gmail.com",
        phone: "14 954131215",
      ),
    ];
  }

  Future<List<Contact>> getContacts() async {
    return contacts;
  }

  Future<List<Contact>> addContact({required Contact contact}) async {
    Set<int> ids = {};
    for (Contact x in contacts) {
      ids.add(x.id);
    }
    int y = 0;
    while (ids.contains(y)) {
      y++;
    }
    contact.id = y;
    contacts.add(contact);
    return contacts;
  }

  Future<List<Contact>> removeContact({required Contact contact}) async {
    contacts.remove(contact);
    return contacts;
  }
}
