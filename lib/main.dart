import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
//import 'package:english_words/src/word_pair.dart';
import 'package:zerohunger/pages/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(
      home: HomePage(), //RandomWords(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text('startup name Generator'),
        actions: [
          IconButton(onPressed: _pushSaved, icon: Icon(Icons.list)),
        ],
      ),
      
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        final tiles = _saved.map((WordPair pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        });
        final divided = tiles.isNotEmpty
            ? ListTile.divideTiles(tiles: tiles, context: context).toList()
            : <Widget>[];
        return Scaffold(
          appBar: AppBar(
            title: Text("Save suggestions"),
          ),
          body: ListView(
            children: divided,
          ),
        );
      },
    ));
  }

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _saved = <WordPair>{};

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(200.0),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }
        final int index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadysaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadysaved ? Icons.favorite : Icons.favorite_border,
        color: alreadysaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadysaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message"),
      ),
      body: SingleChildScrollView(
        child: Center(child: Text("Hello"),),
        )
    );
  }

  // Widget _textform() {
  //   return TextFormField(
  //     controller: _controller,
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(),
  //       hintText: 'Enter a search term 1',
  //     ),
  //     onFieldSubmitted: (String value) async {
  //       await showDialog<void>(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return _chatList(value);
  //           });
  //     },
  //   );
  // }

  // Widget _chatList(String value) {
  //   return ListView.builder(
  //     itemBuilder:

  //   )
  // }
}


// Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: <Widget>[
//           TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'Enter a search term 1',
//             ),
//           ),
//           TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'Enter a search term 2',
//             ),
//           ),
//         ]);
// 
