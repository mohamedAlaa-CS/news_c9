import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/shared/theming/theming.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, required this.makeModelNullClicked});
final  Function makeModelNullClicked;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: mediaQuery.width*0.74,
      decoration: const BoxDecoration(
        color: Colors.white,

      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            width: double.infinity,
            height: mediaQuery.height /6.2,
            decoration:const BoxDecoration(
              color: ApplicationTheme.primaryColor
            ),
            child: Text('News App!',style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 15),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    makeModelNullClicked();
                  },
                  child: Row(
                    children: [
                    const Icon(Icons.category,size: 30),
                    const SizedBox(width: 10,),
                    Text('Category',style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,

                    ),)
                  ],),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.settings,size: 30),
                    const SizedBox(width: 10,),
                    Text('Settings',style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,

                    ),)
                  ],)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
