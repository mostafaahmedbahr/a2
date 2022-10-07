import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_google_maps/bloc/states.dart';
import 'package:test_google_maps/dio/dio_helper.dart';
import 'package:test_google_maps/model/uni_model.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit( ) : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

List universities = [];
String countryValue = "";
bool? selectedUniversity;
void change(val2)
{
  countryValue = val2;
  emit(ChangeState());
}
UniversityModel? universityModel;
   void getDate()
  {
    emit(LoadingState());
    DioAdanHelper.getData(
      url: "university/53",
    ).then((value){
      print(value.data);
      universityModel = UniversityModel.fromJson(value.data);
      universities.add(value.data);
      print(":-------------");
      print(universities);
      print(":-------------");
      emit(SuccessState());
    })
        .catchError((error){
          print("error in get data ${error.toString()}");
          emit(ErrorState());
    });
  }
}