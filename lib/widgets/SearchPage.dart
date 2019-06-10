import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(title: Text("Search"),backgroundColor: Colors.white),
//      body: const Markdown(data: _markdownSearchPageData),
//    );
//  }
  Widget appBarTextView = new Text(
    "Search",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController searchView = TextEditingController();
  List<String> searchlist;
  bool isSearching;
  String searchString = "";

  SearchState() {
    searchView.addListener(() {
      if (searchView.text.isEmpty) {
        setState(() {
          isSearching = false;
          searchString = "";
        });
      } else {
        setState(() {
          isSearching = true;
          searchString = searchView.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isSearching = false;
    init();
  }

  void init() {
    searchlist = List();
    searchlist.add("");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: buildBar(context),
      body: new ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: isSearching ? _buildSearchList() : _buildList(),
      ),
    );
  }

  List<Item> _buildList() {
    return searchlist.map((contact) => Item(contact)).toList();
  }

  List<Item> _buildSearchList() {
    if (searchString.isEmpty) {
      return searchlist.map((contact) => Item(contact)).toList();
    } else {
      List<String> searchList = List();
      for (int i = 0; i < searchlist.length; i++) {
        String name = searchlist.elementAt(i);
        if (name.toLowerCase().contains(searchString.toLowerCase())) {
          searchList.add(name);
        }
      }
      return searchList.map((contact) => Item(contact)).toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        title: appBarTextView,
        actions: <Widget>[
          new IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.appBarTextView = TextField(
                    controller: searchView,
                    autofocus: true,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.white)),
                  );
                  searchStart();
                } else {
                  searchEnd();
                }
              });
            },
          ),
        ]);
  }

  void searchStart() {
    setState(() {
      isSearching = true;
    });
  }

  void searchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTextView = Text(
        "SearchView",
        style: TextStyle(color: Colors.white),
      );
      isSearching = false;
      searchView.clear();
    });
  }

  //  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(SearchPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}

class Item extends StatelessWidget {
  final String name;

  Item(this.name);

  @override
  Widget build(BuildContext context) {
    return new ListTile(title: Text(this.name));
  }
}