import 'package:english_words/english_words.dart';
import 'package:favorite_app_provider_example/provider/favorite_provider.dart';
import 'package:favorite_app_provider_example/screens/favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    final words = nouns.take(50).toList();
    final provider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Apllication"),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
        final word =words[index];
        return ListTile(
          title: Text(word),
          trailing: IconButton(onPressed: () {
            provider.togglefavorite(word);
          }, icon: provider.isExist(word)
          ? const Icon(Icons.favorite, color: Colors.red,) 
          : const Icon(Icons.favorite_border_rounded)
          ),
        ); 
      },),

      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritePage(),),);
      },
      label: const Text("favorites"),
      ),
    );
  }
}
