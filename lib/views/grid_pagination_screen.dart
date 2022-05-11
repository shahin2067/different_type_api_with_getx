import 'package:different_type_api_with_getx/controllers/grid_pagination_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridPaginationScreen extends StatelessWidget {
  final GridPaginationController _controller=Get.put(GridPaginationController());


  @override
  Widget build(BuildContext context) {
    _controller.getPaginationGidData(pageNo: 1);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Pagination Get API'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Obx(()=> ListView.builder(
        itemCount: _controller.dataList.length,
        itemBuilder: (context, int index) {
          return ListTile(
            title: Text(_controller.dataList[index].author.toString()),
          );
        },
      )),

      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (c, i)=> InkWell(
              onTap: (){
                _controller.getPaginationGidData(pageNo: i+1);
              },
              child: Chip(
                label: Text('${i+1}'),
              ),
            ),
        ),
      ),
    );
  }
}
