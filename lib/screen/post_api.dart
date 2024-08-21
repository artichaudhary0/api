import 'package:api/api/api_services.dart';
import 'package:flutter/material.dart';

class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  final ApiServices apiServices = ApiServices();

  // Future<List<dynamic>>? posts; // get data
  Future<List<dynamic>>? photos; // get data
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // posts = apiServices.postData();
    photos = apiServices.getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Caling"),
        centerTitle: true,
      ),
      // body: FutureBuilder<List<dynamic>>(
      //   future: posts,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(
      //         child: Text("Error"),
      //       );
      //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      //       return Center(
      //         child: Text("Np post fount"),
      //       );
      //     } else {
      //       return ListView.separated(
      //           itemCount: snapshot.data!.length,
      //           itemBuilder: (context, index) {
      //             final post = snapshot.data![index];
      //
      //             return ListTile(
      //               leading: Text(post['id'].toString()),
      //               title: Text(post['title']),
      //               subtitle: Text(post['body']),
      //             );
      //           }, separatorBuilder: (BuildContext context, int index) {
      //
      //             return Divider();
      //       },);
      //     }
      //   },
      // ),
      body: FutureBuilder<List<dynamic>>(
        future: photos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text("Np post fount"),
            );
          } else {
            return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final photo = snapshot.data![index];

                  return ListTile(
                    leading: CircleAvatar(backgroundImage:  NetworkImage(photo["url"]),),
                    title: Text(photo['title']),
                    trailing: CircleAvatar(backgroundImage:  NetworkImage(photo["thumbnailUrl"]),),
                    // subtitle: Text(photo['body']),
                  );
                }, separatorBuilder: (BuildContext context, int index) {

                  return Divider();
            },);
          }
        },
      ),
    );
  }
}
