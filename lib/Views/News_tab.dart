import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aibuzz_technoventures_task/Widgits/News_card.dart';

import '../Controller/NewsController.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({Key? key}) : super(key: key);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> with AutomaticKeepAliveClientMixin {
  final NewsController newsController = Get.find<NewsController>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Obx(() {
      if (newsController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (newsController.error.value.isNotEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Error: ${newsController.error.value}',
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => newsController.fetchNews(),
                child: const Text('Try Again'),
              ),
            ],
          ),
        );
      } else if (newsController.filteredArticles.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No articles found'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => newsController.fetchNews(),
                child: const Text('Refresh'),
              ),
            ],
          ),
        );
      } else {
        return RefreshIndicator(
          onRefresh: () => newsController.fetchNews(),
          child: ListView.builder(
            itemCount: newsController.filteredArticles.length,
            itemBuilder: (context, index) {
              final article = newsController.filteredArticles[index];
              return NewsCard(article: article);
            },
          ),
        );
      }
    });
  }
}
