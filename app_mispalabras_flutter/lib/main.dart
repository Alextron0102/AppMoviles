import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //final wordPair = WordPair.random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to Flutter', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final List<WordPair> suggestions = <WordPair>[];
  final TextStyle biggerFont = TextStyle(fontSize: 24);
  final Set<WordPair> saved = Set<WordPair>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name Generator'),
      ),
      body: buildSuggestions(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));
        },
      ),

    );
  }

  Widget buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2; //Para hallar el %2 (modulo 2)
          if (index >= suggestions.length) {
            suggestions.addAll(generateWordPairs().take(10));
          }
          return buildrow(suggestions[index]);
        });
  }

  Widget buildrow(WordPair pair) {
    final bool alreadysaved = saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        //pair.asPascalCase,
        style: biggerFont,
      ),
      trailing: Icon(alreadysaved ? Icons.favorite : Icons.favorite_border,
          color: alreadysaved ? Colors.red[300] : null),
      onTap: () {
        setState(() {
          alreadysaved ? saved.remove(pair) : saved.add(pair);
        });
      },
    );
  }
}
