part of 'create_bloc.dart';

class CreateState {
  final bool isLoadingAddingContact;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final Contacts addedContact;

  CreateState({
    this.isLoadingAddingContact = false,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.addedContact = const Contacts(),
  });

  CreateState update({
    bool? isLoadingAddingContact,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    Contacts? addedContact,
  }) {
    return CreateState(
      isLoadingAddingContact:
          isLoadingAddingContact ?? this.isLoadingAddingContact,
      showProgressLoader: showProgressLoader ?? this.showProgressLoader,
      dismissProgressLoader:
          dismissProgressLoader ?? this.dismissProgressLoader,
      addedContact: addedContact ?? this.addedContact,
    );
  }
}
