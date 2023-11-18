import 'package:flutter/material.dart';
import 'package:news/controller/homescreencontroller.dart';
import 'package:news/utils/database.dart';


import 'package:provider/provider.dart';

class sports1 extends StatefulWidget {
  final int nameindex;
  const sports1({
    super.key, required this.nameindex,
  });

  @override
  State<sports1> createState() => _sports1State();
}

class _sports1State extends State<sports1> {
  

  
  void initState() {
    Provider.of<Homescreen_provider>(context, listen: false)
        .fetchCategorySports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homescreenproviderState = Provider.of<Homescreen_provider>(context);
    return Scaffold(
      appBar: AppBar(title: Text( database.explore[widget.nameindex]["topicname"],
                                                    style:TextStyle(color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w900)),
                  backgroundColor: Color.fromARGB(255, 254, 81, 81)),
      body: homescreenproviderState.is_loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                await Provider.of<Homescreen_provider>(context, listen: false)
                    .fetchCategorySports();
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            homescreenproviderState.datamodel?.articles?.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 2),
                        itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                              height: 170,
                              width: 360,
                              decoration: BoxDecoration(border: Border.all(),
                                  color: const Color.fromARGB(255, 248, 247, 247),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 20),
                                        child: Container(
                                          height: 130,
                                          width: 180,
                                          decoration: BoxDecoration(
                                              color:Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            title: Text(
                                              homescreenproviderState.datamodel
                                                      ?.articles?[index].title
                                                      .toString() ??
                                                  "",
                                              style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: Color.fromARGB(255, 7, 7, 7))
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Container(
                                          height: 140,
                                          width: 140,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      homescreenproviderState
                                                              .datamodel
                                                              ?.articles?[index]
                                                              .urlToImage ??
                                                          ""),
                                                  fit: BoxFit.cover),
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ),
                                      ),
                                    ],
                                  ),
                                
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}