import 'package:flutter/material.dart';
import 'package:priority_tick/components/head.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222f5b),
      body: SingleChildScrollView(
      child: Column(
      children: [
        MyHeader(
          height: 76, // Adjust the height as needed
          title: 'About me', // Add your title here
          useBack: false,
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('lib/assets/self.png'),
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Andhika Reihan Hervito",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Reihan'),
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Hobbies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Listening to Music',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(),
              Text(
                'Gaming',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(),
              Text(
                'Badminton',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(),
              SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      // ignore: deprecated_member_use
                      launch('https://www.instagram.com/araha.34/');
                    },
                    child: SocialWidget(
                      placeholderText: '',
                      iconData: SocialIconsFlutter.instagram,
                      iconColor: Colors.white,
                      link: 'https://www.instagram.com/araha.34/',
                      placeholderStyle: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // ignore: deprecated_member_use
                      launch('https://www.linkedin.com/in/andhika-reihan-hervito-083818245/');
                    },
                    child: SocialWidget(
                      placeholderText: '',
                      iconData: SocialIconsFlutter.linkedin_box,
                      iconColor: Colors.white,
                      link: 'https://www.linkedin.com/in/andhika-reihan-hervito-083818245/',
                      placeholderStyle: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // ignore: deprecated_member_use
                      launch('https://github.com/Deacher');
                    },
                    child: SocialWidget(
                      placeholderText: '',
                      iconData: SocialIconsFlutter.github,
                      iconColor: Colors.white,
                      link: 'https://github.com/Deacher',
                      placeholderStyle: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // ignore: deprecated_member_use
                      launch('https://twitter.com/AiZe_WC');
                    },
                    child: SocialWidget(
                      placeholderText: '',
                      iconData: SocialIconsFlutter.twitter,
                      iconColor: Colors.white,
                      link: 'https://twitter.com/AiZe_WC',
                      placeholderStyle: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              )
              ]
              ),
            )
          ],
        ),
      )
    );
  }
}