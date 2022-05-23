import 'package:contact_book/pages/create_contact/create_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final String pages;
  final BuildContext? context;
  const CustomAppBar(
      {Key? key, required this.text, required this.pages, this.context})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: ConditionalSwitch.single(
        context: context,
        valueBuilder: (BuildContext context) => pages,
        caseBuilders: {
          'detail': (BuildContext ctx) => IconButton(
                color: Colors.black,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(ctx);
                },
              ),
          'create': (BuildContext ctx) => IconButton(
                color: Colors.black,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(ctx);
                },
              ),
        },
        fallbackBuilder: (BuildContext context) =>
            Text('None of the cases matched!'),
      ),
      // Builder(
      //   builder: (BuildContext context) {
      //     return IconButton(
      //       color: Colors.black,
      //       icon: const Icon(Icons.arrow_back),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     );
      //   },
      // ),
      title: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        ConditionalSwitch.single(
          context: context,
          valueBuilder: (BuildContext context) => pages,
          caseBuilders: {
            'home': (BuildContext ctx) => IconButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateContact(),
                      ),
                    );
                  },
                  icon: Icon(Icons.add),
                ),
            'detail': (BuildContext context) => IconButton(
                  color: Colors.black,
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
                                  onPressed: () {
                                    Navigator.pop(ctx, 'OK');
                                    // deleteContact(Context, args.id!);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  },
                  icon: Icon(Icons.delete),
                )
          },
          fallbackBuilder: (BuildContext context) =>
              Text('None of the cases matched!'),
        )
      ],
    );
  }
}
