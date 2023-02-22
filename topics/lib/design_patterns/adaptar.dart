// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostApi1 {
  String getYoutubePosts() {
    return '''
       [
         {
           "title": "Chad ",
           "desc": "Automate"
         },
         {
           "title": "Sigma ",
           "desc": "Clones"
         }
       ]

     ''';
  }
}

class PostApi2 {
  String getMediuPosts() {
    return '''
       [
         {
           "header": "Chad",
           "bio": "Automate on it"
         },
         {
           "header": "Sigma",
           "bio": "Clones on it by the gost"
         }
       ]
        ''';
  }
}

abstract class IPostAPI {
  List<Post> getPosts();
}

class Post {
  final String title;
  final String bio;
  Post({
    required this.title,
    required this.bio,
  });
}

// adapatar pattern

class PostAPIAdapter implements IPostAPI {
  final api = PostApi1();
  @override
  List<Post> getPosts() {
    final data = jsonDecode(api.getYoutubePosts()) as List;
    return data.map((e) => Post(title: e['title'], bio: e['desc'])).toList();
  }
}

class PostAPI2Adapter implements IPostAPI {
  final api = PostApi2();
  @override
  List<Post> getPosts() {
    final data = jsonDecode(api.getMediuPosts()) as List;
    return data.map((e) => Post(title: e['header'], bio: e['bio'])).toList();
  }
}

class PostAPI implements IPostAPI {
  final api1 = PostAPIAdapter();
  final api2 = PostAPI2Adapter();
  @override
  List<Post> getPosts() {
    return api1.getPosts() + api2.getPosts();
  }
}
