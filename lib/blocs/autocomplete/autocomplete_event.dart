part of 'autocomplete_bloc.dart';

sealed class AutocompleteEvent extends Equatable {
  const AutocompleteEvent();

  @override
  List<Object> get props => [];
}

class LoadAutocomplete extends AutocompleteEvent {
  final String searchInput;

  const LoadAutocomplete({this.searchInput = ''});

  @override
  List<Object> get props => [searchInput];
}

class ClearAutocomplete extends AutocompleteEvent {}
