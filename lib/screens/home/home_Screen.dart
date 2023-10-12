import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/news/news_screen.dart';

import '../category/category_screen.dart';
import 'widget/my_drawer.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/backgroung.png'),
              fit: BoxFit.fill)),
      child:Scaffold(
        drawer: MyDrawer(
          makeModelNullClicked:makeModelNullClicked ,
        ),
        appBar: AppBar(
          toolbarHeight: mediaQuery.height/ 10,
          title: Text(model?.title ??'News App',),
          actions: model != null ?[
            IconButton(icon:const Icon( Icons.search,size: 38,),onPressed: (){},)
          ] : null,
        ),
        body: model == null ? CategoryScreen(onCategoryClicked: onCategoryClick,) :NewsScreen(CategoryId: model!.id ) ,
      )  ,
    );
  }
  CategoryModel ? model = null;

  onCategoryClick(CategoryModel categoryModel){
    model = categoryModel;
    setState(() {

    });
  }
  makeModelNullClicked(){
    model = null;
    Navigator.pop(context);
    setState(() {

    });
  }

}
