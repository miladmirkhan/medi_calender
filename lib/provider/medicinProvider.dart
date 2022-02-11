import 'package:flutter/cupertino.dart';
import 'package:medi_calender/model/medicin.dart';

class MedicinProvider extends ChangeNotifier{
final List<Medicin> _medecins=[];

List <Medicin> get medicins =>_medecins;

DateTime _slectedDate=DateTime.now();

DateTime get seletedDate=>_slectedDate;

void setDate(DateTime date)=>_slectedDate=date;

List<Medicin> get medicinOfSlectedDate=> _medecins;

void addMedicin(Medicin medicin){
 _medecins.add(medicin);

  notifyListeners();
}

void deleteMedicin(Medicin medicin){
  _medecins.remove(medicin);
}

  void editMedicin(Medicin newMedicin,Medicin oldMedicin){
      final index=_medecins.indexOf(oldMedicin);
      _medecins[index]=newMedicin;

      notifyListeners();
  }

}