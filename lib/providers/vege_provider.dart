import 'package:flutter/material.dart';
import 'package:freshroot/data/data_service/data_services.dart';
import 'package:freshroot/model/vagetable_model.dart';

class VegeProvider with ChangeNotifier {
  //create instance of dataservice
  final DataServices _dataServices;

  //constructer
  VegeProvider(this._dataServices);

  //list of vegi
  List<VagetableModel> _vegetables = [];

//getter method of vegis
  List<VagetableModel> get vegetables => _vegetables;

  //get vegitable method
  void getVegis() async {
    _vegetables = await _dataServices.getVegetableData();

    notifyListeners();
  }
}
