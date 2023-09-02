import 'package:json_annotation/json_annotation.dart';
 

part 'user_model.g.dart';

@JsonSerializable()
class UserModel  {
  @JsonKey(name: "refresh")
  String? refresh;
  @JsonKey(name: "access")
  String? access;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "id")
  int? id;

  UserModel(this.access, this.refresh, this.username, this.email, this.id);

  // from json
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

// to json
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
/* class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.avatar,
    required super.createAt,
  });

  const UserModel.empty() : this(id: "", name: "", avatar: "", createAt: "");
  UserModel copywith({
    String? id,
    String? name,
    String? avatar,
    String? createAt,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        createAt: createAt ?? this.createAt,
      );
      
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        createAt: json["createAt"],
      );
  /* factory UserModel.fromJson(String source) => UserModel.fromMap(
        jsonDecode(source) as DataMap,
      ); */
} */
