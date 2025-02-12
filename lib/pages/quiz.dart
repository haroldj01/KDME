import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kdmadeeasy/animations/fade_in_animation.dart';
import 'package:kdmadeeasy/configs/constants.dart';
import 'package:kdmadeeasy/data/words.dart';
import 'package:kdmadeeasy/databases/database_manager.dart';
import 'package:kdmadeeasy/notifiers/flashcards_notifier.dart';
import 'package:kdmadeeasy/notifiers/review_notifier.dart';
import 'package:kdmadeeasy/pages/review_page.dart';
import 'package:kdmadeeasy/pages/settings_page.dart';
import 'package:provider/provider.dart';
import '../components/home_page/topic_tile.dart';
import '../pages/main_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _topics = [];

  @override
  initState() {
    for (var t in words) {
      if (!_topics.contains(t.topic)) {
        _topics.add(t.topic);
      }
      _topics.sort();
    }

    _topics.insertAll(0, ['Random 5', 'Random 20', 'Test All']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.04;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainMenuPage()));
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        toolbarHeight: size.height * 0.15,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Provider.of<FlashcardsNotifier>(context, listen: false).setTopic(topic: 'Settings');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                  },
                  child: SizedBox(
                    width: size.width * kIconPadding,
                    child: Image.asset('assets/images/Settings.png'),
                  ),
                ),
                SizedBox(
                  height: size.height * kIconPadding,
                )
              ],
            ),
            Expanded(
              child: const FadeInAnimation(
                child: Text(
                  'Test Your KadazanDusun!\n\nPogumbalan KadazanDusun Diya!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18), // Adjust font size
                ),
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _loadReviewPage(context);
                  },
                  child: SizedBox(
                    width: size.width * kIconPadding,
                    child: Image.asset('assets/images/Review.png'),
                  ),
                ),
                SizedBox(
                  height: size.height * kIconPadding,
                )
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: widthPadding, right: widthPadding),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: size.height * 0.40,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.all(size.width * 0.10),
                  child: FadeInAnimation(
                    child: Image.asset('assets/images/Logo.png'),
                  ),
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: _topics.length,
                    (context, index) => TopicTile(topic: _topics[index]),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loadReviewPage(BuildContext context) {
    Provider.of<FlashcardsNotifier>(context, listen: false).setTopic(topic: 'Review');

    DatabaseManager().selectWords().then((words) {
      final reviewNotifier = Provider.of<ReviewNotifier>(context, listen: false);
      if (words.isEmpty) {
        reviewNotifier.disabledButtons(disabled: true);
      } else {
        reviewNotifier.disabledButtons(disabled: false);
      }
      Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewPage()));
    });
  }
}
