import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contact_book/classes/contact.dart';
import 'package:contact_book/repository/contact_repository.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  final ContactRepository _contactRepo;

  UpdateBloc(this._contactRepo)
      : super(
          UpdateState(),
        ) {
    on<UpdateContact>(
      _onUpdateContact,
      transformer: concurrent(),
    );
  }
  Future<void> _onUpdateContact(
    UpdateContact event,
    Emitter<UpdateState> emit,
  ) async {
    emit(
      state.update(
        selectedContactId: event.SelectedContactId,
        updateContact: event.contactDetail,
        isLoadingUpdatingContact: true,
      ),
    );

    await _contactRepo.UpdateContact(
        id: event.SelectedContactId, contacts: event.contactDetail);

    emit(
      state.update(
        isLoadingUpdatingContact: false,
      ),
    );
  }
}
