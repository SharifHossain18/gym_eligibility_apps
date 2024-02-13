

import 'package:flutter/material.dart';
class HomepageProvider extends ChangeNotifier{
  String? eligibilityMessage="";
  bool? isEligible;

  void checkEligibility(int age){
    if(age>18){
      eligibleForLicence();
    }
    else{
      notEligibleForLicence();
    }
  }

  void eligibleForLicence(){
    eligibilityMessage="You are eligible";
    isEligible=true;
    notifyListeners();
  }

  void notEligibleForLicence(){
    eligibilityMessage="You are not eligible";
    isEligible=false;
    notifyListeners();
  }



}
