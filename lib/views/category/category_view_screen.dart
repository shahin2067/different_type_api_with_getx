import 'package:different_type_api_with_getx/controllers/product_category_controller.dart';
import 'package:different_type_api_with_getx/views/category/category_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryViewScreen extends StatelessWidget {

  static const routeName = '/category_view_screen';

  final ProductCategoryController _controller = Get.put(ProductCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        title: Text('Category View'),
        //title: Text(_controller.categoryList[index]),
        centerTitle: true,
      ),
      body: Obx(()=>ListView.builder(
        itemCount: _controller.categoryData.length,
        //itemCount: _controller.categoryData.length,
        //itemCount: 5,
        itemBuilder: (context, index){
          return Card(
            child: InkWell(
              onTap: (){
                Get.toNamed(CategoryDetailsScreen.routeName);

                //Get.to(CategoryDetailsScreen());
              },
              child: ListTile(
                leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius:BorderRadius.circular(50),
                      //child: Image.network("https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg"),
                      child: Image.network(_controller.categoryData[index].image??''),
                    )
                ),
                title: Text(
                  _controller.categoryData[index].title??'',
                  //'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet',
                  //maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('\$${_controller.categoryData[index].price!.toDouble()}'),
                //subtitle: Text('22'),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
          );
        },
      )),
    );
  }
}
