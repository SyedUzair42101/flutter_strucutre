import 'package:flutter/material.dart';

class StoriesAvatar extends StatelessWidget {
  const StoriesAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _storyavatar("usman",
            'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__340.jpg'),
        _storyavatar("ali",
            'https://images.unsplash.com/photo-1615789591457-74a63395c990?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwY2F0fGVufDB8fDB8fA%3D%3D&w=1000&q=80'),
        _storyavatar("raza",
            'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__340.jpg'),
        _storyavatar("anjum",
            'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__340.jpg'),
        _storyavatar("saad",
            'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__340.jpg'),
        _storyavatar("fartash",
            'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__340.jpg'),
        _storyavatar("talha",
            'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__340.jpg'),
        _storyavatar("sajid",
            'https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__340.jpg'),
      ],
    );
  }

  _storyavatar(
    String name,
    String image,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 30,
          ),
          Text(name),
        ],
      ),
    );
  }
}
