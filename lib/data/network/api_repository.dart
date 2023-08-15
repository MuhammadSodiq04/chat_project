import 'package:chat_project/data/network/api_provider.dart';

import '../models/default_model.dart';
import '../models/universal_response.dart';

class ApiRepository{
  final ApiProvider apiProvider;
  ApiRepository({required this.apiProvider});

  Future<List<DefaultModel>> fetchDefaultModelData()async{
    UniversalData universalResponse=await apiProvider.getAllData();
    if(universalResponse.error.isEmpty){
      return universalResponse.data as  List<DefaultModel>;
    }
    return [];
  }
}