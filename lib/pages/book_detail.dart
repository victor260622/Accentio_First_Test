import 'package:flutter/material.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({
    super.key,
    required this.book,
    this.favorite = false,
  });
  final dynamic book;
  final bool favorite;
  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}


class _BookDetailPageState extends State<BookDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book["name"]),
        actions: [
          IconButton(
              color: widget.book["isFavorite"] ? Colors.red : Colors.grey,
              onPressed: () {
                setState(() {
                 widget.book["isFavorite"] = !widget.book["isFavorite"];
                });
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                widget.book["htmlContent"]
                    .replaceAll("<p>", "")
                    .replaceAll("</p>", ""),
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Title:   ${widget.book["name"]}',
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'By:  ${widget.book["authorName"]}',
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Release Date:   ${widget.book["releaseDate"]}',
                textAlign: TextAlign.left,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
