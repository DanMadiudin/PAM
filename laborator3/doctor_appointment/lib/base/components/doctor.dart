import 'package:json_annotation/json_annotation.dart';


part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  @JsonKey(name: 'full_name')
  String name;
  @JsonKey(name: 'location_of_center')
  String location;
  @JsonKey(name: 'review_rate')
  double rating;
  @JsonKey(name: 'type_of_doctor')
  String specialization;
  String image;
  @JsonKey(name: 'reviews_count')
  int reviews;
  @JsonKey(defaultValue: false)
  bool isFavorite;
  

  Doctor({
    required this.name,
    required this.location,
    required this.rating,
    required this.specialization,
    required this.image,
    required this.reviews,
    required this.isFavorite 
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);

  // Doctor.fromJson(Map<String, dynamic> json) 
  //   : name = json['full_name'],
  //     location = json['location_of_center'],
  //     rating = (json['review_rate'] as num).toDouble(),
  //     specialization = json['type_of_doctor'],
  //     image = json['image'],
  //     reviews = (json['reviews_count'] as num).toInt(),
  //     isFavorite = false;
}
