import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    bloc.add(GetContactsEvent());
  }

  @override
  void dispose() {
    bloc.close();
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
      body: BlocBuilder<ContactBloc, ContactState>(
        bloc: bloc,
        builder: (context1, state) {
          if (state is ContactInitState) {
            return Container();
          } else {
            final contacts = state.contacts;
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
                              bloc.add(
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
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context0,
              MaterialPageRoute(
                  builder: ((context3) => NewContact(
                        bloc: bloc,
                      ))),
            );
          }),
    );
  }
}
