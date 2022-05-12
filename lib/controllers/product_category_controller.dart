import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:different_type_api_with_getx/models/productModel/ProductModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProductCategoryController extends GetxController{
  var categoryList = [].obs;
  var categoryData = [].obs;
  RxObjectMixin<ProductModel> myCategoryData = ProductModel().obs;

  @override
  void onInit() {
    //print('Init method Called');
    getProductCategoryListData();
    super.onInit();
  }

  void getProductCategoryListData() async {

    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://fakestoreapi.com'
    ));

    try{
      var connectivityResult = await (Connectivity().checkConnectivity());
      
      if(connectivityResult == ConnectivityResult.none){
        EasyLoading.showToast('No Internet Connection');
      } else{
        EasyLoading.show(status: "Loading...");
        var response = await dio.get('/products/categories');
        //print('getProductCategoryData');
        if(response.statusCode == 200) {
          EasyLoading.showToast('Data loaded successfully', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
          var jsonResponse = response.data;

          var data = jsonResponse as List;
          categoryList.addAll(jsonResponse);

        } else{
          EasyLoading.showToast('Faild to load data', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
        }

      }

    } catch(e) {
      print('Error occurred: $e');
    }
  }
  
  void getCategoryViewData({String? category}) async {
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://fakestoreapi.com'
    ));
    
    try{
      var connectivityResult = await (Connectivity().checkConnectivity());
      if(connectivityResult == ConnectivityResult.none){
        EasyLoading.showToast('No Internet Connection');
      } else{
        EasyLoading.show(status: "Loading...");
        var response = await dio.get('/products/category/$category');
        if(response.statusCode == 200){
          //EasyLoading.showToast('Data loaded successfully', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
          var jsonResponse = response.data as List;
          var list = jsonResponse.map((e) => ProductModel.fromJson(e));
          categoryData.clear();
          categoryData.addAll(list);
          print('Data Length ${categoryData.length}');
          //print('Title ${categoryData[1]}');
          // print('Res: ${jsonResponse[5]['rating']}');

          //myCategoryData.value = ProductModel.fromJson(jsonResponse);
          //print('Data Length ${myCategoryData.value.category}');


        } else{
          print('Failed To load data');
        }

      }
      
    } catch(e){
      print('Error occurred: $e');
    } finally {
      EasyLoading.dismiss();
    }
  }
  

}