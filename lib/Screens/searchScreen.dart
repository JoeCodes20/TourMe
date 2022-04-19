import 'package:flutter/material.dart';
import 'package:algolia/algolia.dart';
import 'package:tourme/extraTools/algoInit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  Algolia? algolia;
  String _searchText = "";
  List _hitsList = [];

  Future<void> _getSearchResult(String query) async {
    AlgoliaQuery search = algolia!.instance.index("usernames").query(query);
    AlgoliaQuerySnapshot snap = await search.getObjects();
    print(snap.hits);
    setState(() {
      _hitsList = snap.hits;
    });
  }

  @override
  void initState() {
    super.initState();
    algolia = Application.algolia;
    _searchController.addListener(() {
      if (_searchText != _searchController.text) {
        setState(() {
          _searchText = _searchController.text;
        });
        _getSearchResult(_searchText);
      }
    });
    _getSearchResult('');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 50,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Positioned(
                  top: 5,
                  left: 5,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      // print("test");
                    },
                    child: Image.asset(
                      "images/backIcon.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SizedBox(
                              width: 60,
                              height: 60,
                              child: ClipOval(
                                child: Image.asset(
                                  "images/maleAvatar.png",
                                ),
                              )))),
                )
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1)),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search username or genre",
                  suffixIcon: _searchText.isEmpty
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                            });
                          },
                          icon: Icon(Icons.clear))
                      : null,
                  prefixIcon: Icon(Icons.search)),
            ),
          )
        ],
      )),
    );
  }
}
