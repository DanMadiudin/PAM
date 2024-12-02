import 'package:domain/entities/banner.dart';
import 'package:domain/repositories/banner_repository.dart';


class GetBannersUseCase {
  final BannerRepository repository;

  GetBannersUseCase(this.repository);

  Future<List<Banner>> call() async {
    return await repository.getBanners();
  }
}