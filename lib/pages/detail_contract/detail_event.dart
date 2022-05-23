part of 'detail_bloc.dart';

abstract class DetailEvent {}

class InitDetailPage extends DetailEvent {
  InitDetailPage();
}

class DeleteContact extends DetailEvent {
  final int SelectedContactId;
  DeleteContact(this.SelectedContactId);
}
