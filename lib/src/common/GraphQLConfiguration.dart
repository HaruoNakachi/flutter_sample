import 'package:flutter/cupertino.dart';
import 'package:flutterapp/src/common/global.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Map<String, String> headers;

final HttpLink httpLink = HttpLink(
    uri: AWS_APP_SYNC_ENDPOINT, headers: {"x-api-key": AWS_APP_SYNC_KEY});
ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: httpLink,
  ),
);

GraphQLClient clientGraphQL() {
  return GraphQLClient(
    cache: OptimisticCache(
      dataIdFromObject: typenameDataIdFromObject,
    ),
    link: httpLink,
  );
}
