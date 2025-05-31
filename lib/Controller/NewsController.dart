import 'package:get/get.dart';
import '../Model/Article.dart';
import '../Services/News_services.dart';

class NewsController extends GetxController {
  final NewsService _newsService = NewsService();
  RxList<Article> articles = <Article>[].obs;
  RxList<Article> filteredArticles = <Article>[].obs;
  RxBool isLoading = false.obs;
  RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    isLoading.value = true;
    error.value = '';

    try {
      final fetchedArticles = await _newsService.getTopHeadlines();
      articles.value = fetchedArticles;
      filteredArticles.value = fetchedArticles;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void searchNews(String query) {
    if (query.isEmpty) {
      filteredArticles.value = articles;
    } else {
      filteredArticles.value = articles.where((article) {
        return article.title.toLowerCase().contains(query.toLowerCase()) ||
            article.description.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }
}
