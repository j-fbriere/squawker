const int additionalRandomNumber = 3;
const String defaultKeyword = 'obfiowerehiring';

const String onDemandFileUrlTemplate =
    'https://abs.twimg.com/responsive-web/client-web/ondemand.s.{filename}a.js';

final RegExp indicesRegex = RegExp(
  r'(\(\w{1}\[(\d{1,2})\],\s*16\))+',
  multiLine: true,
);

final RegExp onDemandFileRegex = RegExp(
  r''',(\d+):["']ondemand\.s["']''',
  multiLine: true,
);
