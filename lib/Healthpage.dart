import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/articlemodel.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/model/categorymodel.dart';
import 'package:news_app/modellist.dart';

class HealthPage extends StatefulWidget {
  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  bool loading = true;
  List<ArticleModel> articles = List<ArticleModel>();
  List<Categorymodel> categories = List<Categorymodel>();
  Categorymodel categorymodel;
  @override
  void initState() {
    super.initState();
    categories = getcategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
    print(articles.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            //mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Padding(
                padding: EdgeInsets.only(left: 80.0),
                child: Text(
                  'Get',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
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
        body: loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SafeArea(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  //color: Colors.pink,
                  child: ListView.builder(
                      itemCount: articles.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return blogtile(
                          imageUrl: articles[index].urltoImage,
                          title: articles[index].title,
                          desc: articles[index].description,
                        );
                      }),
                ),
              ));
  }
}

class blogtile extends StatelessWidget {
  final String imageUrl, title, desc;

  blogtile(
      {@required this.imageUrl, @required this.title, @required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      //color: Colors.green,
      child: Card(
        elevation: 10.0,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(imageUrl)),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 10.0,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  desc,
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                )),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
