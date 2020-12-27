import 'package:ThailandTravel/data/data.dart';
import 'package:ThailandTravel/model/countrymodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {

  final String imgUrl;
  final String placeName;
  final double rating;
  final String detail;

  Details({@required this.imgUrl, @required this.placeName, @required this.rating,@required this.detail});



  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<CountryModel> country = new List();

@override
  void initState() {
    country = getCountrys();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.imgUrl,
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                      height: 350,
                      color: Colors.black12,
                      padding: EdgeInsets.only(top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: () { Navigator.pop(context); },),
                                Spacer(),
                                Icon(
                                  Icons.share_outlined,
                                  color: Colors.white54,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Image.asset(
                                  "assets/heart.png",
                                  height: 24,
                                  width: 24,
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  widget.placeName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 23),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      size: 25,
                                      color: Colors.lightGreenAccent,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Rating",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RatingBar(widget.rating.round()),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "${widget.rating}",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 18),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            height: 50,
                          )
                        ],
                      ))
                ],
              ),
              Container(
                  child: Row(
                children: [DetailsCard()],
              )),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                    widget.detail,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff879D95))
                        ),
              ),
                                      SizedBox(
                  height: 16,
                ),
                Container(
                  height: 240,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                      itemCount: country.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ImageListTitle(

                          imgUrl: country[index].imgUrl,
                        );
                      }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final String title;
  final String no0fReviews;
  final double rating;
  DetailsCard({this.title, this.no0fReviews, this.rating});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

        ],
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating;
  RatingBar(this.rating);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: rating >= 1 ? Colors.red : Colors.white54,
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating >= 2 ? Colors.red : Colors.white54,
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating >= 3 ? Colors.red : Colors.white54,
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating >= 4 ? Colors.red : Colors.white54,
        ),
        SizedBox(
          width: 3,
        ),
        Icon(
          Icons.star,
          color: rating >= 5 ? Colors.red : Colors.white54,
        ),
      ],
    ));
  }
}

class ImageListTitle extends StatelessWidget {
  final String imgUrl;
  ImageListTitle({@required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          height: 200,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
