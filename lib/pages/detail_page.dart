import 'package:flutter/material.dart';
import 'package:freshroot/model/vagetable_model.dart';
import 'package:freshroot/widgets/nutrition_detail_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.vegetable});

  final VagetableModel vegetable;

  @override
  Widget build(BuildContext context) {
    final double sHeight = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            vegetable.name!,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontFamily: GoogleFonts.josefinSans().fontFamily,
                ),
          ),
          centerTitle: true,
        ),

        //body
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //image

              Container(
                width: double.infinity,
                height: sHeight * .3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(int.parse(vegetable.gradientColor![0])),
                      Color(int.parse(vegetable.gradientColor![1])),
                    ],
                  ),
                ),
                child: Hero(
                  tag: vegetable.name!,
                  child: Image.asset(
                    "assets/images/${vegetable.name!.replaceAll(" ", "")}.png",
                  ),
                ),
              ),

              SizedBox(
                height: sHeight * .04,
              ),

              //tagline

              Text(
                vegetable.tagline!,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontFamily: GoogleFonts.josefinSans().fontFamily,
                    ),
              ),

              //space
              SizedBox(
                height: sHeight * .03,
              ),

              //nutrition
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: nutritionDetailWidget(context: context, vegetable: vegetable,),
              ),

                SizedBox(
                height: sHeight * .04,
              ),

              //description


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  vegetable.description!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: GoogleFonts.josefinSans().fontFamily,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
