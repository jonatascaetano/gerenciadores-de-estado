import 'package:flutter/material.dart';
import 'package:gerenciadores_de_estado/blocs/contact_bloc.dart';
import 'package:gerenciadores_de_estado/blocs/contact_event.dart';
import 'package:gerenciadores_de_estado/blocs/contact_state.dart';
import 'new_contact.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ContactBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ContactBloc();
    bloc.inputContact.add(GetContactsEvent());
  }

  @override
  void dispose() {
    bloc.inputContact.close();
    super.dispose();
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
      body: StreamBuilder<ContactState>(
          stream: bloc.stream,
          builder: (context1, AsyncSnapshot<ContactState> snapshot) {
            final contacts = snapshot.data?.contacts ?? [];
            return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: contacts.length,
                itemBuilder: ((context2, index) => Card(
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
                              bloc.inputContact.add(
                                RemoveContact(contact: contacts[index]),
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    )));
          }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context0,
              MaterialPageRoute(
                  builder: ((context4) => NewContact(
                        bloc: bloc,
                      ))),
            );
          }),
    );
  }
}
