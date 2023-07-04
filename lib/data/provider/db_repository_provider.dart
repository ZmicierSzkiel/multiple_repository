import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:multiple_repository/data/models/repository_model.dart';

import 'package:multiple_repository/domain/entities/search_entity.dart';

class DbRepositoryProvider {
  final String authToken =
      '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';

  Future<List<RepositoryMapper>> getAllRepositoriesfromDbs() async {
    try {
      List<http.Response> responses = await Future.wait(
        [
          http.get(
            Uri.https(
              'api.github.com',
              '/repositories',
              {},
            ),
            headers: {'Authorization': 'Bearer $authToken'},
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

  Future<List<RepositoryMapper>> sortRepositoriesFromDbs(
    String selectedOption,
  ) async {
    final List<RepositoryMapper> repositories =
        await getAllRepositoriesfromDbs();

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

  Future<List<RepositoryMapper>> getSearchResultFromDbs(
      SearchEntity params) async {
    final List<RepositoryMapper> repositories =
        await getAllRepositoriesfromDbs();

    return params.searchValue.isEmpty
        ? repositories
        : repositories.where(
            (repository) {
              final String lowerCaseSearchValue =
                  params.searchValue.toLowerCase();

              final String lowerCaseTitle = repository.title.toLowerCase();
              final String lowerCaseUsername =
                  repository.owner.username.toLowerCase();
              final String lowerCaseSource = repository.source.toLowerCase();

              final bool isMatchedTitle =
                  lowerCaseTitle.contains(lowerCaseSearchValue);
              final bool isMatchedUsername =
                  lowerCaseUsername.contains(lowerCaseSearchValue);
              final bool isMatchedSource =
                  lowerCaseSource.contains(lowerCaseSearchValue);

              return isMatchedTitle || isMatchedUsername || isMatchedSource;
            },
          ).toList();
  }
}
