import 'package:flutter/cupertino.dart';
import 'package:medi_calender/model/medicin.dart';

class MedicinProvider extends ChangeNotifier{
final List<Medicin> _medecin=[];

List <Medicin> get Medicins =>_medecin;

DateTime _slectedDate=DateTime.now();

DateTime get seletedDate=>_slectedDate;

void setDate(DateTime date)=>_slectedDate=date;

List<Medicin> get medicinOfSlectedDate=> _medecin;

void addMedicin(Medicin medicin){
 _medecin.add(medicin);

  notifyListeners();
}

void deleteMedicin(Medicin medicin){
  _medecin.remove(medicin);
}

  void editMedicin(Medicin newMedicin,Medicin oldMedicin){
      final index=_medecin.indexOf(oldMedicin);
      _medecin[index]=newMedicin;

      notifyListeners();
  }

}