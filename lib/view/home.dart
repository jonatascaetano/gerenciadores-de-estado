import 'package:flutter/material.dart';
import '../view_model/home_view.dart';
import 'new_contact.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext context0) {
    return GetBuilder<HomeView>(
      global: false,
      init: HomeView(),
      builder: (homeView) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Contacts",
          ),
        ),
        body: homeView.contacts.isEmpty
            ? Container()
            : ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: homeView.contacts.length,
                itemBuilder: ((context1, index) => Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(homeView.contacts[index].id.toString()),
                          ),
                          title: Text(homeView.contacts[index].name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(homeView.contacts[index].phone),
                              Text(homeView.contacts[index].email),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              homeView.removeContact(
                                contact: homeView.contacts[index],
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
            onPressed: () {
              Navigator.push(
                context0,
                MaterialPageRoute(
                  builder: ((context2) => NewContact(homeView: homeView)),
                ),
              );
            }),
      ),
    );
  }
}
