import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? refresh;
  final String? access;
  final String? username;
  final String? email;
  final int? id;
  const UserEntity({
    this.refresh,
    this.access,
    this.username,
    this.email,
    this.id,
  });
  UserEntity copyWith({
    String? refresh,
    String? access,
    String? username,
    String? email,
    int? id,
  }) =>
      UserEntity(
        refresh: refresh ?? this.refresh,
        access: access ?? this.access,
        username: username ?? this.username,
        email: email ?? this.email,
        id: id ?? this.id,
      );

  @override
  List<Object?> get props => [refresh, access, username, email, id];
}
