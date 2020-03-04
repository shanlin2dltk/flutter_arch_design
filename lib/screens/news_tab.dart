import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_design/blocs/blocs.dart';
import 'package:platform_design/components/widgets.dart';

class NewsTab extends StatelessWidget {
  static const title = 'News';
  static const androidIcon = Icon(Icons.library_books);
  static const iosIcon = Icon(CupertinoIcons.news);

  static const _itemsLength = 20;

  Widget _listBuilder(BuildContext context, int index) {
    if (index >= _itemsLength) return null;

    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is SuccessfulNewsState)  {
          return SafeArea(
            top: false,
            bottom: false,
            child: Card(
              elevation: 1.5,
              margin: EdgeInsets.fromLTRB(6, 12, 6, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: InkWell(
                // Make it splash on Android. It would happen automatically if this
                // was a real card but this is just a demo. Skip the splash on iOS.
                onTap: defaultTargetPlatform == TargetPlatform.iOS ? null : () {},
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: state.items[index].color,
                        child: Text(
                          state.items[index].title.substring(0, 1),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 16)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.items[index].title,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Text(
                              state.items[index].content,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } // successfulNewsState
        else {
          return Center(
            child: Text('failed to fetch news'),
          );
        }
      },
    );
  } // common to platforms

  // ===========================================================================
  // Non-shared code below because this tab uses different scaffolds.
  // ===========================================================================

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(NewsTab.title),
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView.builder(
          itemBuilder: _listBuilder,
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: Container(
        color: Colors.grey[100],
        child: ListView.builder(
          itemBuilder: _listBuilder,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
