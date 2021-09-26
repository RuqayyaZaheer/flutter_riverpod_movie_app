import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/search_categoty.dart';

class MianScreen extends ConsumerWidget {
  double? _deviceHeight;
  double? _deviceWidth;
  TextEditingController? _searchTextFieldController;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [_backgroundWidget(), _foregroundWidget()],
        ),
      ),
    );
  }

  Widget _backgroundWidget() {
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://www.themoviedb.org/t/p/w1280/xKnUNWFsAOaKIviIYBLei02Bauu.jpg"),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ),
    );
  }

  Widget _foregroundWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, _deviceHeight! * 0.02, 0, 0),
      width: _deviceHeight! * 0.89,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_topBarWidget()],
      ),
    );
  }

  Widget _topBarWidget() {
    return Container(
      height: _deviceHeight! * 0.09,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _sertchFieldWidget(),
          _categorySelectionWidget(),
        ],
      ),
    );
  }

  Widget _sertchFieldWidget() {
    final _border = InputBorder.none;
    return Container(
      width: _deviceWidth! * 0.50,
      height: _deviceHeight! * 0.05,
      child: TextField(
        controller: _searchTextFieldController,
        onSubmitted: (_input) {},
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            focusedBorder: _border,
            border: _border,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white24,
            ),
            hintStyle: TextStyle(
              color: Colors.white54,
            ),
            filled: false,
            fillColor: Colors.white24,
            hintText: 'Search.....'),
      ),
    );
  }

  Widget _categorySelectionWidget() {
    return DropdownButton(
      dropdownColor: Colors.black38,
      value: SearchCategory.populer,
      icon: Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (_value) {},
      items: [
        DropdownMenuItem(
          child: Text(
            SearchCategory.populer!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          value: SearchCategory.populer!,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.upComing!,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.upComing!,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.none!,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.none!,
        ),
      ],
    );
  }
}
