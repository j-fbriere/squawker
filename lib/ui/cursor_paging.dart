import 'package:collection/collection.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CursorPagingState<PageKeyType, ItemType, CursorType> implements PagingState<PageKeyType, ItemType> {

  @override
  final List<List<ItemType>>? pages;

  @override
  final List<PageKeyType>? keys;

  @override
  final Object? error;

  @override
  final bool hasNextPage;

  @override
  final bool isLoading;

  final CursorType? cursor;

  CursorPagingState({
    List<List<ItemType>>? pages,
    List<PageKeyType>? keys,
    this.error,
    this.hasNextPage = true,
    this.isLoading = false,
    this.cursor
  }) : assert(
      pages?.length == keys?.length,
      'The length of pages and keys must be equal.',
    ),
    pages = switch (pages) {
      null => null,
      _ => List.unmodifiable(pages.map<List<ItemType>>(List.unmodifiable)),
    },
    keys = switch (keys) {
      null => null,
      _ => List.unmodifiable(keys),
    };

  @override
  PagingState<PageKeyType, ItemType> copyWith({
    Defaulted<List<List<ItemType>>?>? pages = const Omit(),
    Defaulted<List<PageKeyType>?>? keys = const Omit(),
    Defaulted<Object?>? error = const Omit(),
    Defaulted<bool>? hasNextPage = const Omit(),
    Defaulted<bool>? isLoading = const Omit(),
  }) => copyWithEx(
    pages: pages,
    keys: keys,
    error: error,
    hasNextPage: hasNextPage,
    isLoading: isLoading,
    cursor: null
  );

  CursorPagingState<PageKeyType, ItemType, CursorType> copyWithEx({
    Defaulted<List<List<ItemType>>?>? pages = const Omit(),
    Defaulted<List<PageKeyType>?>? keys = const Omit(),
    Defaulted<Object?>? error = const Omit(),
    Defaulted<bool>? hasNextPage = const Omit(),
    Defaulted<bool>? isLoading = const Omit(),
    Defaulted<CursorType?>? cursor = const Omit()
  }) =>
    CursorPagingState(
      pages: pages is Omit ? this.pages : pages as List<List<ItemType>>?,
      keys: keys is Omit ? this.keys : keys as List<PageKeyType>?,
      error: error is Omit ? this.error : error as Object?,
      hasNextPage:
      hasNextPage is Omit ? this.hasNextPage : hasNextPage as bool,
      isLoading: isLoading is Omit ? this.isLoading : isLoading as bool,
      cursor: cursor is Omit ? this.cursor : cursor as CursorType?
    );

  @override
  PagingState<PageKeyType, ItemType> reset() => resetEx();

  CursorPagingState<PageKeyType, ItemType, CursorType> resetEx() => CursorPagingState(
    pages: null,
    keys: null,
    error: null,
    hasNextPage: true,
    isLoading: false,
    cursor: null,
  );

  static const _equality = DeepCollectionEquality();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
      (other is CursorPagingState<PageKeyType, ItemType, CursorType> &&
      _equality.equals(other.pages, pages) &&
      _equality.equals(other.keys, keys) &&
      other.error == error &&
      other.hasNextPage == hasNextPage &&
      other.isLoading == isLoading &&
      other.cursor == cursor);
  }

  @override
  int get hashCode => Object.hash(
    _equality.hash(pages),
    _equality.hash(keys),
    error,
    hasNextPage,
    isLoading,
    cursor,
  );

}
