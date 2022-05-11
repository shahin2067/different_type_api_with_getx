import 'package:different_type_api_with_getx/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUserScreen extends StatelessWidget {

  static const routeName = '/create_user_screen';

  Controller _controller = Get.put(Controller());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.fetchCreateUserPostData(name: 'Shahinur', jobTitle: 'Machine Learning');

    return Scaffold(
      appBar: AppBar(
        title: Text('Create User Screen Post API'),
        backgroundColor: Colors.pink,
      ),
      body: _createUserScreenBody(),
    );
  }

  Widget _createUserScreenBody(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            decoration: InputDecoration(
              border:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: 'Enter user name'
            ),
            controller: nameController,
          ),
        ),

        SizedBox(height: 20,),

        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            decoration: InputDecoration(
              border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: 'Enter user profession'
            ),
            controller: jobController,
          ),
        ),
        SizedBox(height: 20,),
        ElevatedButton(
            onPressed: () {
              String name = nameController.text;
              String jobTitle = jobController.text;

              _controller.fetchCreateUserPostData(name: name, jobTitle: jobTitle);
              // nameController.clear();
              // jobController.clear();

              //var user = await _controller.fetchCreateUserPostData(name, jobTitle);

            },
            child: Text('Create User')
        ),
        SizedBox(height: 20),
        // Text(
        //   'User Created${_controller.createUserPostData['name']}',
        //   style: TextStyle(color: Colors.red),
        // ),
        Obx(()=>Column(
          children: [
            _controller.createUserPostData['name']==null || _controller.createUserPostData['name'] ==''
                ? Text("You didn't enter any data")
                : Column(
                  children: [
                    const Text('Congratulations!', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(
                    'User Created',
                       style: TextStyle(color: Colors.red),
                   ),
                    SizedBox(height: 5,),
                    Text(
                      'User Name: ${_controller.createUserPostData['name']}',
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(
                      'Job: ${_controller.createUserPostData['job']}',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
          ],
        ))
      ],
    );
  }
}
