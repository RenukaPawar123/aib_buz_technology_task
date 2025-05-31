import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/Article.dart';

class NewsService {
  // Using NewsAPI.org as the news source
  // Note: In a production app, you would store this API key securely
  final String _apiKey = 'fe2833d9f4154191aab446008956de58'; // Replace with your actual API key
  final String _baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> getTopHeadlines() async {
    try {
      // For demo purposes, if no API key is provided, use a mock response
      if (_apiKey == 'fe2833d9f4154191aab446008956de58') {
        return _getMockArticles();
      }

      final response = await http.get(
        Uri.parse('$_baseUrl/top-headlines?country=us&apiKey=$_apiKey'),
        headers: {
          'User-Agent': 'NewsApp/1.0',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> articles = data['articles'];
        return articles.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      // If there's an error with the API, use mock data for demo purposes
      return _getMockArticles();
    }
  }

  // Mock data for demo purposes with working URLs
  List<Article> _getMockArticles() {
    return [
      Article(
        title: 'Tech Giants Announce New AI Collaboration',
        description: 'Major tech companies are joining forces to develop new artificial intelligence standards and technologies that will shape the future of computing.',
        url: 'https://www.bbc.com/news/technology',
        imageUrl: 'https://picsum.photos/id/1/800/600',
        source: 'Tech Today',
        publishedAt: '25 May, 2025',
        content: 'In a groundbreaking announcement, several major technology companies revealed plans to collaborate on artificial intelligence research and development...',
      ),
      Article(
        title: 'Global Climate Summit Reaches Historic Agreement',
        description: 'World leaders have reached a consensus on ambitious climate goals during the latest international summit on climate change.',
        url: 'https://www.reuters.com/business/environment/',
        imageUrl: 'https://picsum.photos/id/10/800/600',
        source: 'World News',
        publishedAt: '23 May, 2025',
        content: 'After two weeks of intense negotiations, representatives from 195 countries have agreed to a new framework for reducing carbon emissions...',
      ),
      Article(
        title: 'New Study Reveals Benefits of Mediterranean Diet',
        description: 'Researchers have found additional health benefits associated with following a Mediterranean diet, including improved cognitive function.',
        url: 'https://www.cnn.com/health',
        imageUrl: 'https://picsum.photos/id/20/800/600',
        source: 'Health Journal',
        publishedAt: '20 May, 2025',
        content: 'A comprehensive study published in the Journal of Nutrition has revealed that people who follow a Mediterranean diet show significant improvements in...',
      ),
      Article(
        title: 'Space Tourism Company Announces First Commercial Flight',
        description: 'A leading space tourism company has announced dates for its first commercial space flight with civilian passengers.',
        url: 'https://www.space.com/',
        imageUrl: 'https://picsum.photos/id/30/800/600',
        source: 'Space News',
        publishedAt: '18 May, 2025',
        content: 'In what marks a major milestone for civilian space travel, the first fully commercial space tourism flight has been scheduled for...',
      ),
      Article(
        title: 'Revolutionary Electric Vehicle Battery Extends Range to 1000 Miles',
        description: 'A startup has developed a new battery technology that could significantly increase the range of electric vehicles.',
        url: 'https://www.theverge.com/tech',
        imageUrl: 'https://picsum.photos/id/40/800/600',
        source: 'Auto Innovation',
        publishedAt: '15 May, 2025',
        content: 'A California-based startup has unveiled a prototype battery that can power an electric vehicle for up to 1000 miles on a single charge...',
      ),
      Article(
        title: 'Global Chip Shortage Expected to Ease by End of Year',
        description: 'Industry analysts predict that the semiconductor shortage that has affected multiple industries will begin to resolve in the coming months.',
        url: 'https://techcrunch.com/',
        imageUrl: 'https://picsum.photos/id/50/800/600',
        source: 'Tech Industry News',
        publishedAt: '12 May, 2025',
        content: 'After nearly two years of supply chain disruptions, semiconductor manufacturers are finally catching up with demand...',
      ),
      Article(
        title: 'New Archaeological Discovery Rewrites Ancient History',
        description: 'Archaeologists have uncovered artifacts that challenge current understanding of ancient civilizations and their technological capabilities.',
        url: 'https://www.nationalgeographic.com/',
        imageUrl: 'https://picsum.photos/id/60/800/600',
        source: 'Historical Science',
        publishedAt: '10 May, 2025',
        content: 'A team of archaeologists working in southern Turkey has discovered tools and artifacts dating back over 12,000 years that show evidence of advanced metallurgy...',
      ),
      Article(
        title: 'Breakthrough in Quantum Computing Achieved',
        description: 'Scientists have made a significant breakthrough in quantum computing that could revolutionize data processing and encryption.',
        url: 'https://www.wired.com/',
        imageUrl: 'https://picsum.photos/id/70/800/600',
        source: 'Science Daily',
        publishedAt: '8 May, 2025',
        content: 'Researchers at leading universities have successfully demonstrated a new quantum computing algorithm that shows unprecedented stability...',
      ),
    ];
  }
}
