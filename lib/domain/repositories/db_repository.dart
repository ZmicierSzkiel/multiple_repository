abstract class DbRepository {
  Future<void> getBitBucketData();
  Future<void> getGithubData();
}
