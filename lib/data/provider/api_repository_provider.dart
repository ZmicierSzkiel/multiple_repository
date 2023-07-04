import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:multiple_repository/data/models/repository_model.dart';

import 'package:multiple_repository/domain/entities/search_entity.dart';

class ApiRepositoryProvider {
  final String authToken =
      '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';

  Future<List<RepositoryMapper>> getAllRepositoriesfromApi() async {
    try {
      List<http.Response> responses = await Future.wait(
        [
          http.get(
            Uri.https(
              'api.github.com',
              'repositories',
              {
                'per_page': '100',
              },
            ),
            headers: {
              'Authorization': 'Bearer $authToken',
            },
          ),
          http.get(
            Uri.https(
              'api.bitbucket.org',
              '/2.0/repositories',
              {
                'fields': 'values.name,values.owner,values.description',
                'pagelen': '10',
              },
            ),
          ),
        ],
      );

      List<dynamic> githubRepositoryData = json.decode(responses[0].body);

      Map<String, dynamic> bitBucketRepositoryMap =
          json.decode(responses[1].body);
      List<dynamic> bitBucketRepositoryData =
          bitBucketRepositoryMap['values'].toList();

      return [
        ...githubRepositoryData.map(
          (json) => RepositoryMapper.fromJson(json, source: 'GitHub'),
        ),
        ...bitBucketRepositoryData.map(
          (json) => RepositoryMapper.fromJson(json, source: 'BitBucket'),
        ),
      ];
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<RepositoryMapper>> sortRepositoriesFromApi(
    String selectedOption,
  ) async {
    final List<RepositoryMapper> repositories =
        await getAllRepositoriesfromApi();

    switch (selectedOption) {
      case 'Github first':
        repositories.sort(
          (a, b) => b.source.trim().compareTo(a.source.trim()),
        );
      case 'BitBucket first':
        repositories.sort(
          (a, b) => a.source.trim().compareTo(b.source.trim()),
        );
      case 'A-Z':
        repositories.sort(
          (a, b) => a.title.trim().compareTo(b.title.trim()),
        );
      case 'Z-A':
        repositories.sort(
          (a, b) => b.title.trim().compareTo(a.title.trim()),
        );
    }
    return repositories;
  }

  Future<List<RepositoryMapper>> getSearchResultFromApi(
      SearchEntity params) async {
    final String encodedSearchValue = Uri.encodeComponent(params.searchValue);

    final List<http.Response> responses = await Future.wait(
      [
        http.get(
          Uri.https(
            'api.github.com',
            'search/repositories',
            {
              'per_page': '20',
              'q': '$encodedSearchValue in:name',
            },
          ),
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
        http.get(
          Uri.https(
            'api.bitbucket.org',
            '/2.0/repositories',
            {
              'fields': 'values.name,values.owner,values.description',
            },
          ),
        ),
      ],
    );
    final Map<String, dynamic> githubSearchResult =
        json.decode(responses[0].body);
    final List<dynamic> githubSearchResults = githubSearchResult['items'];

    final Map<String, dynamic> bitBucketSearchResult =
        json.decode(responses[1].body);
    final List<dynamic> bitBucketSearchResults =
        bitBucketSearchResult['values'];

    return [
      ...githubSearchResults.map(
        (json) => RepositoryMapper.fromJson(json, source: 'GitHub'),
      ),
      ...bitBucketSearchResults.map(
        (json) => RepositoryMapper.fromJson(json, source: 'BitBucket'),
      ),
    ];
  }
}
