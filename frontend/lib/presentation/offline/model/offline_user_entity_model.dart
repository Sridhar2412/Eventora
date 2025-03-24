import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class OfflineUser {
  OfflineUser({
    this.name,
    this.email,
    this.ids,
    this.balance,
    this.daysLeft,
    this.profileImgUrl,
  });
  @Id()
  int id = 0;

  @JsonKey(name: 'id')
  int? ids;
  String? name;
  String? email;
  String? profileImgUrl;
  double? balance;
  double? daysLeft;
}
