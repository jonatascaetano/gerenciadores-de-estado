// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeView on _HomeViewBase, Store {
  late final _$contactsAtom =
      Atom(name: '_HomeViewBase.contacts', context: context);

  @override
  List<Contact> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(List<Contact> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  late final _$getContactsAsyncAction =
      AsyncAction('_HomeViewBase.getContacts', context: context);

  @override
  Future getContacts() {
    return _$getContactsAsyncAction.run(() => super.getContacts());
  }

  late final _$addContactAsyncAction =
      AsyncAction('_HomeViewBase.addContact', context: context);

  @override
  Future addContact({required Contact contact}) {
    return _$addContactAsyncAction
        .run(() => super.addContact(contact: contact));
  }

  late final _$removeContactAsyncAction =
      AsyncAction('_HomeViewBase.removeContact', context: context);

  @override
  Future removeContact({required Contact contact}) {
    return _$removeContactAsyncAction
        .run(() => super.removeContact(contact: contact));
  }

  @override
  String toString() {
    return '''
contacts: ${contacts}
    ''';
  }
}
