import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({super.key});


  @override
  State<AddToDo> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddToDo> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(),
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select date'),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text("New task"),
      automaticallyImplyLeading: false,
      actions: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Ionicons.exit_outline, color: Colors.black),
        ),
    ]
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArticleTitleAndDate(),
        ],
      ),
    );
  }

  Widget _buildArticleTitleAndDate() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ],
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  // void _onFloatingActionButtonPressed(BuildContext context) {
  //   BlocProvider.of<LocalArticleBloc>(context).add(SaveArticle(article!));
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       backgroundColor: Colors.black,
  //       content: Text('Article saved successfully.'),
  //     ),
  //   );
  // }

}
