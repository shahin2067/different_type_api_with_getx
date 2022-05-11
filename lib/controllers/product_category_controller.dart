

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProductCategoryController extends GetxController{
  var categoryList = [].obs;


  @override
  void onInit() {
    print('Init method Called');
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
  

}