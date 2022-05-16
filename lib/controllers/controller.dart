import 'package:different_type_api_with_getx/models/userListGetModel/Data.dart';
import 'package:different_type_api_with_getx/utils/apis.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';



class Controller extends GetxController{

  //var userList = <UserListGetModel>[].obs;
  var userList = <Data>[].obs;
  //var createUserPostData = <CreateUserPostModel>[].obs;
  var createUserPostData = {}.obs;

@override
  void onInit() {
  _fetchUserListGetData();
  //fetchCreateUserPostData();
    super.onInit();
  }



  Future<void> _fetchUserListGetData() async{

  Dio dio = Dio(BaseOptions(
    baseUrl: 'https://reqres.in',
  ));

  try{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      EasyLoading.showToast('No Internet Connection');
      print('No Internet Connection');
    } else {
      print('Internet Connected..');
      EasyLoading.show(status: 'Loading...');
      var response = await dio.get('/api/users');

      if(response.statusCode == 200) {
        EasyLoading.showToast('Data loaded successfully', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
        print('HTTP Mehtods: ${response.requestOptions.method} ');
        print('HTTP URL: ${response.requestOptions.baseUrl} ');
        print('HTTP Path: ${response.requestOptions.path} ');
        print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
        //print(response.data);
        var jsonResponse = response.data;
        //print('jsonResponse: $jsonResponse');
        var data = jsonResponse['data'] as List;
        //print('Data: $data');
        var list = data.map((e) => Data.fromJson(e));
        userList.addAll(list);
        print('userList: $userList');
        //print('Shahin: ${list[2].data![0].email}');
        print('Shahin: ${userList.length}');

      } else{
        print('Failed to load data');
      }
    }

  } catch(e){
    print('Error occurred: $e');
  }

  }

  Future<void> fetchCreateUserPostData({String? name, String? jobTitle}) async{
    Dio dio = Dio(BaseOptions(
      baseUrl: Apis.baseUrl,
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());
    try{

      if (connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection');
      } else {
        var response = await dio.post(Apis.creteUserPostUrl, data: {
          "name": '$name',
          "job": '$jobTitle'
        });

        if(response.statusCode == 201){
          var createUserData = response.data;
          print('Create User Data: $createUserData');
          print('Data: ${createUserData['name']}');
          createUserPostData.addAll(createUserData);
          print('createUserPostData: $createUserPostData');
        } else {
          EasyLoading.showToast('Failed to load data');
        }
      }

    } catch (e) {
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    } finally {
      EasyLoading.dismiss();
    }
  }

}