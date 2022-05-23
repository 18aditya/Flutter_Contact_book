part of 'update_bloc.dart';

abstract class UpdateEvent {}

class InitCreatePage extends UpdateEvent {
  InitCreatePage();
}

class UpdateContact extends UpdateEvent {
  final int SelectedContactId;
  final Contacts contactDetail;
  UpdateContact(this.SelectedContactId, this.contactDetail);
}
