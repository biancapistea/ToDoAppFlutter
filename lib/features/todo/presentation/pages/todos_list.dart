//
//
//
// class SavedArticles extends HookWidget {
//   const SavedArticles({Key ? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => sl<LocalArticleBloc>()..add(const GetSavedArticles()),
//       child: Scaffold(
//         appBar: _buildAppBar(),
//         body: _buildBody(),
//       ),
//     );
//   }
//
//   PreferredSizeWidget _buildAppBar() {
//     return AppBar(
//       leading: Builder(
//         builder: (context) => GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onTap: () => _onBackButtonTapped(context),
//           child: const Icon(Ionicons.chevron_back, color: Colors.black),
//         ),
//       ),
//       title: const Text('Saved Articles', style: TextStyle(color: Colors.black)),
//     );
//   }
//
//   Widget _buildBody() {
//     return BlocBuilder<LocalArticleBloc, LocalArticlesState>(
//       builder: (context, state) {
//         if (state is LocalArticlesLoading) {
//           return const Center(child: CupertinoActivityIndicator());
//         } else if (state is LocalArticlesDone) {
//           return _buildArticlesList(state.articles!);
//         }
//         return Container();
//       },
//     );
//   }
//
//   Widget _buildArticlesList(List<ArticleEntity> articles) {
//     if (articles.isEmpty) {
//       return const Center(
//           child: Text(
//             'NO SAVED ARTICLES',
//             style: TextStyle(color: Colors.black),
//           ));
//     }
//
//     return ListView.builder(
//       itemCount: articles.length,
//       itemBuilder: (context, index) {
//         return ArticleWidget(
//           article: articles[index],
//           isRemovable: true,
//           onRemove: (article) => _onRemoveArticle(context, article),
//           onArticlePressed: (article) => _onArticlePressed(context, article),
//         );
//       },
//     );
//   }
//
//   void _onBackButtonTapped(BuildContext context) {
//     Navigator.pop(context);
//   }
//
//   void _onRemoveArticle(BuildContext context, ArticleEntity article) {
//     BlocProvider.of<LocalArticleBloc>(context).add(DeleteArticle(article));
//   }
//
//   void _onArticlePressed(BuildContext context, ArticleEntity article) {
//     Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
//   }
// }