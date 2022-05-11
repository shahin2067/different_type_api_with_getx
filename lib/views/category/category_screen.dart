import 'package:different_type_api_with_getx/controllers/product_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {

  final ProductCategoryController _controller = Get.put(ProductCategoryController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      //backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        title: Text('Category Item'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Text(
              'Product Category',
            style: TextStyle(
              fontSize: 20,
              color: Colors.pink,
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(
            height: 200,
            child: Obx(()=>ListView.builder(
                //itemCount: 5,
                itemCount: _controller.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return Card(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        //color: Colors.grey.withOpacity(0.2),
                        image: DecorationImage(image: NetworkImage('https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg',))
                      ),
                      child: Center(
                          child: Container(
                            height: 20,
                            width: 130,
                            color: Colors.amber,
                            child: Center(
                              child: Text(
                              '${_controller.categoryList[index][0].toUpperCase()}${_controller.categoryList[index].substring(1).toLowerCase()}',
                        style: TextStyle(color: Colors.pink),
                      ),
                            ),
                          )),
                      //child: Image(image: NetworkImage('https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg'), fit: BoxFit.cover,),
                    ),
                  );
                }
            ),)
          ),
        ],
      )
    );
  }
}
