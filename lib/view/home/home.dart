
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news/controller/homescreencontroller.dart';
import 'package:news/utils/chip.dart';
import 'package:news/view/details/details_screen.dart';

import 'package:provider/provider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  


  void initState() {
    Provider.of<Homescreen_provider>(context, listen: false).Fetchnews();
    super.initState();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homescreenproviderState = Provider.of<Homescreen_provider>(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 248, 245, 245),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Text(
                "N ",
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 250, 18, 18),
                  fontWeight: FontWeight.bold,
                ),
                
              ),
              Text(
            "E W S",
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 255, 252, 252),
              fontWeight: FontWeight.bold,
            ))
            ],
          ),centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Provider.of<Homescreen_provider>(context, listen: false)
                .Fetchnews();
          },
        ),
        body: homescreenproviderState.is_loading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  await Provider.of<Homescreen_provider>(context, listen: false)
                      .Fetchnews();
                },
                child: 
                SingleChildScrollView(
                  // physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: 370,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: "Search...",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            controller: searchController,
                            onChanged: (value) {
                              // fetchData(searchquery:searchController.text);
                              if (searchController.text.length % 2 == 0) {
                                Provider.of<Homescreen_provider>(context,
                                        listen: false)
                                    .Fetchnews(
                                        searchQuery: searchController.text);
                              }
                            },
                          ),
                        ),
                      ),
                       Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        height: 50,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: mychip.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: InkWell(
                                    onTap: () async {
                                      await Provider.of<Homescreen_provider>(
                                              context,
                                              listen: false)
                                          .fetchCategorySports(
                                              category: "sports");
                                              
                                              
                                    },
                                    child: Container(
                                      width: 90,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                        Color.fromARGB(255, 226, 226, 148),
                                      ),
                                      child: Center(
                                        child: Text(
                                          mychip[index],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 180),
                        child: Text(
                                "Latest News",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black),
                              ),
                      ),
                      CarouselSlider(
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
                                child: Container(
                                      width: 350,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                          options: CarouselOptions(
                            enlargeFactor: double.infinity,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            height: 270,
                            autoPlay: true,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: Row(
                          children: [
                    
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 200),
                        child: Text("HeadLines",style: TextStyle(color: Colors.black,
                        fontSize: 20,fontWeight: FontWeight.w900),),
                      ),
                     SizedBox(height: 10,),

                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            homescreenproviderState.datamodel?.articles?.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 0,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 8),
                        itemBuilder: (context, index) => Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:
                                (context)=>detail_screen(itemIndex: index)));
                              },
                              child: Container(
                                height: 220,
                                width: 370,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          homescreenproviderState.datamodel
                                                  ?.articles?[index].urlToImage ??
                                              "",
                                        ),
                                        fit: BoxFit.cover),
                                    color:
                                        const Color.fromARGB(255, 129, 129, 128),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                
                                  
                              ),
                            ),
                             Text(
                                  homescreenproviderState
                                          .datamodel?.articles?[index].title
                                          .toString() ??
                                      "",
                                  style: TextStyle(
                                      color: const Color.fromARGB(255, 18, 18, 18),
                                      fontWeight: FontWeight.w700),
                                ),
                          ],
                        ),
                      )
                     
                    ],
                  ),
                ),
              ));
  }
}