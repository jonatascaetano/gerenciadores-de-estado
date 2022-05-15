import 'package:flutter/material.dart';
import '../model/contact.dart';
import '../repository/contact_repository.dart';
import 'new_contact.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Contact> contacts = [];

  ContactRepository contactRepository = ContactRepository();

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  getContacts() async {
    await contactRepository.getContacts().then((value) {
      setState(() {
        contacts = value;
      });
    });
  }

  addContact({required Contact contact}) async {
    await contactRepository.addContact(contact: contact).then((value) {
      setState(() {
        contacts = value;
      });
    });
  }

  removeContact({required Contact contact}) async {
    await contactRepository.removeContact(contact: contact).then((value) {
      setState(() {
        contacts = value;
      });
    });
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context0) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contacts",
        ),
      ),
      body: contacts.isEmpty
          ? Container()
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: contacts.length,
              itemBuilder: ((context1, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(contacts[index].id.toString()),
                        ),
                        title: Text(contacts[index].name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(contacts[index].phone),
                            Text(contacts[index].email),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            removeContact(
                              contact: contacts[index],
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ))),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            Contact contact = await Navigator.push(
              context0,
              MaterialPageRoute(
                builder: ((context2) => const NewContact()),
              ),
            );
            // ignore: avoid_print
            addContact(contact: contact);
          }),
    );
  }
}
