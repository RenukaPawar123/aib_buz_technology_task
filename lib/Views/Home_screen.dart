import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aibuzz_technoventures_task/Views/News_tab.dart';
import 'package:aibuzz_technoventures_task/Views/login_screen.dart';

import '../Controller/Auth_controller.dart';
import '../Controller/NewsController.dart';
import '../Controller/ThemeController.dart';
import 'Bookmark_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AuthController authController = Get.find<AuthController>();
  final ThemeController themeController = Get.find<ThemeController>();
  final NewsController newsController = Get.find<NewsController>();
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _logout() {
    authController.logout();
    Get.offAll(() => const LoginScreen());
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        newsController.searchNews('');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search news...',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            newsController.searchNews(value);
          },
        )
            : const Text('News App'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
          IconButton(
            icon: Obx(() => Icon(
              themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
            )),
            onPressed: () => themeController.toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.newspaper),
              text: 'News',
            ),
            Tab(
              icon: Icon(Icons.bookmark),
              text: 'Bookmarks',
            ),
          ],
          labelColor: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.blue,
          unselectedLabelColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey : Colors.grey,
          indicatorColor: Theme.of(context).primaryColor,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          NewsTab(),
          BookmarksTab(),
        ],
      ),
    );
  }
}
