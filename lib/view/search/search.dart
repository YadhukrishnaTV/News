import 'package:flutter/material.dart';
import 'package:news/controller/homescreencontroller.dart';
import 'package:news/utils/database.dart';
import 'package:news/view/search/sp.dart';

import 'package:provider/provider.dart';

class explore extends StatelessWidget {
  const explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: database.explore.length,
               
                itemBuilder: (context, index) => Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        await Provider.of<Homescreen_provider>(context,
                                listen: false)
                            .fetchCategorySports(category: database.detail[index]["title"]);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => sports1(nameindex: index,)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 40,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red
                          ),
                          child:  Center(
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                                    database.explore[index]["topicname"],
                                                    style:TextStyle(color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900)
                                                  ),
                                Icon(Icons.arrow_forward)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                   
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}