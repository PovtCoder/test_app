import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/entities/address.dart';
import 'package:test_app/entities/company.dart';
import 'package:test_app/entities/photo.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  int? id;
  String? name;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  @JsonKey(ignore: true)
  List<Photo>? photos;

  User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id, name];
}
