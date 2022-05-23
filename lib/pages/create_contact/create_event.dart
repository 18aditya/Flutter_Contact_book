part of 'create_bloc.dart';

abstract class CreateEvent {}

class InitCreatePage extends CreateEvent {
  InitCreatePage();
}

class AddContact extends CreateEvent {
  final Contacts addedContact;
  AddContact(this.addedContact);
}
