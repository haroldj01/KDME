import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kdmadeeasy/components/app/custom_appbar.dart';
import 'package:kdmadeeasy/components/review_page/header_button.dart';
import 'package:kdmadeeasy/components/review_page/language_button.dart';
import 'package:kdmadeeasy/components/review_page/word_tile.dart';
import 'package:kdmadeeasy/configs/constants.dart';
import 'package:kdmadeeasy/databases/database_manager.dart';
import 'package:kdmadeeasy/enums/language_type.dart';
import 'package:kdmadeeasy/models/word.dart';
import 'package:kdmadeeasy/notifiers/flashcards_notifier.dart';
import 'package:kdmadeeasy/notifiers/review_notifier.dart';
import 'package:kdmadeeasy/pages/flashcards_page.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _listKey = GlobalKey<AnimatedListState>();

  final _reviewWords = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kAppBarHeight), child: CustomAppBar()),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Selector<ReviewNotifier, bool>(
              selector: (_, review) => review.buttonsAreDisabled,
              builder: (_, disable, __) => Row(
                children: [
                  HeaderButton(
                      isDisabled: disable,
                      title: 'Test All',
                      onPressed: () {
                        final provider = Provider.of<FlashcardsNotifier>(context, listen: false);
                        provider.selectedWords.clear();
                        DatabaseManager().selectWords().then((words) {
                          provider.selectedWords = words.toList();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:
                              (context) => FlashcardsPage()));
                        });
                      },),
                  HeaderButton(
                    isDisabled: disable,
                    title: 'Quick Test',
                    onPressed: () {
                      final provider = Provider.of<FlashcardsNotifier>(context, listen: false);
                      provider.selectedWords.clear();
                      DatabaseManager().selectWords(limit: 2).then((words) {
                        provider.selectedWords = words.toList();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:
                            (context) => FlashcardsPage()));
                      });
                    },),
                  HeaderButton(
                    isDisabled: disable,
                    title: 'Clear Cards',
                    onPressed: () {
                      _clearAllWords();
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: FutureBuilder(
              future: DatabaseManager().selectWords(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {

                  var sortList = snapshot.data as List<Word>;

                  sortList.sort((a, b) => a.english.compareTo(b.english));

                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    _insertWords(words: sortList);
                  });

                  return AnimatedList(
                    key: _listKey,
                    initialItemCount: _reviewWords.length,
                    itemBuilder: (context, index, animation) =>
                        WordTile(
                          word: _reviewWords[index],
                          index: index,
                          animation: animation,
                          onPressed: () {
                            _removeWord(word: _reviewWords[index]);
                          },
                        ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Selector<ReviewNotifier, bool>(
              selector: (_, review) => review.buttonsAreDisabled,
              builder: (_, disable, __) => Row(
                children: [
                  LanguageButton(
                    isDisabled: disable,
                    languageType: LanguageType.image,
                  ),
                  LanguageButton(
                    isDisabled: disable,
                    languageType: LanguageType.english,
                  ),
                  LanguageButton(
                    isDisabled: disable,
                    languageType: LanguageType.kadazan,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _insertWords({required List<Word> words}) {
    for (int i = 0; i < words.length; i++) {
      _listKey.currentState?.insertItem(i);
      _reviewWords.insert(i, words[i]);
    }
  }

  _removeWord({required Word word}) async {
    var w = word;
    _listKey.currentState?.removeItem(
        _reviewWords.indexOf(w),
        (context, animation) => WordTile(
            word: w, animation: animation, index: _reviewWords.indexOf(w)));
    _reviewWords.remove(w);
    await DatabaseManager().removeWord(word: w);
    if(_reviewWords.isEmpty){
      Provider.of<ReviewNotifier>(context, listen: false).disabledButtons(disabled: true);
    }
  }

  _clearAllWords() {
    for (int i = 0; i < _reviewWords.length; i++) {
      _listKey.currentState?.removeItem(
          0,
          (context, animation) =>
              WordTile(word: _reviewWords[i], animation: animation, index: i));
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _reviewWords.clear();
      await DatabaseManager().removeAllWords();
      Provider.of<ReviewNotifier>(context, listen: false).disabledButtons(disabled: true);
    });
  }
}
