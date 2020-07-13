import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  // All the code that stylizes the myItems() tiles
  Material socialItems(IconData icon, String heading, int color) {
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
    var data = [
      'https://www.instagram.com/kingdomtodaygso/',
      'https://twitter.com/kingdomtodaygso',
      'https://www.facebook.com/kingdomtodaygso/',
    ];
    _instagramURL() async {
      var url = data[0];
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _twitterURL() async {
      var url = data[1];
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _facebookURL() async {
      var url = data[2];
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

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
        children: <Widget>[
          InkWell(
            child: socialItems(
              FontAwesomeIcons.instagram,
              'Instagram',
              0xffed622b,
            ),
            onTap: _instagramURL,
          ),
          InkWell(
            child: socialItems(
              FontAwesomeIcons.twitter,
              'Twitter',
              0xff7297ff,
            ),
            onTap: _twitterURL,
          ),
          InkWell(
            child: socialItems(
              FontAwesomeIcons.facebook,
              'Facebook',
              0xff3399fe,
            ),
            onTap: _facebookURL,
          ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(2, 130.0),
          StaggeredTile.extent(2, 130.0),
        ],
      ),
    );
  }
}
