import 'package:favorite_app_provider_example/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
        final provider = Provider.of<FavoriteProvider>(context);
        final words = provider.words;

    return Scaffold(
      appBar: AppBar(
        title: const Text("my favorite words",),
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
          ? Icon(Icons.favorite, color: Colors.red,) 
          : Icon(Icons.favorite_border_rounded)
          ),
        ); 
      },),
    );
  }
}