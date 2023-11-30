import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    home: MyNavigate(),
  ));
}

class MyNavigate extends StatefulWidget {
  const MyNavigate({Key? key}) : super(key: key);

  @override
  _MyNavigateState createState() => _MyNavigateState();
}

class _MyNavigateState extends State<MyNavigate> {
  List<String> imagePaths = [
    'assets/image1.jpeg',
    'assets/image2.png',
    'assets/image3.webp',
    'assets/image4.avif',
    'assets/image5.jpeg',
    'assets/image6.webp',
  ];

  List<String> imageTexts = [
    'Yoga',
    'Step Counter',
    'Pulse',
    'Stress Buster',
    'AI Dietician',
    'Miscellaneous',
  ];

  List<String> carPaths = [
    'assets/car1.avif',
    'assets/car2.jpeg',
    'assets/car3.jpeg',
    'assets/car4.jpeg',
    'assets/car5.png',
  ];

  bool isAppBarVisible = true;

  void toggleAppBarVisibility() {
    setState(() {
      isAppBarVisible = !isAppBarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAppBarVisible
          ? AppBar(
        title: Text('Features'),
        backgroundColor: Colors.teal,
      )
          : null,
      body: GestureDetector(
        onTap: toggleAppBarVisibility,
        child: Container(
          color: Colors.teal,
          child: ListView(
            children: <Widget>[
              CarouselSlider.builder(
                itemCount: carPaths.length,
                itemBuilder: (context, index, realIndex) {
                  return AspectRatio(
                    aspectRatio: 16 / 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        carPaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.3,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 1),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: ClickableCard(
                            imagePath: imagePaths[0],
                            text: imageTexts[0],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ClickableCard(
                            imagePath: imagePaths[1],
                            text: imageTexts[1],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: ClickableCard(
                            imagePath: imagePaths[3],
                            text: imageTexts[3],
                            onTap: () {
                              _navigateToURL(
                                  'https://srikanth7785.github.io/deleteThisASAP/#/');
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ClickableCard(
                            imagePath: imagePaths[2],
                            text: imageTexts[2],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: ClickableCard(
                            imagePath: imagePaths[4],
                            text: imageTexts[4],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ClickableCard(
                            imagePath: imagePaths[5],
                            text: imageTexts[5],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _navigateToURL(String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
        // Handle the case where the URL cannot be launched, such as displaying an error message.
      }
    } catch (e) {
      print('Error launching URL: $e');
      // Handle the error as needed, such as displaying an error message.
    }
  }

}

class ClickableCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? onTap;

  ClickableCard({required this.imagePath, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(7.0),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 100.0,
              height: 100.0,
            ),
            SizedBox(height: 10.0),
            Text(
              text,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
