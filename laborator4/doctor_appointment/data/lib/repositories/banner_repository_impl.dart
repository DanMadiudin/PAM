import 'package:data/datasource/banner_local_json_datasource.dart';
import 'package:data/mappers/banner_mapper.dart';
import 'package:data/models/banner_model.dart';
import 'package:domain/entities/banner.dart';
import 'package:domain/repositories/banner_repository.dart';


class BannerRepositoryImpl implements BannerRepository {
  final BannerLocalJsonDataSource bannerDataSource;

  BannerRepositoryImpl(this.bannerDataSource);

  @override
  Future<List<Banner>> getBanners() async {
    final List<BannerModel> bannerModels = await bannerDataSource.getBanners();

    return BannerMapper.toEntityList(bannerModels);
  }
}
