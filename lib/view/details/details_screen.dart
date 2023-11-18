
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news/controller/homescreencontroller.dart';
import 'package:provider/provider.dart';


class detail_screen extends StatefulWidget {
  final int itemIndex;
  const detail_screen({super.key, required this.itemIndex});

  @override
  State<detail_screen> createState() => _detail_screenState();
}

class _detail_screenState extends State<detail_screen> {


  @override
  Widget build(BuildContext context) {
     final homescreenproviderState = Provider.of<Homescreen_provider>(context);
    return 
    Scaffold(appBar: AppBar(backgroundColor: Color.fromARGB(255, 4, 4, 4),
    title: Text("NEWS ",style: TextStyle(
      color: Colors.white
    ),),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 380,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: 
                NetworkImage("${homescreenproviderState.datamodel?.articles?[widget.itemIndex].urlToImage}",))
              ),
            ),
            
              Text(
                   homescreenproviderState.datamodel?.articles?[widget.itemIndex].publishedAt.toString() ?? "",
                   style: TextStyle(
                                          color: const Color.fromARGB(255, 11, 11, 11),
                                          fontWeight: FontWeight.w700),
                                    ),
            Text(
                  homescreenproviderState.datamodel?.articles?[widget.itemIndex].title.toString() ?? "",
                                         
                  style: TextStyle(
                   color: const Color.fromARGB(255, 11, 11, 11),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20),
                                    ),
           
            Text(
                                      homescreenproviderState.datamodel
                                              ?.articles?[widget.itemIndex].author
                                              .toString() ??
                                          "",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 87, 58, 231),
                                          fontWeight: FontWeight.w700),
                                    ),
           
               Text(
                                      homescreenproviderState.datamodel
                                              ?.articles?[widget.itemIndex].description
                                              .toString() ??
                                          "",
                                      style: TextStyle(
                                          color: const Color.fromARGB(255, 11, 11, 11),
                                          fontWeight: FontWeight.w700),
                                    ), 
                  SizedBox(height: 20,),   
             Container(
              width: double.infinity,
              height: 300,
              color: Colors.black,
               child: CarouselSlider(
                              items: List.generate(
                                  10,
                                  (index) => InkWell(
                                     onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  detail_screen(
                                                    itemIndex: index,
                                                    
                                                  ),
                                            ));
                                      },
                                    child: Container(height: 100,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                             
                                                  image: DecorationImage(image: NetworkImage(
                                                   "${homescreenproviderState.datamodel?.articles?[index].urlToImage}", 
                                                  ),fit: BoxFit.cover)),
                                                  child:Padding(
                                                    padding: const EdgeInsets.only(top: 230),
                                                    child: Text(
                                                    " ${homescreenproviderState.datamodel?.articles?[index].title.toString() ?? ""}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold),
                                                                                            ),
                                                  ),
                                        ),
                                  )),
                              options: CarouselOptions(autoPlayCurve: Curves.easeInCubic,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 600),
                                enlargeCenterPage: true,
                                viewportFraction: 1,
                                height: 270,
                                autoPlay: true,
                              )),
             ),                   
          
          ],
        ),
      ),
    );
  }
}