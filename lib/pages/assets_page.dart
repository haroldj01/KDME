import 'package:flutter/material.dart';

// Define custom yellow color
const Color kYellow = Color.fromARGB(255, 214, 184, 92);

class AssetsPage extends StatelessWidget {
  // Define different groups of images with customizable group names
  final List<Map<String, dynamic>> imageGroups = [
    {
      'groupName': 'Animals',
      'images': [
        {'name': 'Turtle', 'path': 'assets/flashcards/turtle.png'},
        {'name': 'Cat', 'path': 'assets/flashcards/cat.png'},
        {'name': 'Chicken', 'path': 'assets/flashcards/chicken.png'},
        {'name': 'Frog', 'path': 'assets/flashcards/frog.png'},
        {'name': 'Dog', 'path': 'assets/flashcards/dog.png'},
      ],
    },
    {
      'groupName': 'Bedroom',
      'images': [
        {'name': 'Lamp', 'path': 'assets/flashcards/lamp.png'},
        {'name': 'Mirror', 'path': 'assets/flashcards/mirror.png'},
        {'name': 'Blanket', 'path': 'assets/flashcards/blanket.png'},
        {'name': 'Shirt', 'path': 'assets/flashcards/shirt.png'},
        {'name': 'Bed', 'path': 'assets/flashcards/bed.png'},
      ],
    },
    {
      'groupName': 'Body',
      'images': [
        {'name': 'Back', 'path': 'assets/flashcards/back.png'},
        {'name': 'Neck', 'path': 'assets/flashcards/neck.png'},
        {'name': 'Arm', 'path': 'assets/flashcards/arm.png'},
        {'name': 'Leg', 'path': 'assets/flashcards/leg.png'},
        {'name': 'Knee', 'path': 'assets/flashcards/knee.png'},
      ],
    },
    {
      'groupName': 'Colors',
      'images': [
        {'name': 'Red', 'path': 'assets/flashcards/red.png'},
        {'name': 'Blue', 'path': 'assets/flashcards/blue.png'},
        {'name': 'White', 'path': 'assets/flashcards/white.png'},
        {'name': 'Green', 'path': 'assets/flashcards/green.png'},
        {'name': 'Black', 'path': 'assets/flashcards/black.png'},
      ],
    },
    {
      'groupName': 'Expressions',
      'images': [
        {'name': 'Smile', 'path': 'assets/flashcards/smile.png'},
        {'name': 'Laughing', 'path': 'assets/flashcards/laughing.png'},
        {'name': 'Cry', 'path': 'assets/flashcards/cry.png'},
        {'name': 'Fear', 'path': 'assets/flashcards/fear.png'},
        {'name': 'Angry', 'path': 'assets/flashcards/angry.png'},
      ],
    },
    {
      'groupName': 'Face',
      'images': [
        {'name': 'Mouth', 'path': 'assets/flashcards/mouth.png'},
        {'name': 'Ear', 'path': 'assets/flashcards/ear.png'},
        {'name': 'Eye', 'path': 'assets/flashcards/eye.png'},
        {'name': 'Hair', 'path': 'assets/flashcards/hair.png'},
        {'name': 'Nose', 'path': 'assets/flashcards/nose.png'},
      ],
    },
    {
      'groupName': 'Family',
      'images': [
        {'name': 'Mother', 'path': 'assets/flashcards/mother.png'},
        {'name': 'Father', 'path': 'assets/flashcards/father.png'},
        {'name': 'Grandmother', 'path': 'assets/flashcards/grandmother.png'},
        {'name': 'Grandfather', 'path': 'assets/flashcards/grandfather.png'},
        {'name': 'Child', 'path': 'assets/flashcards/child.png'},
      ],
    },
    {
      'groupName': 'Greetings',
      'images': [
        {'name': 'Hello', 'path': 'assets/flashcards/hello.png'},
        {'name': 'Good Evening', 'path': 'assets/flashcards/goodEvening.png'},
        {'name': 'Good Night', 'path': 'assets/flashcards/goodNight.png'},
        {'name': 'Good Afternoon', 'path': 'assets/flashcards/goodAfternoon.png'},
        {'name': 'Good Morning', 'path': 'assets/flashcards/goodMorning.png'},
      ],
    },
    {
      'groupName': 'Hobbies',
      'images': [
        {'name': 'Dancing', 'path': 'assets/flashcards/dancing.png'},
        {'name': 'Cooking', 'path': 'assets/flashcards/cooking.png'},
        {'name': 'Writing', 'path': 'assets/flashcards/writing.png'},
        {'name': 'Singing', 'path': 'assets/flashcards/singing.png'},
        {'name': 'Running', 'path': 'assets/flashcards/running.png'},
      ],
    },
    {
      'groupName': 'Home',
      'images': [
        {'name': 'Clock', 'path': 'assets/flashcards/clock.png'},
        {'name': 'Cabinet', 'path': 'assets/flashcards/cabinet.png'},
        {'name': 'Desk', 'path': 'assets/flashcards/desk.png'},
        {'name': 'Chair', 'path': 'assets/flashcards/chair.png'},
        {'name': 'Stairs', 'path': 'assets/flashcards/stairs.png'},
      ],
    },
    {
      'groupName': 'Kitchen',
      'images': [
        {'name': 'Knife', 'path': 'assets/flashcards/knife.png'},
        {'name': 'Fork', 'path': 'assets/flashcards/fork.png'},
        {'name': 'Spoon', 'path': 'assets/flashcards/spoon.png'},
        {'name': 'Glass', 'path': 'assets/flashcards/glass.png'},
        {'name': 'Pot', 'path': 'assets/flashcards/pot.png'},
      ],
    },
    {
      'groupName': 'Numbers',
      'images': [
        {'name': 'One', 'path': 'assets/flashcards/one.png'},
        {'name': 'Two', 'path': 'assets/flashcards/two.png'},
        {'name': 'Three', 'path': 'assets/flashcards/three.png'},
        {'name': 'Four', 'path': 'assets/flashcards/four.png'},
        {'name': 'Five', 'path': 'assets/flashcards/five.png'},
        {'name': 'Six', 'path': 'assets/flashcards/six.png'},
        {'name': 'Seven', 'path': 'assets/flashcards/seven.png'},
        {'name': 'Eight', 'path': 'assets/flashcards/eight.png'},
        {'name': 'Nine', 'path': 'assets/flashcards/nine.png'},
        {'name': 'Ten', 'path': 'assets/flashcards/ten.png'},
      ],
    },
    {
      'groupName': 'Pronouns',
      'images': [
        {'name': 'You', 'path': 'assets/flashcards/you.png'},
        {'name': 'You Guys', 'path': 'assets/flashcards/youGuys.png'},
        {'name': 'We', 'path': 'assets/flashcards/we.png'},
        {'name': 'Them', 'path': 'assets/flashcards/them.png'},
        {'name': 'Me', 'path': 'assets/flashcards/me.png'},
      ],
    },
    {
      'groupName': 'Sports',
      'images': [
        {'name': 'Volleyball', 'path': 'assets/flashcards/volleyball.png'},
        {'name': 'Swimming', 'path': 'assets/flashcards/swimming.png'},
        {'name': 'Basketball', 'path': 'assets/flashcards/basketball.png'},
        {'name': 'Football', 'path': 'assets/flashcards/football.png'},
        {'name': 'Cycling', 'path': 'assets/flashcards/cycling.png'},
      ],
    },
    {
      'groupName': 'Time',
      'images': [
        {'name': 'Afternoon', 'path': 'assets/flashcards/afternoon.png'},
        {'name': 'Night', 'path': 'assets/flashcards/night.png'},
        {'name': 'A Day', 'path': 'assets/flashcards/aDay.png'},
        {'name': 'Evening', 'path': 'assets/flashcards/evening.png'},
        {'name': 'Morning', 'path': 'assets/flashcards/morning.png'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: imageGroups.length,
          itemBuilder: (context, groupIndex) {
            String groupName = imageGroups[groupIndex]['groupName'];
            List<Map<String, String>> images = List<Map<String, String>>.from(imageGroups[groupIndex]['images']);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20), // Space before each group
                Container(
                  color: kYellow, // Custom yellow background color
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      groupName,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10), // Small space between title and images
                ListView.separated(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: images.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    String name = images[index]['name']!;
                    String assetPath = images[index]['path']!;
                    return _buildAssetItem(context, name, assetPath);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAssetItem(BuildContext context, String name, String assetPath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FullscreenImagePage(assetPath)),
        );
      },
      child: Card(
        elevation: 4.0,
        color: kYellow.withOpacity(0.65), // Background color of each item
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 10),
              Image.asset(
                assetPath,
                width: 50, // Adjust width as per your requirement
                height: 50, // Adjust height as per your requirement
                fit: BoxFit.cover, // Ensure the image covers the specified area
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FullscreenImagePage extends StatelessWidget {
  final String assetPath;

  FullscreenImagePage(this.assetPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset(
          assetPath,
          fit: BoxFit.contain, // Ensure the image fits within screen bounds
        ),
      ),
    );
  }
}
