import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Model/Article.dart';

class BookmarkController extends GetxController {
  final GetStorage _box = GetStorage();
  RxList<Article> bookmarkedArticles = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadBookmarks();
  }

  void _loadBookmarks() {
    final List<dynamic>? storedBookmarks = _box.read<List>('bookmarks');

    if (storedBookmarks != null) {
      bookmarkedArticles.value = storedBookmarks
          .map((item) => Article.fromJson(Map<String, dynamic>.from(item)))
          .toList();
    }
  }

  void _saveBookmarks() {
    final List<Map<String, dynamic>> bookmarksJson =
    bookmarkedArticles.map((article) => article.toJson()).toList();
    _box.write('bookmarks', bookmarksJson);
  }

  void addBookmark(Article article) {
    if (!isArticleBookmarked(article)) {
      bookmarkedArticles.add(article);
      _saveBookmarks();
      Get.snackbar(
        'Bookmark Added',
        'Article has been added to your bookmarks',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
      );
    }
  }

  void removeBookmark(Article article) {
    bookmarkedArticles.removeWhere((a) => a.url == article.url);
    _saveBookmarks();
    Get.snackbar(
      'Bookmark Removed',
      'Article has been removed from your bookmarks',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  bool isArticleBookmarked(Article article) {
    return bookmarkedArticles.any((a) => a.url == article.url);
  }
}
