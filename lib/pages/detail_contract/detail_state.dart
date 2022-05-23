part of 'detail_bloc.dart';

class DetailState {
  final bool isLoadingDetailContact;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final Contacts contactDetail;
  final int? selectedContactId;
  final bool showSuccessDialog;
  DetailState({
    this.isLoadingDetailContact = false,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.contactDetail = const Contacts(),
    this.selectedContactId,
    this.showSuccessDialog = false,
  });

  DetailState update({
    bool? isLoadingDetailContact,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    int? selectedContactId,
    Contacts? contactDetail,
    bool? showSuccessDialog,
  }) {
    return DetailState(
      isLoadingDetailContact:
          isLoadingDetailContact ?? this.isLoadingDetailContact,
      showProgressLoader: showProgressLoader ?? this.showProgressLoader,
      dismissProgressLoader:
          dismissProgressLoader ?? this.dismissProgressLoader,
      contactDetail: contactDetail ?? this.contactDetail,
      selectedContactId: selectedContactId ?? this.selectedContactId,
      showSuccessDialog: showSuccessDialog ?? false,
    );
  }
}
