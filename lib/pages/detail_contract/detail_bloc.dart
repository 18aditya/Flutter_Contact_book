import 'dart:math';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contact_book/classes/contact.dart';
import 'package:contact_book/repository/contact_repository.dart';

part 'detail_state.dart';
part 'detail_event.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final ContactRepository _contactRepo;

  DetailBloc(this._contactRepo)
      : super(
          DetailState(),
        ) {
    on<DeleteContact>(
      _onDeleteContact,
      transformer: concurrent(),
    );
  }
  Future<void> _onDeleteContact(
    DeleteContact event,
    Emitter<DetailState> emit,
  ) async {
    emit(
      state.update(
        selectedContactId: event.SelectedContactId,
        isLoadingDetailContact: true,
      ),
    );

    await _contactRepo.deleteContact(id: event.SelectedContactId);

    emit(
      state.update(
        showSuccessDialog: true,
        isLoadingDetailContact: false,
      ),
    );
  }
}
