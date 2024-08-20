import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      title: 'Developer Title',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          color: Colors.teal,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

Future<void> _launchURL(Uri url) async {
  //if (await canLaunchUrl(url)) {
  await launchUrl(url);
  // } else {
  //  throw 'Could not launch $url';
//  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer Profile'),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  margin: const EdgeInsets.only(top: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(148),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 60,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Transform.scale(
                    scale: 1.6,
                    child: CircleAvatar(
                      radius: 90,
                      backgroundImage:
                          AssetImage('assets/images/RDPRoyalslogo.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  iconSize: 40,
                  icon: Icon(Icons.email),
                  onPressed: () {
                    _launchURL(
                        Uri(scheme: 'mailto', path: 'example@example.com'));
                  },
                ),
                IconButton(
                  iconSize: 40,
                  icon: Icon(Icons.web),
                  onPressed: () {
                    _launchURL(
                      Uri.parse('https://www.linkedin.com'),
                    );
                  },
                ),
                IconButton(
                  iconSize: 40,
                  icon: Icon(Icons.code),
                  onPressed: () {
                    _launchURL(
                      Uri.parse('https://www.Github.com'),
                    );
                  },
                ),
              ],
            ),
            Text(
              'Flutter developer with experience in building beautiful and performant mobile app.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
