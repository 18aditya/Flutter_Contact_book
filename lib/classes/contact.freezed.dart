// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Contacts _$ContactsFromJson(Map<String, dynamic> json) {
  return _Contacts.fromJson(json);
}

/// @nodoc
mixin _$Contacts {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactsCopyWith<Contacts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsCopyWith<$Res> {
  factory $ContactsCopyWith(Contacts value, $Res Function(Contacts) then) =
      _$ContactsCopyWithImpl<$Res>;
  $Res call(
      {int? id, String? name, String? email, String? gender, String? status});
}

/// @nodoc
class _$ContactsCopyWithImpl<$Res> implements $ContactsCopyWith<$Res> {
  _$ContactsCopyWithImpl(this._value, this._then);

  final Contacts _value;
  // ignore: unused_field
  final $Res Function(Contacts) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ContactsCopyWith<$Res> implements $ContactsCopyWith<$Res> {
  factory _$ContactsCopyWith(_Contacts value, $Res Function(_Contacts) then) =
      __$ContactsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id, String? name, String? email, String? gender, String? status});
}

/// @nodoc
class __$ContactsCopyWithImpl<$Res> extends _$ContactsCopyWithImpl<$Res>
    implements _$ContactsCopyWith<$Res> {
  __$ContactsCopyWithImpl(_Contacts _value, $Res Function(_Contacts) _then)
      : super(_value, (v) => _then(v as _Contacts));

  @override
  _Contacts get _value => super._value as _Contacts;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? status = freezed,
  }) {
    return _then(_Contacts(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contacts with DiagnosticableTreeMixin implements _Contacts {
  const _$_Contacts({this.id, this.name, this.email, this.gender, this.status});

  factory _$_Contacts.fromJson(Map<String, dynamic> json) =>
      _$$_ContactsFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? gender;
  @override
  final String? status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Contacts(id: $id, name: $name, email: $email, gender: $gender, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Contacts'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Contacts &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$ContactsCopyWith<_Contacts> get copyWith =>
      __$ContactsCopyWithImpl<_Contacts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactsToJson(this);
  }
}

abstract class _Contacts implements Contacts {
  const factory _Contacts(
      {final int? id,
      final String? name,
      final String? email,
      final String? gender,
      final String? status}) = _$_Contacts;

  factory _Contacts.fromJson(Map<String, dynamic> json) = _$_Contacts.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get gender => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContactsCopyWith<_Contacts> get copyWith =>
      throw _privateConstructorUsedError;
}
