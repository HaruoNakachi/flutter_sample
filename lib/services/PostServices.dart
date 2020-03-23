import 'package:flutterapp/src/common/GraphQLConfiguration.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PostService {
  static Future<QueryResult> getAll() async {
    final QueryOptions _options = QueryOptions(documentNode: gql(r'''
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
                '''));
    var result = await clientGraphQL().query(_options);
    return result;
  }

  static Future<QueryResult> getDetail(id) async {
    final QueryOptions _options = QueryOptions(
      documentNode: gql(r'''
                  query getPostModel($id: ID!)  {
                    getPostModel(id: $id) {
                      id
                      title
                      description
                      image
                    }
                  }
                '''),
      variables: {'id': id},
    );
    var result = await clientGraphQL().query(_options);
    return result;
  }

  static Future<QueryResult> remove(id) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(r'''
                  mutation deletePostModel($deletemodelinput: DeletePostModelInput!) {
                    deletePostModel(input: $deletemodelinput) {
                      id
                    }
                  }
                '''),
      variables: {
        "deletemodelinput": {"id": id}
      },
    );
    var result = await clientGraphQL().mutate(_options);
    return result;
  }

 static Future<QueryResult> add(_title,_description,base64Image) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(r'''
                          mutation createPostModel($createpostmodelinput: CreatePostModelInput!) {
                            createPostModel(input: $createpostmodelinput) {
                              id
                              title
                              description
                              image
                            }
                          }
                        '''),
      variables: {
        "createpostmodelinput": {
          "title": _title,
          "description": _description,
          "image": base64Image
        }
      },
    );
    var result = await clientGraphQL().mutate(_options);
    return result;
  }

  static Future<QueryResult> update(_id,_title,_description,base64Image) async {
    final MutationOptions _options = MutationOptions(
      documentNode: gql(r'''
                          mutation updatePostModel($updatepostmodelinput: UpdatePostModelInput!) {
                            updatePostModel(input: $updatepostmodelinput) {
                              id
                              title
                              description
                              image
                            }
                          }
                        '''),
      variables: {
        "updatepostmodelinput": {
          "id": _id,
          "title": _title,
          "description": _description,
          "image": base64Image
        }
      },
    );
    var result = await clientGraphQL().mutate(_options);
    return result;
  }


}
