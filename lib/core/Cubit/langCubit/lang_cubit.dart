import 'package:bloc/bloc.dart';
import 'package:e_learning_app/core/cach_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangInitial());
  static LangCubit get(context) => BlocProvider.of(context);


bool isArabic=false;
var selectedLanguage;

changeLang(bool arabic){
  
  if(arabic)
  {
    selectedLanguage='ar';
    isArabic=arabic;
      emit(ChangeAppLanguageArabicState());
  }else{
      selectedLanguage='en';
    isArabic=arabic;
      emit(ChangeAppLanguageEnglishState());
  }
  CachHelper.saveData(key: 'isArabic', value: arabic);
 

}
}
