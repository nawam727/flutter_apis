import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';


@JsonSerializable()
class Answer {
  int? count;
  String? name;
  @JsonKey(name: 'country_id')
  String? countryId;
  String? gender;

  Answer({
    this.count,
    this.name,
    this.countryId,
    this.gender,
  });


  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}