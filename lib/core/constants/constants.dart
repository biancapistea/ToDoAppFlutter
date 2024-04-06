// const String newsApiBaseUrl = 'https://newsapi.org/v2';
// const String apiKey = '5dd2a2f5d77c4e5a937a76c778546695';
// const String countryQuery = 'us';
// const String categoryQuery = 'general';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}