import 'package:gerenciadores_de_estado/model/contact.dart';

abstract class ContactState {
  List<Contact> contacts;

  ContactState({required this.contacts});
}

class ContactInitState extends ContactState {
  ContactInitState() : super(contacts: []);
}

class ContactSuccessState extends ContactState {
  ContactSuccessState({required List<Contact> contacts})
      : super(contacts: contacts);
}
