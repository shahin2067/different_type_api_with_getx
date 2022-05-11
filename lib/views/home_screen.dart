import 'package:different_type_api_with_getx/views/category/category_screen.dart';
import 'package:different_type_api_with_getx/views/create_user_screen.dart';
import 'package:different_type_api_with_getx/views/grid_pagination_screen.dart';
import 'package:different_type_api_with_getx/views/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.brown[200],
            child: ListTile(
              title: Text('User List Screen (Get)'),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Get.to(UserListScreen());
              },
            ),
          ),
          Card(
            color: Colors.brown[200],
            child: ListTile(
              title: Text('Create User Screen (Post)'),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Get.to(CreateUserScreen());
              },
            ),
          ),
          Card(
            color: Colors.brown[200],
            child: ListTile(
              title: Text('Gird Pagination (Get)'),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Get.to(GridPaginationScreen());
              },
            ),
          ),
          Card(
            color: Colors.brown[200],
            child: ListTile(
              title: Text('Cateogry item (Get)'),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Get.to(CategoryScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
