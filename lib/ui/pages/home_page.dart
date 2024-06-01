import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/domain/providers/app_provider.dart';
import 'package:news_app/domain/router/routes.dart';
import 'package:news_app/ui/loaders/loaders.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppProvider>(context);
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
      ),
      body: FutureBuilder(
        future: model.setUp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePageContent(
              allNews: snapshot.data,
            );
          } else {
            return Loaders.homePageLoader;
          }
        },
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final RssFeed? allNews;

  const HomePageContent({super.key, required this.allNews});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        HomePageHeader(allNews: allNews),
        HomePageAllNews(allNews: allNews),
      ],
    );
  }
}

class HomePageHeader extends StatelessWidget {
  final RssFeed? allNews;

  const HomePageHeader({super.key, required this.allNews});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Последние новости',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          HomePageSlider(
            allNews: allNews,
          ),
        ],
      ),
    );
  }
}

class HomePageSlider extends StatelessWidget {
  final RssFeed? allNews;

  const HomePageSlider({super.key, required this.allNews});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: allNews?.items.length,
      itemBuilder: (context, index, realIndex) => HomePageSliderItem(
        allNews: allNews?.items[index],
      ),
      options: CarouselOptions(
        initialPage: 0,
        animateToClosest: true,
        enableInfiniteScroll: false,
        padEnds: false,
        height: 300,
      ),
    );
  }
}

class HomePageAllNews extends StatelessWidget {
  final RssFeed? allNews;

  const HomePageAllNews({super.key, required this.allNews});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: allNews?.items.length ?? 0,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => HomePageAllNewsItem(
        allNews: allNews?.items[index],
      ),
    );
  }
}

class HomePageAllNewsItem extends StatelessWidget {
  final RssItem? allNews;

  const HomePageAllNewsItem({super.key, required this.allNews});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRoutes.detailPage, arguments: allNews);
      },
      contentPadding: const EdgeInsets.all(8),
      leading: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: SizedBox(
          height: 60,
          width: 150,
          child: CachedNetworkImage(
            imageUrl: allNews?.enclosure?.url ?? '',
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        allNews?.title ?? '',
        maxLines: 2,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class HomePageSliderItem extends StatelessWidget {
  final RssItem? allNews;

  const HomePageSliderItem({
    super.key,
    required this.allNews,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRoutes.detailPage, arguments: allNews);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            SizedBox(
              height: 208,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: allNews?.enclosure?.url ?? '',
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                allNews?.title ?? '',
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(width: 16),
                const Icon(
                  Icons.edit,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  allNews?.author ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                    color: Color(0xffaeaeae),
                  ),
                ),
                const Spacer(),
                Text(
                  allNews?.pubDate ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 9,
                    color: Color(0xffff9900),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
