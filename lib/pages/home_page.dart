import 'package:flutter/material.dart';
import 'package:netdemo/model/post_model.dart';
import 'package:netdemo/service/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String data = "";
  
  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {

      _showResponse(response!),
    });
  }

  void _apiIdPost(Post post){
    Network.GET(Network.API_employee+post.id.toString(), Network.paramsCreate(post)).then((response) => {

      _showResponse(response!),
    });
  }

  void _apiCreatePost(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {

      _showResponse(response!),
    });
  }

  void _apiUpdatePost(Post post){
    Network.PUT(Network.API_UPDATE+post.id.toString(), Network.paramsCreate(post)).then((response) => {

      _showResponse(response!),
    });
  }

  void _apiDeletePost(Post post){
    Network.DEL(Network.API_DELETE+post.id.toString(), Network.paramsEmpty()).then((response) => {

      _showResponse(response!),
    });
  }

  void _showResponse(String response){
    setState(() {
      data = response;
    });
  }

  @override
  void initState(){
    super.initState();
    var post = Post(id: 2, name: "pdp", salary: "online", age: 22);
    _apiDeletePost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "NetDemo"),
      ),
    );
  }
}
