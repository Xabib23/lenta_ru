import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../domain/api/api.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RssItem item = ModalRoute.of(context)?.settings.arguments as RssItem;


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          item.categories.first.value ?? '',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Container(
                height: 300,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: CachedNetworkImage(
                  imageUrl: item.enclosure?.url ?? '',
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.title ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.edit,
                    size: 20,
                  ),
                  Text(
                    item.author ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Color(0xffaeaeae),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    item.pubDate ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                      color: Color(0xffff9900),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
