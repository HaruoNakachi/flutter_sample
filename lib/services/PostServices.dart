import 'package:flutterapp/model/PostModel.dart';
import 'package:flutterapp/src/common/global.dart';
import "package:gql_exec/gql_exec.dart";
import "package:gql/language.dart";
import 'package:gql_http_link/gql_http_link.dart';

class PostService {
  static var link = HttpLink(
    AWS_APP_SYNC_ENDPOINT,
    defaultHeaders: {"x-api-key": AWS_APP_SYNC_KEY},
  );
  static Stream<Response> getAll() {
    var result = link.request(
      Request(
          operation: Operation(
        document: parseString(r'''
                   query listPostModels {
        listPostModels {
          items {
            id
            title
            description
            image
          }
        }
      }
                '''),
      )),
    );

    return result;
  }

  static Stream<Response> getDetail(id) {
    var result = link.request(
      Request(
        operation: Operation(
          document: parseString(r'''
                       query getPostModel($id: ID!)  {
                    getPostModel(id: $id) {
                      id
                      title
                      description
                      image
                    }
                  }
                '''),
        ),
        variables: <String, dynamic>{"id": id},
      ),
    );
    return result;
  }

  static Stream<Response> remove(id) {
    var result = link.request(
      Request(
        operation: Operation(
          document: parseString(r'''
                       mutation deletePostModel($deletemodelinput: DeletePostModelInput!) {
                    deletePostModel(input: $deletemodelinput) {
                      id
                    }
                  }
                '''),
        ),
        variables: {
          "deletemodelinput": {"id": id}
        },
      ),
    );
    return result;
  }

  static Stream<Response> add(PostModel data) {
    var result = link.request(
      Request(
        operation: Operation(
          document: parseString(r'''
                        mutation createPostModel($createpostmodelinput: CreatePostModelInput!) {
                            createPostModel(input: $createpostmodelinput) {
                              id
                              title
                              description
                              image
                            }
                          }
                '''),
        ),
        variables: {
          "createpostmodelinput": { 
            "title": data.title,
            "description": data.description,
            "image": data.image
          }
        },
      ),
    );
    return result;
  }

  static Stream<Response> update(PostModel data) {
    var result = link.request(
      Request(
        operation: Operation(
          document: parseString(r'''
                        mutation updatePostModel($updatepostmodelinput: UpdatePostModelInput!) {
                            updatePostModel(input: $updatepostmodelinput) {
                              id
                              title
                              description
                              image
                            }
                          }
                '''),
        ),
        variables: {
          "updatepostmodelinput": {
            "id": data.id,
            "title": data.title,
            "description": data.description,
            "image": data.image
          }
        },
      ),
    );

    return result;
  }
}
