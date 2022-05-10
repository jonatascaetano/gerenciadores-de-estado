import 'package:gerenciadores_de_estado/model/contact.dart';

abstract class ContactEvent {}

class GetContactsEvent extends ContactEvent {}

class AddContactEvent extends ContactEvent {
  Contact contact;

  AddContactEvent({required this.contact});
}

class RemoveContact extends ContactEvent {
  Contact contact;

  RemoveContact({required this.contact});
}
