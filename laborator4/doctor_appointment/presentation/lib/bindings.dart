import 'package:data/datasource/banner_local_json_datasource.dart';
import 'package:data/datasource/category_local_json_datasource.dart';
import 'package:data/datasource/doctor_local_json_datasource.dart';
import 'package:data/datasource/nearby_center_local_json_datasource.dart';
import 'package:data/repositories/category_repository_impl.dart';
import 'package:data/repositories/doctor_repository_impl.dart';
import 'package:data/repositories/nearby_center_repository_impl.dart';
import 'package:domain/repositories/banner_repository.dart';
import 'package:domain/repositories/category_repository.dart';
import 'package:domain/repositories/doctor_repository.dart';
import 'package:domain/repositories/nearby_center_repository.dart';
import 'package:domain/usecases/get_banners_usecase.dart';
import 'package:data/repositories/banner_repository_impl.dart';
import 'package:domain/usecases/get_categories_usecase.dart';
import 'package:domain/usecases/get_doctors_usecase.dart';
import 'package:domain/usecases/get_nearby_centers_usecase.dart';
import 'package:domain/usecases/sort_doctors_usecase.dart';

import 'package:get/get.dart';
import 'package:presentation/providers/category_controller.dart';
import 'package:presentation/providers/nearby_center_controller.dart';
import 'package:presentation/providers/doctor_controller.dart';

import 'providers/banner_controller.dart';

class DependencyInjector {
  static void init() {
    Get.put<BannerLocalJsonDataSource>(BannerLocalJsonDataSourceImpl());
    Get.put<BannerRepository>(BannerRepositoryImpl(Get.find()));
    Get.put(GetBannersUseCase(Get.find()));
    Get.put(BannerController(Get.find()));

    Get.put<DoctorLocalJsonDataSource>(DoctorLocalJsonDataSourceImpl());
    Get.put<DoctorRepository>(DoctorRepositoryImpl(Get.find()));
    Get.put(GetDoctorsUseCase(Get.find()));
    Get.put(SortDoctorsUseCase());
    Get.put(DoctorController(Get.find(), Get.find()));

    Get.put<CategoryLocalJsonDataSource>(CategoryLocalJsonDataSourceImpl());
    Get.put<CategoryRepository>(CategoryRepositoryImpl(Get.find()));
    Get.put(GetCategoriesUseCase(Get.find()));
    Get.put(CategoryController(Get.find()));

    Get.put<NearbyCenterLocalJsonDataSource>(NearbyCenterLocalJsonDataSourceImpl());
    Get.put<NearbyCenterRepository>(NearbyCenterRepositoryImpl(Get.find()));
    Get.put(GetNearbyCentersUseCase(Get.find()));
    Get.put(NearbyCenterController(Get.find()));
  }
} 