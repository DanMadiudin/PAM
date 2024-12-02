import 'package:domain/usecases/get_nearby_centers_usecase.dart';
import 'package:get/get.dart';

class NearbyCenterController extends GetxController{
  final GetNearbyCentersUseCase getNearbyCentersUseCase;

  NearbyCenterController(this.getNearbyCentersUseCase);

  final nearbyCenters = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNearbyCenters();
  }

  void fetchNearbyCenters() async{
    final result = await getNearbyCentersUseCase();
    nearbyCenters.value = result;
  } 
}