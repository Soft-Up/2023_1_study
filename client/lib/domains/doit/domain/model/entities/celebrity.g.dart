// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'celebrity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Celebrity _$CelebrityFromJson(Map<String, dynamic> json) => Celebrity(
      name: json['name'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      imgUrl: json['imgUrl'] as String,
    );

Map<String, dynamic> _$CelebrityToJson(Celebrity instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'gender': instance.gender,
      'imgUrl': instance.imgUrl,
    };
