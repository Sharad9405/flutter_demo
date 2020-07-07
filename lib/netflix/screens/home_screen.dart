import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/netflix/screens/movie_details_screen.dart';
import 'package:flutter_app/netflix/utils/app_constant.dart';
import 'package:flutter_app/netflix/widgets/content_scroll.dart';
import 'package:flutter_app/provider/common/text_styles.dart';

class NetflixDashboard extends StatefulWidget {
  @override
  _NetflixDashboardState createState() => _NetflixDashboardState();
}

class _NetflixDashboardState extends State<NetflixDashboard> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();


//    Future.delayed(const Duration(seconds: 5), (){
//      _pageController = PageController(
//          initialPage: 1,
//          viewportFraction: 0.8
//      );
//    });

    _pageController = PageController(
        initialPage: 1,
        viewportFraction: 0.8,
    );

//    if (_pageController.hasClients) {
//      _pageController.animateToPage(
//        1,
//        duration: const Duration(milliseconds: 1000),
//        curve: Curves.easeInOut,
//      );
//    }



  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image(
          width: double.infinity,
          height: 50.0,
          image: AssetImage('assets/images/netflix_logo.png'),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () => print("Menu"),
          icon: Icon(Icons.menu),
          iconSize: 20.0,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => print('Search'),
            icon: Icon(Icons.search),
            iconSize: 20.0,
            color: Colors.black,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            height: 180,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: AppConstant.movies.length,
              itemBuilder: (BuildContext context, int index) {
                return _movieSelector(index);
              },
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 70,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              scrollDirection: Axis.horizontal,
              itemCount: AppConstant.movieCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 120.0,
//                  decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(10.0),
//                    gradient: LinearGradient(
//                      begin: Alignment.topCenter,
//                      end: Alignment.bottomCenter,
//                      colors: [
//                        Color(0xFFD45253),
//                        Color(0xFF9E1F28),
//                      ],
//                    ),
//                    boxShadow: [
//                      BoxShadow(
//                        color: Color(0xFF9E1F28),
//                        offset: Offset(0.0, 2.0),
//                        blurRadius: 6.0,
//                      ),
//                    ],
//                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFD45253),
                              Color(0xFF9E1F28),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF9E1F28),
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
//                          child:  BackdropFilter(
//                            filter: ImageFilter.blur(sigmaX: 0.0,sigmaY: 0.0),
//                            child: Container(
//                              color: Colors.black.withOpacity(0.1),
//                            ),
//                          )
//                        child: ClipRRect(
//                          borderRadius: BorderRadius.circular(10.0),
//                          child: Image(
//                            width: double.infinity,
//                            height: double.infinity,
//                           image: AssetImage(AppConstant.movies[index]),
//                            fit: BoxFit.cover,
//                          ),
//                        ),
                      ),
                      Text(
                        '${AppConstant.movieCategories[index].toUpperCase()}',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                            color: Colors.white),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.0),
          HorizontalScrollView(
            images: AppConstant.movies,
            title: 'Latest',
            imageHeight: 200.0,
            imageWidth: 110.0,
          ),
          SizedBox(height: 10.0),
          HorizontalScrollView(
            images: AppConstant.movies,
            title: 'Popular',
            imageHeight: 200.0,
            imageWidth: 110.0,
          ),
          SizedBox(height: 10.0),
          HorizontalScrollView(
            images: AppConstant.movies,
            title: 'Top Rated',
            imageHeight: 200.0,
            imageWidth: 110.0,
          ),
          SizedBox(height: 10.0),
          HorizontalScrollView(
            images: AppConstant.movies,
            title: 'Upcoming',
            imageHeight: 200.0,
            imageWidth: 110.0,
          ),
        ],
      ),
    );
  }

  _movieSelector(int index) {
//    _pageController.jumpToPage(1);

    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 180.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetails(),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: AppConstant.movies[index],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(AppConstant.movies[index]),
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: Container(
                width: 250.0,
                child: Text(
                  AppConstant.movies[index].toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
