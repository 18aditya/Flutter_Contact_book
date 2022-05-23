import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:contact_book/classes/contact.dart';
import 'package:contact_book/repository/contact_repository.dart';

part 'create_event.dart';
part 'create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  final ContactRepository _contactRepo;

  CreateBloc(this._contactRepo)
      : super(
          CreateState(),
        ) {
    on<AddContact>(
      _onAddContact,
      transformer: concurrent(),
    );
  }
  Future<void> _onAddContact(
    AddContact event,
    Emitter<CreateState> emit,
  ) async {
    emit(
      state.update(
        addedContact: event.addedContact,
        isLoadingAddingContact: true,
      ),
    );
    await _contactRepo.createContact(contacts: event.addedContact);

    emit(
      state.update(
        isLoadingAddingContact: false,
      ),
    );
  }
}
