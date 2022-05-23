import 'package:contact_book/classes/contact.dart';
import 'package:contact_book/components/appbar.dart';
import 'package:contact_book/pages/detail_contract/detail_contact.dart';
import 'package:contact_book/pages/home/home_bloc.dart';
import 'package:contact_book/repository/contact_repository.dart';

import 'dart:async';

import 'package:skeleton_text/skeleton_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  late Future<List<Contacts>> futureContact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(text: "Contact Book", pages: 'home', context: context),
      body: BlocProvider(
        create: (_) => HomeBloc(
          context.read<ContactRepository>(),
        )..add(
            InitHomePage(),
          ),
        child: const HomeView(),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(height: 10),
          Text(
            "Recent Contacts",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          _recentContactBanner(),
          SizedBox(height: 10),
          Text(
            "All Contacts",
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 10),
          Flexible(child: _allContactList()),
        ],
      ),
    );
  }
}

class _recentContactBanner extends StatefulWidget {
  const _recentContactBanner({Key? key}) : super(key: key);

  @override
  State<_recentContactBanner> createState() => _recentContactBannerState();
}

class _recentContactBannerState extends State<_recentContactBanner> {
  Widget _buildRecentContact(BuildContext context, HomeState state) {
    List<Contacts> recentdata = state.recentContact;

    return Column(
      children: [
        Container(
          height: 150.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (BuildContext context, int i) {
              return InkWell(
                child: Card(
                  color: Colors.lime[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  child: Container(
                    width: 382,
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
                                Text(recentdata[i].name ?? 'No data'),
                                SizedBox(height: 10),
                                Text(recentdata[i].email ?? 'No data'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(recentdata[i].gender ?? 'No data'),
                                SizedBox(height: 10),
                                Text(recentdata[i].status ?? 'No data'),
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
                      builder: (context) => DetailContact(
                        delete: () {
                          recentdata.removeAt(i);
                        },
                      ),
                      settings: RouteSettings(
                        arguments: Contacts(
                          id: recentdata[i].id,
                          name: recentdata[i].name,
                          email: recentdata[i].email,
                          gender: recentdata[i].gender,
                          status: recentdata[i].status,
                        ),
                      ),
                      // '/detail_contact',

                      // ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _recentContactBannerShimmer() {
    return Card(
      color: Colors.lime[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.black, width: 1),
      ),
      child: Container(
        width: 372,
        padding: const EdgeInsets.fromLTRB(18, 21, 18, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonAnimation(
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    SkeletonAnimation(
                      child: Container(
                        color: Colors.grey[300],
                        width: 80,
                        height: 10,
                      ),
                    ),
                    SizedBox(height: 20),
                    SkeletonAnimation(
                      child: Container(
                        color: Colors.grey[300],
                        width: 150,
                        height: 10,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 10),
                    SkeletonAnimation(
                      child: Container(
                        color: Colors.grey[300],
                        width: 80,
                        height: 10,
                      ),
                    ),
                    SizedBox(height: 20),
                    SkeletonAnimation(
                      child: Container(
                        color: Colors.grey[300],
                        width: 80,
                        height: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyRecentContact() {
    return const Center(
      child: Text(
        'There Is No Recent Contact',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.isLoadingRecentContact != current.isLoadingRecentContact ||
          previous.recentContact != current.recentContact,
      builder: (context, state) {
        if (state.isLoadingRecentContact) {
          return _recentContactBannerShimmer();
        } else if (state.recentContact.isEmpty) {
          return _emptyRecentContact();
        } else {
          return _buildRecentContact(context, state);
        }
      },
    );
  }
}

class _allContactList extends StatefulWidget {
  const _allContactList({Key? key}) : super(key: key);

  @override
  State<_allContactList> createState() => _allContactListState();
}

class _allContactListState extends State<_allContactList> {
  Widget _buildAllContact(BuildContext context, HomeState state) {
    List<Contacts> data = state.allContact;
    data.sort((a, b) => a.name!.compareTo(b.name!));
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int i) {
              return InkWell(
                child: Card(
                  margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                  color: Colors.lime[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.black, width: 1),
                  ),
                  child: Container(
                    width: 372,
                    padding: const EdgeInsets.fromLTRB(18, 25, 18, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data[i].name ?? 'No data'),
                                SizedBox(height: 20),
                                Text(data[i].email ?? 'No data'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(data[i].gender ?? 'No data'),
                                SizedBox(height: 20),
                                Text(data[i].status ?? 'No data'),
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
                      builder: (context) => DetailContact(
                        delete: () {
                          setState(() {
                            data.removeAt(i);
                          });
                        },
                      ),
                      settings: RouteSettings(
                        arguments: Contacts(
                          id: data[i].id,
                          name: data[i].name,
                          email: data[i].email,
                          gender: data[i].gender,
                          status: data[i].status,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _emptyAllContact() {
    return const Center(
      child: Text(
        'There Is No Contact',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _allContactShimmer() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (BuildContext context, int i) {
          return Card(
            margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
            color: Colors.lime[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.black, width: 1),
            ),
            child: Container(
              width: 372,
              padding: const EdgeInsets.fromLTRB(18, 25, 18, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          SkeletonAnimation(
                            child: Container(
                              color: Colors.grey[300],
                              width: 80,
                              height: 10,
                            ),
                          ),
                          SizedBox(height: 20),
                          SkeletonAnimation(
                            child: Container(
                              color: Colors.grey[300],
                              width: 150,
                              height: 10,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 10),
                          SkeletonAnimation(
                            child: Container(
                              color: Colors.grey[300],
                              width: 80,
                              height: 10,
                            ),
                          ),
                          SizedBox(height: 20),
                          SkeletonAnimation(
                            child: Container(
                              color: Colors.grey[300],
                              width: 80,
                              height: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.isLoadingAllContact != current.isLoadingAllContact ||
          previous.allContact != current.allContact,
      builder: (context, state) {
        if (state.isLoadingAllContact) {
          return _allContactShimmer();
        } else if (state.allContact.isEmpty) {
          return _emptyAllContact();
        } else {
          return _buildAllContact(context, state);
        }
      },
    );
  }
}
