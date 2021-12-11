import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:news_app/model/categorymodel.dart';
import 'package:news_app/modellist.dart';
import 'package:news_app/Healthpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News app',
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Categorymodel> categories = new List<Categorymodel>();

  Categorymodel categorymodel;
  @override
  void initState() {
    super.initState();
    categories = getcategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Text(
                'update',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
            ],
          ),
          elevation: 0.0,
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Container(
              //height: 300,
              //color: Colors.pink,

              child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 1,
                children: List.generate(categories.length, (index) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.pink,
                        ),
                        height: 300,
                        child: GestureDetector(
                          onTap: () {
                            if (categories[index].categoryname == "Health") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HealthPage()));
                            } else if (categories[index].categoryname ==
                                "Business") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HealthPage()));
                            } else if (categories[index].categoryname ==
                                "Entertainment") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HealthPage()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HealthPage()));
                            }
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(
                                  categories[index].imageurl,
                                  fit: BoxFit.fitHeight,
                                  height: 300,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20.0)),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  categories[index].categoryname,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ));
  }
}
