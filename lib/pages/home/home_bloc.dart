import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contact_book/classes/contact.dart';
import 'package:contact_book/repository/contact_repository.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ContactRepository _contactRepo;

  HomeBloc(this._contactRepo)
      : super(
          HomeState(),
        ) {
    on<FetchAllContact>(
      _onFetchAllContact,
      transformer: concurrent(),
    );
    on<FetchRecentContact>(
      _onFetchRecentContact,
      transformer: sequential(),
    );
    on<InitHomePage>(_onInitHomePage);
  }

  Future<void> _onInitHomePage(
    InitHomePage event,
    Emitter<HomeState> emit,
  ) async {
    add(
      FetchAllContact(),
    );
    add(
      FetchRecentContact(),
    );
  }

  Future<void> _onFetchAllContact(
    FetchAllContact event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.update(
        isLoadingAllContact: true,
      ),
    );

    final List<Contacts> results = await _contactRepo.fetchAllContact();

    emit(
      state.update(
        allContact: results,
        isLoadingAllContact: false,
      ),
    );
  }

  Future<void> _onFetchRecentContact(
    FetchRecentContact event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.update(
        isLoadingRecentContact: true,
      ),
    );

    final List<Contacts> results = await _contactRepo.fetchRecentContact();

    emit(
      state.update(
        recentContact: results,
        isLoadingRecentContact: false,
      ),
    );
  }
}
