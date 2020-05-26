import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}
class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    RandomWordsState();
  }

}
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) { //AH ENTENDI ISSO É UMA FUNÇÃO QUE RETORNA UM TIPO WIDGET GENIAL D++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++O>
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
  // TODO Add build() method
}