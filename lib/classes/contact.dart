import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class Contacts with _$Contacts {
  const factory Contacts({
    int? id,
    String? name,
    String? email,
    String? gender,
    String? status,
  }) = _Contacts;

  factory Contacts.fromJson(Map<String, dynamic> json) =>
      _$ContactsFromJson(json);

  // Map<String, dynamic> toJson() => _$ContactToJson(this);
}
