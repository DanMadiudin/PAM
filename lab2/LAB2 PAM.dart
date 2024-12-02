import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageList = [
    'assets/images.png',
    'assets/images.png',
    'assets/images.png',
    'assets/images.png',
  ];

  int activeIndex = 0; // Keep track of the active image index

  // Dropdown menu data
  final List<String> locations = [
    'Paris, France',
    'Berlin, Germany',
    'Madrid, Spain',
  ];
  String selectedLocation = 'Paris, France'; // Default selected location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on_sharp,
                  color: Colors.black,
                ),
                SizedBox(width: 8),
                DropdownButton<String>(
                  value: selectedLocation, // Use the selected value here
                  items: locations.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedLocation = newValue!; // Update the selected value
                    });
                  },
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.notifications_active, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search doctor...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  fillColor: Colors.grey[300],
                  filled: true,
                ),
              ),
              SizedBox(height: 20),

              // #################### Carousel Slider ####################
              Stack(
                alignment: Alignment.bottomCenter, // Align dots at the bottom
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      viewportFraction: 1.0,
                      // Show one image at a time
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    ),
                    items: imageList.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Positioned(
                    bottom: 10, // Position dots 10 pixels from the bottom
                    child: AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: imageList.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: Colors.blue,
                        dotColor: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // #################### Categories ####################
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('See All', style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCategoryIcon(
                      'Dentistry', Icons.bluetooth, Colors.pink[200]!),
                  buildCategoryIcon('Cardiology', Icons.monitor_heart_outlined,
                      Colors.green[100]!),
                  buildCategoryIcon(
                      'Pulmonology', Icons.air, Colors.orange[300]!),
                  buildCategoryIcon(
                      'General', Icons.local_hospital, Colors.purple[100]!),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCategoryIcon(
                      'Neurology', Icons.sd_storage, Colors.greenAccent[200]!),
                  buildCategoryIcon(
                      'Gastroenterology', Icons.fastfood, Colors.purple[600]!),
                  buildCategoryIcon(
                      'Laboratory', Icons.hourglass_top, Colors.pink[100]!),
                  buildCategoryIcon(
                      'Vaccination', Icons.vaccines, Colors.blue[100]!),
                ],
              ),

              SizedBox(height: 20),

              // #################### Nearby Medical Centers ####################
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Nearby Medical Centers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('See All', style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildMedicalCenterCard(
                        'assets/medical_center1.jpg',
                        // Image path
                        'Sunrise Health Clinic',
                        // Center name
                        '123 Oak Street, CA 98765',
                        // Address
                        5,
                        // Rating
                        58,
                        // Number of reviews
                        '2.5km/40 min',
                        // Distance
                        'Hospital' // Hospital Type
                        ),
                    buildMedicalCenterCard(
                        'assets/medical_center2.jpg',
                        'Golden Cardiology',
                        '555 Bridge Street, Paris, France',
                        4.5,
                        // Rating
                        108,
                        // Number of reviews
                        '36km/180 min',
                        // Distance
                        'Hospital' // Hospital Type
                        ),
                    buildMedicalCenterCard(
                        'assets/medical_center1.jpg',
                        'Golden Cardiology',
                        '555 Bridge Street, Paris, France',
                        3.2,
                        // Rating
                        69,
                        // Number of reviews
                        '3.5km/45 min',
                        // Distance
                        'Hospital' // Hospital Type
                        ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // #################### Doctor List ####################
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('532 Found',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('Default', style: TextStyle(color: Colors.grey)),
                      Icon(Icons.compare_arrows, color: Colors.grey),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10),
              buildDoctorCard(
                'Dr. John Doe',
                'Cardiologist',
                'Heart Care Center',
                'Berlin, Germany',
                'assets/doctor.png', // Custom doctor image
                5, // Doctor's rating
              ),

              buildDoctorCard(
                'Dr. John Doe',
                'Cardiologist',
                'Heart Care Center',
                'Madrid, Spain',
                'assets/doctor.png', // Custom doctor image
                4, // Doctor's rating
              ),

              buildDoctorCard(
                'Dr. John Doe',
                'Cardiologist',
                'Heart Care Center',
                'Berlin, Germany',
                'assets/doctor.png', // Custom doctor image
                3, // Doctor's rating
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryIcon(String label, IconData icon, Color backgroundColor) {
    return Column(
      children: [
        Container(
          width: 75, // Set width for the square
          height: 75, // Set height for the square
          decoration: BoxDecoration(
            color: backgroundColor, // Use the passed background color
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
          child: Icon(icon,
              color: Colors.blue, size: 60), // Icon inside the square
        ),
        SizedBox(height: 8), // Space between icon and label
        Text(label, style: TextStyle(fontSize: 12)), // Label text
      ],
    );
  }

  Widget buildMedicalCenterCard(
      String imagePath,
      String centerName,
      String address,
      double rating,
      int reviewCount,
      String distanceTime,
      String hospitalType) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 100.0,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(centerName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(address, style: TextStyle(fontSize: 12, color: Colors.grey)),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: rating,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(width: 5),
                    Text('($reviewCount)',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 8),
                Text(distanceTime, style: TextStyle(fontSize: 12)),
                SizedBox(height: 4),
                Text(hospitalType,
                    style: TextStyle(fontSize: 12, color: Colors.blue)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDoctorCard(String name, String profession, String hospitalName,
      String location, String imagePath, double rating) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(profession),
            Text('$hospitalName, $location'),
            Row(
              children: [
                RatingBarIndicator(
                  rating: rating,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(width: 5),
                Text('($rating)',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border, color: Colors.red),
          onPressed: () {},
        ),
      ),
    );
  }
}
