import 'package:flutter/material.dart';
import 'package:freshroot/pages/detail_page.dart';
import 'package:freshroot/providers/vege_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "VegeTables",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontFamily: GoogleFonts.josefinSans().fontFamily,
                ),
          ),
          centerTitle: true,
        ),

        //body
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Expanded(
              child: ListView.builder(
            itemCount: context.watch<VegeProvider>().vegetables.length,
            itemBuilder: (context, index) {
              final vegetable = context.watch<VegeProvider>().vegetables[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(vegetable: vegetable),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: sHeight * .2,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(colors: [
                      Color(int.parse(vegetable.gradientColor![0])),
                      Color(int.parse(vegetable.gradientColor![1])),
                    ]),
                    boxShadow: [
                      BoxShadow(
                        color: Color(int.parse(vegetable.gradientColor![0])),
                        blurRadius: 4,
                        spreadRadius: 2,
                        offset: Offset(-1, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //image
                      Hero(
                        tag: vegetable.name!,
                        child: Image.asset(
                          "assets/images/${vegetable.name!.replaceAll(" ", "")}.png",
                          height: sHeight * .12,
                        ),
                      ),

                      //name
                      Text(
                        vegetable.name!,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontFamily: GoogleFonts.josefinSans().fontFamily,
                          shadows: [
                            Shadow(
                                color: Color(
                                    int.parse(vegetable.gradientColor![0])),
                                blurRadius: 4,
                                offset: Offset(1, 1)),
                          ],
                        ),
                      ),

                      //tagline
                      Text(
                        vegetable.tagline!,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontFamily: GoogleFonts.josefinSans().fontFamily,
                          shadows: [
                            Shadow(
                                color: Color(
                                    int.parse(vegetable.gradientColor![0])),
                                blurRadius: 4,
                                offset: Offset(1, 1)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
        ),
      ),
    );
  }
}
