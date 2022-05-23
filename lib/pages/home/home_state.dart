part of 'home_bloc.dart';

class HomeState {
  final bool isLoadingRecentContact;
  final bool isLoadingAllContact;
  final bool showProgressLoader;
  final bool dismissProgressLoader;
  final List<Contacts> allContact;
  final List<Contacts> recentContact;

  HomeState({
    this.isLoadingRecentContact = false,
    this.isLoadingAllContact = false,
    this.showProgressLoader = false,
    this.dismissProgressLoader = false,
    this.allContact = const [],
    this.recentContact = const [],
  });

  HomeState update({
    bool? isLoadingRecentContact,
    bool? isLoadingAllContact,
    bool? showProgressLoader,
    bool? dismissProgressLoader,
    List<Contacts>? allContact,
    List<Contacts>? recentContact,
  }) {
    return HomeState(
      isLoadingRecentContact:
          isLoadingRecentContact ?? this.isLoadingRecentContact,
      isLoadingAllContact: isLoadingAllContact ?? this.isLoadingAllContact,
      showProgressLoader: showProgressLoader ?? this.showProgressLoader,
      dismissProgressLoader:
          dismissProgressLoader ?? this.dismissProgressLoader,
      allContact: allContact ?? this.allContact,
      recentContact: recentContact ?? this.recentContact,
    );
  }
}
