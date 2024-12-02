// Mapper pentru a transforma BannerModel în Banner (Domain)
import 'package:data/models/banner_model.dart';
import 'package:domain/entities/banner.dart';

class BannerMapper {
  static Banner toEntity(BannerModel model) {
    return Banner(
      title: model.title ?? 'title', // Asigură-te că ai valori implicite pentru null
      description: model.description ?? 'description',
      image: model.image ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMa-rZMEw5mFIOl2Is7nTQsQUQ5fS8qAAVsQ&s',
    );
  }

  static List<Banner> toEntityList(List<BannerModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
