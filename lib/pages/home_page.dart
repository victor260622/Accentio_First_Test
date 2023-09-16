import 'dart:convert';

import 'package:book_widgets/pages/book_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _items = [];

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Book Widgets'),
        ),
        body: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final book = _items[index];
                _items[index]['isFavorite'] = false;
                return 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: GestureDetector(
                        onTap: () => navigateToBook(book),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(book["name"],
                                        style: Theme.of(context).textTheme.titleMedium),
                                    Text(
                                      book["authorName"],
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                    Text(
                                      book["releaseDate"],
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () => navigateToBook(book),
                                  child: const Text('Read Book'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
              },
            ),
          );
  }

  void navigateToBook(book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailPage(book: book),
      ),
    );
  }
  void navigateToFavorites(book) {
    book["isFavorite"] ? book : '';
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailPage(book: book),
      ),
    );
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/books.json');
    final Map<String, dynamic> data = await json.decode(response);
    setState(() {
      _items = data["books"];
    });
  }
}
