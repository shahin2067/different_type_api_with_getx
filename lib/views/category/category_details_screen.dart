import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatelessWidget {
  static const routeName = '/category_details_screen';
  const CategoryDetailsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                'Solid Gold Petite Micropave',
              style: TextStyle(
                  color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(image: NetworkImage('https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg')),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text('Details'),
            SizedBox(height: 10,),
            Text('Price \$20'),
          ],
        ),
      ),
    );
  }
}
