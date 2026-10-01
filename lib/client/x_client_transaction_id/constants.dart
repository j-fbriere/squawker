const int additionalRandomNumber = 3;
const String defaultKeyword = 'obfiowerehiring';

final RegExp indicesRegex = RegExp(
  r'(\(\w{1}\[(\d{1,2})\],\s*16\))+',
  multiLine: true,
);

final RegExp entryScriptRegex = RegExp(
  r'''src=["'](https://abs\.twimg\.com/[^"']+/entry-client[\w-]*\.js)["']''',
);

final RegExp signImporterRegex = RegExp(
  r'''["']([./\w-]*sentry-filter-[\w-]+\.js)["']''',
);

final RegExp signFileRegex = RegExp(
  r'''["'`]([./\w-]*sign\.o-[\w-]+\.js)["'`]''',
);
