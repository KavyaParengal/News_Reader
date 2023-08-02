import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_reader/api_services.dart';
import 'package:news_reader/article_model.dart';
import 'package:news_reader/single_news.dart';

class NewsReader extends StatefulWidget {
  const NewsReader({Key? key}) : super(key: key);

  @override
  State<NewsReader> createState() => _NewsReaderState();
}

class _NewsReaderState extends State<NewsReader> {

  String date = DateFormat('yyyy-MM-d').format(DateTime.now());
  String time = DateFormat('HH:mm:ss').format(DateTime.now());

  List<String> descriptions = [
    "Jeremy Siegel says bitcoin's rush higher will fizzle out once people trust banks again",
    "Bitcoin notches 9-month high after inflation data bolsters speculation of smaller rate hike",
    "Bitcoin soars to a 9-month high after Credit Suisse takeover fails to calm banking fears",
    "Bitcoin plunges under \$20,000 to its lowest point in 2 months as Silvergate blow-up and bank fears rattle risk assets"
  ];

  List<String> images = [
    'images/img1.webp',
    'images/img2.webp',
    'images/img3.webp',
    'images/img4.webp'
  ];

  List<String> dates = ['2023-03-22', '2023-03-14', '2023-03-20', '2023-03-10'];
  List<String> times = ['13:39:59', '15:32:23', '13:46:19', '16:22:49'];

  // List<Model_class> news=[
  //   Model_class(
  //       image: 'images/img1.webp',
  //       desc: "Jeremy Siegel says bitcoin's rush higher will fizzle out once people trust banks again",
  //       date: '2023-03-22',
  //       time: '13:39:59'),
  //   Model_class(
  //       image: 'images/img2.webp',
  //       desc: "Bitcoin notches 9-month high after inflation data bolsters speculation of smaller rate hike",
  //       date: '2023-03-14',
  //       time: '15:32:23'),
  //   Model_class(
  //       image: 'images/img3.webp',
  //       desc: "Bitcoin soars to a 9-month high after Credit Suisse takeover fails to calm banking fears",
  //       date: '2023-03-20',
  //       time: '13:46:19'),
  //   Model_class(
  //       image: 'images/img4.webp',
  //       desc: "Bitcoin plunges under \$20,000 to its lowest point in 2 months as Silvergate blow-up and bank fears rattle risk assets",
  //       date: '2023-03-10',
  //       time: '16:22:49')
  // ];

  ApiService client=ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 70,
        title: Text('Daily News',
          style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white,letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Articles_model>>(
        future: client.getArticle(),
        builder: (BuildContext content,AsyncSnapshot<List<Articles_model>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                var articles=snapshot.data![index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (content)=>Single_news(article:articles)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(1, 2),
                              color: Colors.grey.withOpacity(.4),
                              blurRadius: 1,
                            )
                          ]
                      ),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: snapshot.data![index].urlToImage==null ?
                                    NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.indiatoday.in%2Ftechnology%2Fnews%2Fstory%2Fcrypto-crash-what-is-happening-to-bitcoin-and-is-it-good-news-for-you-1961906-2022-06-13&psig=AOvVaw0ExRkY_WmjLwXnqDLl9syo&ust=1691052319571000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCIDVmfnKvYADFQAAAAAdAAAAABAE'):
                                    NetworkImage(snapshot.data![index].urlToImage.toString()),
                                width: 150,
                                height: 130,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 5, left: 8, top: 5, bottom: 5),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data![index].description.toString(),
                                    //textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(height: 22,),
                                  Text(snapshot.data![index].publishedAt.toString()),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
    );
  }
}
