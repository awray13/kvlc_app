import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'social.dart';
import 'techchurch.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data = [
    'http://mixlr.com/kingdomtodaygsotechchurch/showreel/',
    'https://www.kingdomtodaygso.com/upcoming-events',
    'https://www.kingdomtodaygso.com/partnership',
    'https://www.bible.com/bible/1/GEN.1.KJV',
    'https://www.kingdomtodaygso.com/store',
    'https://www.kingdomtodaygso.com/contact',
    'https://www.kingdomtodaygso.com/about',
  ];
  // Launch URL data
  _techChurchURL() async {
    var url = data[0];
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _eventsURL() async {
    var url = data[1];
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _donateURL() async {
    var url = data[2];
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _bibleURL() async {
    var url = data[3];
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _storeURL() async {
    var url = data[4];
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _contactURL() async {
    var url = data[5];
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _aboutURL() async {
    var url = data[6];
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // All the code that stylizes the myItems() tiles
  Material myItems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196f3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Styling for Text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                        color: new Color(color),
                        fontSize: 20.0,
                      ),
                    ),
                  ),

                  // Styling for Icons
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Code for what the UI the user will actually see
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kingdom Vision Life Center',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        // Wrapped InkWell() around myItems() to gain tile functionality
        // All tiles that need to route to a website are able to route
        // successfully
        children: [
          InkWell(
            child: myItems(
              Icons.graphic_eq,
              'Tech Church',
              0xffed622b,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tech()),
              );
            },
          ),
          InkWell(
            child: myItems(
              Icons.calendar_today,
              'Events',
              0xff26cb3c,
            ),
            onTap: _eventsURL,
          ),
          InkWell(
            child: myItems(
              Icons.payment,
              'Donate',
              0xff3399fe,
            ),
            onTap: _donateURL,
          ),
          InkWell(
            child: myItems(
              FontAwesomeIcons.cross,
              'Bible',
              0xffff3266,
            ),
            onTap: _bibleURL,
          ),
          // TODO: Find a way to route to a secondary social page
          InkWell(
            child: myItems(
              Icons.chat_bubble,
              'Social',
              0xfff4c83f,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Social()),
              );
            },
          ),
          InkWell(
            child: myItems(
              Icons.store,
              'Store',
              0xff622f74,
            ),
            onTap: _storeURL,
          ),
          InkWell(
            child: myItems(
              Icons.email,
              'Contact Us',
              0xff7297ff,
            ),
            onTap: _contactURL,
          ),
          InkWell(
            child: myItems(
              Icons.info_outline,
              'About Us',
              0xff008968,
            ),
            onTap: _aboutURL,
          ),
//          InkWell(
//            child: Image.asset('images/dream_book.png'),
//          ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
//          StaggeredTile.extent(2, 250.0),
        ],
      ),
    );
  }
}
