import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:news/models/category_model.dart';
import 'package:news/screens/category/widget/category_item.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  static const String routeName = 'home_layout';
  CategoryScreen({super.key, required this.onCategoryClicked});
  final Function onCategoryClicked;
   var listOfCategory = CategoryModel.categoryList;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pick your category \n of interest',style:GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),),
            Expanded(
              child: GridView.builder(
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                     crossAxisSpacing: 10,
                     mainAxisSpacing: 10,
                     childAspectRatio: (mediaQuery.width/2.78 ) / (mediaQuery.height/5.87),
                   ),
                  itemCount: listOfCategory.length,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: (){
                        onCategoryClicked(listOfCategory[index]);
                      },
                        child: CategoryItem( categoryModel: listOfCategory[index],index: index,));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
