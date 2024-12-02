// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      name: json['full_name'] as String,
      location: json['location_of_center'] as String,
      rating: (json['review_rate'] as num).toDouble(),
      specialization: json['type_of_doctor'] as String,
      image: json['image'] as String,
      reviews: (json['reviews_count'] as num).toInt(),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'full_name': instance.name,
      'location_of_center': instance.location,
      'review_rate': instance.rating,
      'type_of_doctor': instance.specialization,
      'image': instance.image,
      'reviews_count': instance.reviews,
      'isFavorite': instance.isFavorite,
    };
