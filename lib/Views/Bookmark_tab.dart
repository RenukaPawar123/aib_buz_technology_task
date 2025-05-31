import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aibuzz_technoventures_task/Widgits/News_card.dart';
import '../Controller/BookmarkController.dart';

class BookmarksTab extends StatefulWidget {
  const BookmarksTab({Key? key}) : super(key: key);

  @override
  State<BookmarksTab> createState() => _BookmarksTabState();
}

class _BookmarksTabState extends State<BookmarksTab> with AutomaticKeepAliveClientMixin {
  final BookmarkController bookmarkController = Get.find<BookmarkController>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      if (bookmarkController.bookmarkedArticles.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bookmark_border,
                size: 80,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 20),
              const Text(
                'No bookmarks yet',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              const Text(
                'Tap the bookmark icon on any article to save it here',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        );
      } else {
        return ListView.builder(
          itemCount: bookmarkController.bookmarkedArticles.length,
          itemBuilder: (context, index) {
            final article = bookmarkController.bookmarkedArticles[index];
            return NewsCard(
              article: article,
              isBookmarked: true,
            );
          },
        );
      }
    });
  }
}
