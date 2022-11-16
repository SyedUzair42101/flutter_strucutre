import 'package:flutter/material.dart';
import 'package:practice/screens/homescreen/widgets/posts_list.dart';
import 'package:practice/screens/homescreen/widgets/stories_avatar.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  //widget for appbar
  _buildAppbar() {
    return AppBar(
      leading: Icon(Icons.camera_alt),
      title: Text('Instagram'),
      centerTitle: true,
      actions: [
        Icon(Icons.send),
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            //stories
            _buildStories(),
            //posts
            _buildPosts(),
          ],
        ),
      ),
    );
  }

  _buildStories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //stories heading
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Stories"),
            Text("Watch All"),
          ],
        ),
        //stories avatar
        SizedBox(height: 80, child: StoriesAvatar()),
      ],
    );
  }

  _buildPosts() {
    return PostList();
  }
}







// class InstaHomepage extends StatefulWidget {
//   const InstaHomepage({Key? key}) : super(key: key);

//   @override
//   State<InstaHomepage> createState() => _InstaHomepageState();
// }

// class _InstaHomepageState extends State<InstaHomepage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppbar(),
//       body: _buildBody(),
//     );
//   }



//   _buildBody() {
//     return Container(
//       child: Column(
//         children: [
//           //stories
//           _buildStories(),
//           //posts
//           _buildPosts(),
//         ],
//       ),
//     );
//   }

//   _buildStories() {
//     return Column(
//       children: [
//         //stories heading
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("Stories"),
//             Text("Watch All"),
//           ],
//         ),
//         //stories avatar
//       ],
//     );
//   }

//   _buildPosts() {}
// }
