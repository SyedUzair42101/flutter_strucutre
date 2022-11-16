import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPostAvatar(),
        _buildPostAvatar(),
      ],
    );
  }

  _buildPostAvatar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__340.jpg'),
                    radius: 20,
                  ),
                  Text("Usman"),
                ],
              ),
              Spacer(),
              Icon(Icons.more_horiz),
            ],
          ),
          Image.network(
            'https://images.unsplash.com/photo-1615789591457-74a63395c990?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwY2F0fGVufDB8fDB8fA%3D%3D&w=1000&q=80',
            fit: BoxFit.fill,
            height: 300,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Icon(Icons.favorite_border),
                Icon(Icons.chat_bubble_outline),
                Icon(Icons.send),
                Spacer(),
                Icon(Icons.bookmark_border),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
