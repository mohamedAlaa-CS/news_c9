import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
 const CategoryItem({super.key, required this.categoryModel,required this.index});
 final CategoryModel categoryModel;
 final  int index;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6,vertical: 0),
      padding:const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft:const Radius.circular(25),
            topRight:const Radius.circular(25),
              bottomRight:index %2 == 0 ? const Radius.circular(0): const Radius.circular(25),
            bottomLeft:index %2 == 0 ? const Radius.circular(25): const Radius.circular(0)
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryModel.image,height: mediaQuery.height/7.5 ),
          const SizedBox(height: 5),
          Text(
            categoryModel.title,
            style: GoogleFonts.exo(fontSize: 22, color: Colors.white),
          )
        ],
      ),
    );
  }
}
