import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class OfflineTransaction {
  OfflineTransaction({
    this.title,
    this.senderId,
    this.recieverId,
    this.product,
    this.ids,
    this.amount,
    this.isCredit,
  });
  @Id()
  int id = 0;

  @JsonKey(name: 'id')
  int? ids;
  int? senderId;
  int? recieverId;
  String? title;
  String? product;
  double? amount;
  bool? isCredit;
}
