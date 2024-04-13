# trans_intl

Lightweight international text translation solution plug-in.

## Getting Started

```shell
flutter pub add trans_intl
```

## Use

```dart
import 'package:trans_intl/trans_intl.dart';
I18nManager.init(current: LanguageType.EN, trans: TranslationService());
```

```dart
import 'package:trans_intl/trans_intl.dart';

I18nManager.changeLanguage(LanguageType.FR);
```# trans_intl
