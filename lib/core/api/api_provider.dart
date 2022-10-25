abstract class ApiProvider {
  Future<dynamic> getData(String path, {Map<String, dynamic> queryParams});
}
