import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_app/entities/photo.dart';
import 'package:test_app/entities/post.dart';
import 'package:test_app/entities/user.dart';

part 'networking.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET("/posts")
  Future<List<Post>> getPosts();

  @GET("/users/{id}")
  Future<User> getUser(@Path() int id);

  @GET("/photos")
  Future<List<Photo>> getPhotos();
}

class Networking {
  static final Networking instance = Networking._();
  late Api api;

  Networking._() {
    api = Api(Dio());
  }
}
