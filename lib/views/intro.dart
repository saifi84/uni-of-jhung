import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:uni_jhang/views/homepage.dart';
import 'package:uni_jhang/views/login.dart';
import 'package:uni_jhang/views/signup.dart';

class UOJHomePage extends StatefulWidget {
  const UOJHomePage({Key? key}) : super(key: key);

  @override
  _UOJHomePageState createState() => _UOJHomePageState();
}

class _UOJHomePageState extends State<UOJHomePage> {
  final List<String> _imageUrls = [
    'assets/image1.jpeg',
    'https://picsum.photos/id/1012/800/400',
    'https://picsum.photos/id/1015/800/400',
    'https://picsum.photos/id/1019/800/400',
  ];
  bool admission = false;
  bool exam = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          width: 40,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo.png',
          height: 50,
          width: 50,
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignUpPage()),
              );
            },
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: const Text('Admission'),
          ),
          const SizedBox(width: 10),
          TextButton(
            onPressed: () {
              setState(() {
                exam = true;
                admission = false;
                if (FirebaseAuth.instance.currentUser == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePageExam(),
                    ),
                  );
                }
              });
            },
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: const Text('Exams'),
          ),
          const SizedBox(width: 80),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage('assets/uoj_header_bg.jpg'),
                  //   fit: BoxFit.cover,
                  // ),
                  ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    CarouselSlider.builder(
                      itemCount: _imageUrls.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        final imageUrl = _imageUrls[index];
                        final isAssetImage = imageUrl.startsWith(
                            'assets/'); // Check if it's an asset image

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: isAssetImage
                                  ? AssetImage(imageUrl)
                                      as ImageProvider // Cast to ImageProvider
                                  : NetworkImage(imageUrl)
                                      as ImageProvider, // Cast to ImageProvider
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.60,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Container(
                  height: 450,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 350,
                        width: 550,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome to University of Jhang",
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'This Academic Walkway is working under the command, control and close supervision of Higher Education Department (HED), Punjab Higher Education Commission (PHEC) and Higher Education Commission of Pakistan (HEC). The Syndicate of the University of Jhang consists of elites of Higher Education Sector with representatives from; public and private sector, well-known parliamentarians and distinguished citizens. Since its inception, the University has been dedicated to the cause of educating the youth of the country. We consist of a blend of faculty members with dynamic teaching and research experience to their credit. Such highly qualified and experienced faculty is fully supported by the innovative and latest teaching aids in the pleasant and conducive classroom environment. With a vision of meeting the higher education needs of the students and the nation building, our Syndicate and other academic bodies want to establish a state of the art university by hiring senior and highly qualified faculty, introducing the culture of research, developing linkages with industries and grooming the youth as the building blocks of the future of the country.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 500,
                        width: 500,
                        color: Colors.white,
                        child: Image.asset(
                          'assets/image1.jpeg',
                          height: 100,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  color: Colors.grey[900],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About Us',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Image.asset(
                              'assets/logo.png',
                              height: 80,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'University of Jhang came into operation in 2018. University of Jhang is a public sector university, recognized by the Punjab Higher Education Commission (PHEC) and Higher Education Commission (HEC).',
                              textAlign: TextAlign.justify,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Follow us on social media',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.facebook, color: Colors.white),
                                SizedBox(width: 10),
                                Icon(Icons.messenger_outline,
                                    color: Colors.white),
                                SizedBox(width: 10),
                                Icon(Icons.phone, color: Colors.white),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quick Contacts',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Phone: 047-7671240\n\nEmail: info@uoj.edu.pk\n\nAddress: University of Jhang 12KM Chinot Road Jhang, Pakistan',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Important Links',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Terms of Use',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Site Map',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
