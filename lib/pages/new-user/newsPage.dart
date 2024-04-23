import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NAYANAKA NEWS'),
      ),
      body: NewsList(),
    );
  }
}

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<dynamic> _articles = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2024-04-22&to=2024-04-22&sortBy=popularity&apiKey=cc6b8f1e9acb4b54a5f799532d900404'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> articles = data['articles'] ?? [];
      setState(() {
        _articles =
            articles.where((article) => article['urlToImage'] != null).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _articles.length,
      itemBuilder: (context, index) {
        final article = _articles[index];
        return ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                article['title'] ?? 'No Title',
                style: const TextStyle(
                  fontWeight:
                      FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              if (article['urlToImage'] != null)
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    article['urlToImage'],
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(
                  height: 4),
              Text(article['description'] ?? 'No Description'),
            ],
          ),
        );
      },
    );
  }
}
