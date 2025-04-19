import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_constant.dart';
import 'package:ecommerce_app/features/home/models/get_all_product_model.dart';

class HomeRepo {
  final Dio dio = Dio();
  Future<List<GetAllProductModel>> getAllProduct() async {
    try {
      final response =
          await dio.getUri(Uri.parse(ApiConstant.getAllProductUrl));
      if (response.statusCode == 200) {
        final result = (response.data as List)
            .map(
              (e) => GetAllProductModel.fromJson(e),
            )
            .toList();
        return result;
      }
    } on DioExceptionType catch (e) {
      if (e.runtimeType == DioExceptionType.connectionTimeout) {}
      return [];
    }
    return [];
  }
}
