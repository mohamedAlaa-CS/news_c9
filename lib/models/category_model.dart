import 'dart:ui';

class CategoryModel {
  String id;
  String title;
  String image;
  Color backgroundColor;

  CategoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.backgroundColor,
  });

  static List categoryList= [
    CategoryModel(
        id: 'sports',
        title: 'Sports',
        image: 'assets/images/sports_icon.png',
        backgroundColor: Color(0xffC91C22)),
    CategoryModel(
        id: 'politcs',
        title: 'Politics',
        image: 'assets/images/Politics_icon.png',
        backgroundColor: Color(0xff003E90)),
    CategoryModel(
        id: 'health',
        title: 'Health',
        image: 'assets/images/health_icon.png',
        backgroundColor: Color(0xffED1E79)),
    CategoryModel(
        id: 'business',
        title: 'Business',
        image: 'assets/images/bussines_icon.png',
        backgroundColor: Color(0xffCF7E48)),
    CategoryModel(
        id: 'environment',
        title: 'Environment',
        image: 'assets/images/environment_icon.png',
        backgroundColor: Color(0xff4882CF)),
    CategoryModel(
        id: 'science',
        title: 'Science',
        image: 'assets/images/science_icon.png',
        backgroundColor: Color(0xffF2D352))
  ];
}
