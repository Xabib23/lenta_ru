import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_rss/domain/rss_item.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)?.settings.arguments as RssItem;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'NewsApp',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       model.changeTheme();
        //     },
        //     icon: const Icon(Icons.abc),
        //   ),
        // ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        children: <Widget>[
          SizedBox(height: 16),
          SizedBox(
            height: 174,
            width: 300,
            child: Image.network(
              item.enclosure?.url ?? '',
              fit: BoxFit.cover,
            ),
            // child: CachedNetworkImage(imageUrl: imageUrl),
          ),
          const SizedBox(height: 16),
          Text(
            item.title ?? '',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
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
          SizedBox(height: 32),
          Text(
            item.description ?? '',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
