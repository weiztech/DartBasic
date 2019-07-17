import 'dart:io' show exit, File;

import 'package:graphql/client.dart';

const String events = r'''
  query getEvents($incomingAuction: Boolean, $userId: ObjectIdField){
      events(incomingAuction: $incomingAuction, userId: $userId){
        id
        user
        name
        coins
        type
        state
        category
        startPrice
        products
        totalPrice
        startAt
        endAt
        created
        ttlProducts
      } 
    }
''';

const String userId = ""; // "5b2e05305542657f9dc69b8e1";
const bool incomingAuction = true;

final QueryOptions options = QueryOptions(
  document: events,
  variables: <String, dynamic>{
    'userId': userId,
    'incomingAuction': incomingAuction
  }
);

const String mutateAddProduct = r'''
mutation createProduct(
  $img1: ImageField!,
  $name: String!){
    addProduct(data: {
      name: $name,
      description: "This is the description",
      price: 43000000,
      qty: 5,
      weight: 18,
      category: "fashion_man",
      img1: $img1
    }){
        name
        description
        price
        qty
        weight
        img1
        id
        slug
        created
        updated
        user
        status
        category {
          name
          slug
          img
          imgpv
        } 
        img2
        img3
        img4
        img5
        va {
          au
          status
          msg
          ct
        }
    }
}
''';

final MutationOptions moptions = MutationOptions(
  document: mutateAddProduct,
  variables: <String, dynamic>{
    "name": "Macbook Pro 15 Inc 2019 1TB",
    "img1": File("/home/jensen/Downloads/macbookPro2.jpg")
  },
);

final String localhost = "http://localhost:8000/graphql";
final String starWarsHost = "https://swapi.graph.cool/";

void main() async {
  final HttpLink _httpLink = HttpLink(
    uri: localhost,
    headers: {"X-API-KEY": "APIv1"}
  );
  print(_httpLink);
  final AuthLink _authLink = AuthLink(
      getToken: () async => 'Token 75ad9a0613ed4fa2a2b98412b695323c',
      );
  print(_authLink);
  final Link _link = _authLink.concat(_httpLink as Link);
  print(_link.request);
  final GraphQLClient _client = GraphQLClient(
    cache: InMemoryCache(),
    link: _link,
  );

  final QueryResult query_result = await _client.query(options);
  print("Query Has Error ${query_result.hasErrors}");
  if (query_result.hasErrors) {
    print("Query ERROR ${query_result.errors[0].raw["message"]}");
  }
  print("Query DATA ${query_result.data}");

  final QueryResult mutate_result = await _client.mutate(moptions);
  print("Mutate Has Error ${mutate_result.hasErrors}");
  if (mutate_result.hasErrors) {
    print("Mutate ERROR ${mutate_result.errors[0].raw["message"]}");
  }
  print("Mutate DATA ${mutate_result.data}");
  exit(0);
}
