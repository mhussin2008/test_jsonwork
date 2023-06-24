import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash_Screen2 extends StatelessWidget {
   Splash_Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    double fem=1.0;
    double ffem=1.0;
    return  Container(
      // splashscreen2Y7T (3:21)
      padding:  EdgeInsets.fromLTRB(0*fem, 36.5*fem, 0*fem, 0*fem),
      width:  double.infinity,
      decoration:  BoxDecoration (
        color:  Color(0xffffffff),
      ),
      child:
      Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children:  [
          Container(
              // autogroup5mldDUV (E68VxorwRqtRPqUGk85mLd)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 18*fem),
            width:  406*fem,
            height:  339.5*fem,
            child:
            Stack(
              children:  [
                Positioned(
                    // vth (3:22)
                  left:  39*fem,
                  top:  0*fem,
                  child:
                  Align(
                    child:
                    SizedBox(
                      width:  305*fem,
                      height:  201*fem,
                      child:
                      Text(
                        'عِش مَعَ الْقُرْآنِ حِفْظًا وَتِلَاوَة وَسَمَاعًا وَتَدَبُّرًا ',
                        textAlign:  TextAlign.right,
                        style:  GoogleFonts.amiri (

                          fontSize:  32*ffem,
                          fontWeight:  FontWeight.w700,
                          height:  2.0903754395*ffem/fem,
                          color:  Color(0xff0093d2),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // frame1m8d (3:23)
                  left:  264*fem,
                  top:  269.5*fem,
                  child:
                  TextButton(
                    onPressed:  () {},
                    style:  TextButton.styleFrom (
                      padding:  EdgeInsets.zero,
                    ),
                    child:
                    Container(
                      width:  80*fem,
                      height:  51*fem,
                      decoration:  BoxDecoration (
                        color:  Color(0xff0093d2),
                        borderRadius:  BorderRadius.circular(10*fem),
                      ),
                      child:
                      Text(
                        'ابدا الأن',
                        textAlign:  TextAlign.center,
                        style:  GoogleFonts.amiri (

                          fontSize:  17.5*ffem,
                          fontWeight:  FontWeight.w400,
                          height:  1.76*ffem/fem,
                          color:  Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
// nZX (3:28)
                  left:  97*fem,
                  top:  172.5*fem,
                  child:
                  Align(
                    child:
                    SizedBox(
                      width:  247*fem,
                      height:  62*fem,
                      child:
                      Text(
                        'القرآن الكريم هو جنة، هو رفعة ، هو هداية، هو سبيل إسعاد ودربُ أمان',
                        textAlign:  TextAlign.right,
                        style:  GoogleFonts.amiri (

                          fontSize:  17.5*ffem,
                          fontWeight:  FontWeight.w400,
                          height:  1.76*ffem/fem,
                          color:  Color(0xffab633c),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
// removebgpreview1EgR (3:4)
                  left:  0*fem,
                  top:  175.5*fem,
                  child:
                  Align(
                    child:
                    SizedBox(
                      width:  158*fem,
                      height:  164*fem,
                     // child:
                      // Image.network(
                      //   [Image url]
                      //   fit:  BoxFit.cover,
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
         Container(
           padding: EdgeInsets.all(10),
           width: 360,
           height: 360,
             child: Image(image: AssetImage('assets/pictures/abdelbasit.jpg')))

      ],
    ),
    );

  }
}



