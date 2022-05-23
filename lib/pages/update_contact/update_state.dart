part of 'update_bloc.dart';

class UpdateState {
  final bool isLoadingUpdatingContact;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final Contacts updateContact;
  final String name;
  final String email;
  final String gender;
  final String status;
  final int? selectedContactId;

  UpdateState({
    this.isLoadingUpdatingContact = false,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.updateContact = const Contacts(),
    this.name = '',
    this.email = '',
    this.gender = '',
    this.status = '',
    this.selectedContactId,
  });

  UpdateState update({
    bool? isLoadingUpdatingContact,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    Contacts? updateContact,
    String? name,
    String? email,
    String? gender,
    String? status,
    int? selectedContactId,
  }) {
    return UpdateState(
      isLoadingUpdatingContact:
          isLoadingUpdatingContact ?? this.isLoadingUpdatingContact,
      showProgressLoader: showProgressLoader ?? this.showProgressLoader,
      dismissProgressLoader:
          dismissProgressLoader ?? this.dismissProgressLoader,
      updateContact: updateContact ?? this.updateContact,
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      status: status ?? this.status,
      selectedContactId: selectedContactId ?? this.selectedContactId,
    );
  }
}
