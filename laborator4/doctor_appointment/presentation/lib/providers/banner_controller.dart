import 'package:domain/usecases/get_banners_usecase.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  final GetBannersUseCase getBannersUseCase;

  BannerController(this.getBannersUseCase);

  final banners = [].obs;
  var currentIndex = 0.obs;
  

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  void fetchBanners() async {
    final result = await getBannersUseCase();
    banners.value = result;
  }


  void updateIndex(int index) {
    currentIndex.value = index; // Actualizează indexul curent
  }
}
