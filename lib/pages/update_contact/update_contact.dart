import 'package:contact_book/classes/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'update_bloc.dart';
import 'package:contact_book/repository/contact_repository.dart';
import 'package:contact_book/pages/home/home.dart';
import '../../components/appbar.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Contacts;
    return BlocProvider(
      create: (_) => UpdateBloc(
        ContactRepository(),
      ),
      child: UpdateView(contacts: args),
    );
  }
}

class UpdateView extends StatelessWidget {
  final Contacts contacts;

  UpdateView({Key? key, required this.contacts}) : super(key: key);

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _status = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _controller = ContactRepository();
    return Scaffold(
        appBar: CustomAppBar(
            text: "Contact Book", pages: 'create', context: context),
        body: BlocListener<UpdateBloc, UpdateState>(
            listener: (context, state) {
              if (state.isLoadingUpdatingContact == true) {
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) => AlertDialog(
                    title: LinearProgressIndicator(),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) => AlertDialog(
                    title: Text('Contact Updated'),
                    content: Text('Contact has been Updated'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => Home()),
                                (Route<dynamic> route) => false),
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Create new contact",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Name',
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[50],
                                  border: Border.all(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(7, 0, 4, 4),
                                child: TextField(
                                  controller: _name..text = contacts.name!,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: contacts.name),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'E-Mail',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[50],
                                  border: Border.all(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(7, 0, 4, 4),
                                child: TextField(
                                  controller: _email..text = contacts.email!,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: contacts.email),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[50],
                                  border: Border.all(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(7, 0, 4, 4),
                                child: TextField(
                                  controller: _gender..text = contacts.gender!,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: contacts.gender),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[50],
                                  border: Border.all(
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(7, 0, 4, 4),
                                child: TextField(
                                  controller: _status..text = contacts.status!,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: contacts.status),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 100),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        primary: Colors.amber[50],
                        backgroundColor: Colors.amber[50],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                      child: const Text(
                        'SAVE',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        var response = Contacts(
                            name: _name.text,
                            email: _email.text,
                            gender: _gender.text,
                            status: _status.text);
                        context.read<UpdateBloc>().add(
                              UpdateContact(contacts.id!, response),
                            );
                      },
                    ),
                    // (_futureContact == null)
                    //     ? (showDialog(
                    //         context: context,
                    //         builder: (_) => AlertDialog(
                    //               title: Text('Add new contact'),
                    //               content: Text(
                    //                   'Are you sure you want to add this contact?'),
                    //               actions: <Widget>[
                    //                 TextButton(
                    //                   onPressed: () =>
                    //                       Navigator.pop(context, 'Cancel'),
                    //                   child: const Text('Cancel'),
                    //                 ),
                    //                 TextButton(
                    //                   onPressed: () {
                    //                     setState(() {
                    //                       _futureContact = createContact(
                    //                           _name.text,
                    //                           _email.text,
                    //                           _gender.text,
                    //                           _status.text);
                    //                     });
                    //                   },
                    //                   child: const Text('OK'),
                    //                 ),
                    //               ],
                    //             )))
                    //     : (showDialog(
                    //         context: context,
                    //         builder: (_) => AlertDialog(
                    //                 title: Text('Add new contact'),
                    //                 content: Text(
                    //                     'This account is already been added'),
                    //                 actions: <Widget>[
                    //                   TextButton(
                    //                     onPressed: () =>
                    //                         Navigator.pop(context, 'Cancel'),
                    //                     child: const Text('Cancel'),
                    //                   ),
                    //                 ])));
                  ],
                ),
              ),
            )));
  }
}
