// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      count: json['count'] as int?,
      name: json['name'] as String?,
      countryId: json['country_id'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'count': instance.count,
      'name': instance.name,
      'country_id': instance.countryId,
      'gender': instance.gender,
    };
