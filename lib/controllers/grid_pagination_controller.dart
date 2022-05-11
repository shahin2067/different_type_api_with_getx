

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:different_type_api_with_getx/models/gridPaginationModel/GridPaginationModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class GridPaginationController extends GetxController {

  var dataList = <GridPaginationModel>[].obs;

  // @override
  // void onInit() {
  //   getPaginationGidData();
  //   super.onInit();
  // }


  void getPaginationGidData({int? pageNo}) async {

    var url = 'https://picsum.photos/v2/list?page=3&limit=5';
    Dio dio = Dio(BaseOptions(
        baseUrl: 'https://picsum.photos'
    ));

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if(connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection');
      } else{
        EasyLoading.show(status: 'loading...');
        var response = await dio.get('/v2/list',queryParameters: {
          'page': '$pageNo',
          'limit': '5'
        });
        if(response.statusCode == 200) {
          EasyLoading.showToast('Data loaded successfully', toastPosition:EasyLoadingToastPosition.bottom );
          var myData = response.data as List;
          var newList = myData.map((e) => GridPaginationModel.fromJson(e)).toList();
          dataList.clear();
          dataList.addAll(newList);
        }
      }
    } catch (e) {
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    } finally{
      EasyLoading.dismiss();
    }

  }

}