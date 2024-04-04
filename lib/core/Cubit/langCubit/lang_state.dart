part of 'lang_cubit.dart';

sealed class LangState extends Equatable {
  const LangState();

  @override
  List<Object> get props => [];
}

final class LangInitial extends LangState {}
final class ChangeAppLanguageArabicState extends LangState {}
final class ChangeAppLanguageEnglishState extends LangState {}
