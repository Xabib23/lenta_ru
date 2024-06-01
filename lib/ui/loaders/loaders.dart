import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

abstract final class Loaders {
  static final Widget homePageLoader = Column(
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
      CarouselSlider.builder(
        itemCount: 10,
        itemBuilder: (context, index, realIndex) => Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade100,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Text(
                    'Загрузка',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    SizedBox(width: 16),
                    Icon(
                      Icons.edit,
                      size: 18,
                    ),
                    Text(
                      'Загрузка',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 9,
                        color: Color(0xffaeaeae),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Загрузка',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 9,
                        color: Color(0xffff9900),
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
        options: CarouselOptions(
          initialPage: 0,
          animateToClosest: true,
          enableInfiniteScroll: false,
          padEnds: false,
          height: 290,
        ),
      ),
      const SizedBox(height: 70),
      ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey.shade100,
            child: const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: SizedBox(
                height: 60,
                width: 150,
                child: SizedBox(
                  height: 70,
                  width: 120,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: double.infinity,
                  height: 15,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              const SizedBox(height: 8),
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: double.infinity,
                  height: 15,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

class ListViewShimmerItem extends StatelessWidget {
  const ListViewShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade100,
          child: const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: SizedBox(
              height: 60,
              width: 150,
              child: SizedBox(
                height: 70,
                width: 120,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 200,
                height: 15,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            SizedBox(height: 8),
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 200,
                height: 15,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}
