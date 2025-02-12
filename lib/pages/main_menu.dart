import 'package:flutter/material.dart';
import 'quiz.dart'; // Assuming you have quiz.dart for the Quiz page
import 'how_to_play.dart'; // Assuming you have how_to_play.dart for the How to Play page
import 'assets_page.dart'; // Import the AssetsPage
import 'package:external_app_launcher/external_app_launcher.dart';

class MainMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Prevent back button from appearing
        title: Text('Main Menu'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: ListView(
          children: [
            SizedBox(height: size.height * 0.05), // Space above the logo
            Center(
              child: Image.asset(
                'assets/images/Logo.png', // Path to your logo image
                height: size.height * 0.25, // Adjust the height as needed
              ),
            ),
            SizedBox(height: size.height * 0.05), // Space between logo and buttons
            _buildMenuButton(
              context,
              icon: Icons.school,
              iconSize: size.height * 0.03, // Adjust the icon size as needed
              text: 'AR Learn',
              onTap: () async {
                // Handle AR Learn button press
                try {
                  bool isAppInstalled = await LaunchApp.isAppInstalled(
                    androidPackageName: 'com.haroldjustine.kdmadeeasy',
                  );

                  if (isAppInstalled) {
                    await LaunchApp.openApp(
                      androidPackageName: 'com.haroldjustine.kdmadeeasy',
                    );
                  } else {
                    // Redirect to Google Play Store if the app is not installed
                    await LaunchApp.openApp(
                      androidPackageName: 'com.haroldjustine.kdmadeeasy',
                      openStore: true,
                    );
                  }
                } catch (e) {
                  print("Error: $e");
                }
              },
            ),
            _buildMenuButton(
              context,
              icon: Icons.quiz,
              iconSize: size.height * 0.03, // Adjust the icon size as needed
              text: 'Quiz',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            _buildMenuButton(
              context,
              icon: Icons.play_arrow,
              iconSize: size.height * 0.04, // Adjust the icon size as needed
              text: 'How to Play',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HowToPlayPage()),
                );
              },
            ),
            _buildMenuButton(
              context,
              icon: Icons.image,
              iconSize: size.height * 0.03, // Adjust the icon size as needed
              text: 'Flashcards',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AssetsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, {required IconData icon, required double iconSize, required String text, required void Function() onTap}) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.013),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).primaryColor,
            border: Border.all(
              color: Colors.white, // White outline color
              width: 0.0, // Width of the outline
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: size.height * 0.025, horizontal: size.width * 0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, size: iconSize, color: Colors.black), // Set icon color and size
              SizedBox(width: size.width * 0.05),
              Text(
                text,
                style: TextStyle(
                  color: Colors.black, // Set text color to black
                  fontSize: size.height * 0.025,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
