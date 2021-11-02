class Post {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;

  Post({
    this.authorName,
    this.authorImageUrl,
    this.timeAgo,
    this.imageUrl,
  });
}

//{"_id":"615ba175b3d4ff1e1c4c2a7d","title":"test","description":"","picture-uri":"","likes":0,"__v":0}

final List<Post> posts = [
  Post(
    authorName: 'Sam Martin',
    authorImageUrl:
        '/data/user/0/com.example.test/cache/image_picker6576687268720922497.jpg',
    timeAgo: '5 min',
    imageUrl: 'assets/images/post0.jpg',
  ),
  Post(
    authorName: 'Sam Martin',
    authorImageUrl:
        '/data/user/0/com.example.test/cache/image_picker6576687268720922497.jpg',
    timeAgo: '10 min',
    imageUrl: 'assets/images/post1.jpg',
  ),
];

final List<String> stories = [
  'assets/images/user1.png',
  'assets/images/user2.png',
  'assets/images/user3.png',
  'assets/images/user4.png',
  'assets/images/user0.png',
  'assets/images/user1.png',
  'assets/images/user2.png',
  'assets/images/user3.png',
];
