import '../../services/app_urls.dart';
import '../../services/network/network_api_services.dart';

class DashboardRepository{
  final _apiService = NetworkApiServices();

  Future<dynamic> dashboardApiData()async{
    dynamic response = _apiService.get(AppUrls.DASBOARD_URL,);
    return response;
  }
}