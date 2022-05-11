
import 'package:different_type_api_with_getx/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListScreen extends StatelessWidget {
  static const routeName = '/user_list_screen';

  Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    print('myy: ${_controller.userList.length}');
    return Scaffold(
      appBar: AppBar(
        title: Text('User List Screen Get API'),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Obx(() =>ListView.builder(
        itemCount: _controller.userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            //title: Text('User Name'),
            title: Text('${_controller.userList[index].firstName} ${_controller.userList[index].lastName}'),
            subtitle: Text('${_controller.userList[index].email}'),
            leading: ClipOval(
              child: CircleAvatar(
                child: Image.network('${_controller.userList[index].avatar}'),
              ),
            ),
          );
        }
    ));
  }
}
