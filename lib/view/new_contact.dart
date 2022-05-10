import 'package:flutter/material.dart';
import 'package:gerenciadores_de_estado/blocs/contact_bloc.dart';
import 'package:gerenciadores_de_estado/blocs/contact_event.dart';

import '../model/contact.dart';

// ignore: must_be_immutable
class NewContact extends StatefulWidget {
  final ContactBloc bloc;
  const NewContact({required this.bloc, Key? key}) : super(key: key);

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  final key = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New contact"),
      ),
      body: Form(
          key: key,
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              TextFormField(
                controller: name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "name can't be null";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("name"),
                ),
              ),
              TextFormField(
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "email can't be null";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text("email"),
                ),
              ),
              TextFormField(
                controller: phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "phone can't be null";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("phone"),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    Contact contact = Contact(
                      id: 0,
                      name: name.text,
                      email: email.text,
                      phone: phone.text,
                    );
                    widget.bloc.inputContact.add(
                      AddContactEvent(contact: contact),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("save"),
              ),
            ],
          )),
    );
  }
}
