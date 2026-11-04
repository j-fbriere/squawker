const int additionalRandomNumber = 3;
const String defaultKeyword = 'obfiowerehiring';

final RegExp indicesRegex = RegExp(
  r'(\(\w{1}\[(\d{1,2})\],\s*16\))+',
  multiLine: true,
);

final RegExp entryScriptRegex = RegExp(
  r'''["'](https://abs\.twimg\.com/[^"']+/entry-client[\w-]*\.js)["']''',
);

final RegExp staticImportRegex = RegExp(
  r'''from\s*["'`]([./\w-]+\.js)["'`]''',
);

/// The sign module is imported lazily, and its default export is called right away.
final RegExp signFileRegex = RegExp(
  r'''import\(\s*["'`]([./\w-]+\.js)["'`]\s*\)\.then\(\s*\(?(\w+)\)?\s*=>\s*\2\.default\(\)\s*\)''',
);
