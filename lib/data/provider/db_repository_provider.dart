import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:multiple_repository/data/models/repository_model.dart';

class DbRepositoryProvider {
  final Uri bitBucketUri = Uri.parse(
    'https://api.bitbucket.org/2.0/repositories?fields=values.name,values.owner,values.description',
  );
  final Uri githubUri = Uri.parse(
    'https://api.github.com/repositories?',
  );

  Future<List<RepositoryMapper>> getAllRepositoriesfromDbs() async {
    List<http.Response> responses = await Future.wait(
      [
        http.get(githubUri),
        http.get(bitBucketUri),
      ],
    );

    try {
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
}
