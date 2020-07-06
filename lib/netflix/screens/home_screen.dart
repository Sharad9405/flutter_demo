import 'package:flutter/material.dart';
import 'package:flutter_app/netflix/utils/app_constant.dart';

class NetflixDashboard extends StatefulWidget {
  @override
  _NetflixDashboardState createState() => _NetflixDashboardState();
}

class _NetflixDashboardState extends State<NetflixDashboard> {

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 1,

    );
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
          height:50.0,
          image: AssetImage('assets/images/netflix_logo.png'),
        ),
        leading: IconButton(
          onPressed: () => print("Menu"),
          icon: Icon(Icons.menu),
          iconSize: 20.0,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 20.0),
            onPressed: () => print('Search'),
            icon: Icon(Icons.search),
            iconSize: 20.0,
            color: Colors.black,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 280,
            width: double.infinity,
            child: PageView.builder(
                controller: _pageController,
              itemCount: AppConstant.movies.length,
              itemBuilder: (BuildContext context, int index){
                  return _movieSelector(index);
              },
            ),
          ),
          Container(
            height: 90,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              scrollDirection: Axis.horizontal,
              itemCount: AppConstant.movieCategories.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 160.0,
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
                  child: Stack(
                    children: <Widget>[
//                      Image(
//                        image: AssetImage('assets/images/nutcracker_0.jpg'),
//                      ),
                      Positioned.fill(
                        child: Text(
                          '${AppConstant.movieCategories[index].toString().toUpperCase()}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 3.0,
                            fontFamily: 'roboto'
                          ),
                        ),
                      ),
                    ],
                  )

                );
              },
            ),
          ),
        ],
      ),
      
    );
  }

  Widget _movieSelector(int index) {

  }
}
