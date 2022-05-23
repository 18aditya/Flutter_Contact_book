import 'dart:ffi';

import 'package:contact_book/classes/contact.dart';
import 'package:contact_book/pages/detail_contract/detail_bloc.dart';
import 'package:contact_book/pages/home/home.dart';
import 'package:contact_book/pages/update_contact/update_bloc.dart';
import 'package:contact_book/pages/update_contact/update_contact.dart';
import 'package:contact_book/repository/contact_repository.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class DetailContact extends StatelessWidget {
  final VoidCallback delete;
  const DetailContact({Key? key, required this.delete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Contacts;
    return BlocProvider(
      create: (_) => DetailBloc(
        ContactRepository(),
      ),
      child: DetailView(function: delete, contacts: args),
    );
  }
}

class DetailView extends StatelessWidget {
  final Contacts contacts;
  final Function function;
  const DetailView({Key? key, required this.contacts, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context, true);
              },
            );
          },
        ),
        title: Text(
          'Contact Book',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          FlatButton.icon(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext ctx) => AlertDialog(
                        title: Text('Deleting Contact'),
                        content: Text(
                            'Are you sure you want to delete this contact?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(ctx, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(ctx, 'OK');
                              function();
                              context.read<DetailBloc>().add(
                                    DeleteContact(contacts.id!),
                                  );
                              function();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ));
            },
            icon: Icon(Icons.delete),
            label: Text(''),
          )
        ],
      ),
      body: BlocListener<DetailBloc, DetailState>(
        listener: (context, state) {
          if (state.isLoadingDetailContact == true &&
              state.showSuccessDialog == false) {
            showDialog(
                context: context,
                builder: (BuildContext ctx) => _buildLoadingDialog(
                      context: ctx,
                    ));
          } else if (state.isLoadingDetailContact == false &&
              state.showSuccessDialog == true) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext ctx) => _buildSuccessDialog(
                context: ctx,
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              Text(
                "Detail Contacts",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              InkWell(
                child: Card(
                  color: Colors.lime[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 21, 18, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.brown.shade800,
                          child: const Text('AH'),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(contacts.name ?? 'No data'),
                                SizedBox(height: 10),
                                Text(contacts.email ?? 'No data'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(contacts.gender ?? 'No data'),
                                SizedBox(height: 10),
                                Text(contacts.status ?? 'No data'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdatePage(),
                      settings: RouteSettings(
                        arguments: Contacts(
                          id: contacts.id,
                          name: contacts.name,
                          email: contacts.email,
                          gender: contacts.gender,
                          status: contacts.status,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _buildSuccessDialog extends StatelessWidget {
  final BuildContext context;
  const _buildSuccessDialog({Key? key, required this.context})
      : super(key: key);

  @override
  Widget build(context) {
    return AlertDialog(
      title: Text('Deletion Succesful'),
      content: Text('Contact has been deleted'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Home()),
              (Route<dynamic> route) => true),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}

class _buildLoadingDialog extends StatelessWidget {
  final BuildContext context;
  const _buildLoadingDialog({Key? key, required this.context})
      : super(key: key);

  @override
  Widget build(context) {
    return AlertDialog(
      title: LinearProgressIndicator(),
    );
  }
}

class _buildFailDialog extends StatelessWidget {
  final BuildContext context;
  const _buildFailDialog({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(context) {
    return AlertDialog(
      title: Text('Deletion Succesful'),
      content: Text('Contact has been deleted'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          ),
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
