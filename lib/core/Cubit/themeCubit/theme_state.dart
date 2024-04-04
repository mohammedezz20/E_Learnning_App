part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeInitial extends ThemeState {}
final class changeapptheme extends ThemeState {}
final class changeappthemeToLight extends ThemeState {}
final class changeappthemeToDark extends ThemeState {}

