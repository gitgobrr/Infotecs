# Infotecs
Тестовое задание для Академии ИнфоТеКС.

Сборка выполняется под платформы iOS(14.0+) и macOS(11.0+), для переключения достаточно выбрать соответсвующий target в Xcode 

<img width="174" alt="Screenshot 2023-02-02 at 03 02 28" src="https://user-images.githubusercontent.com/26817252/216196428-6f55984f-6a3a-4148-b393-e9f4fc23fb2b.png">

Или собрать из командной строки:
1. `$ cd ПУТЬ_ДО_ДИРЕКТОРИИ/Infotecs`
2. `$ xcodebuild -list` (lists the targets and configurations in a project, or the schemes in a workspace)
3. Собрать одной из комманд:
   - `$ xcodebuild -project Infotecs.xcodeproj`
   - OR `$ xcodebuild -project Infotecs.xcodeproj -target "Infotecs (iOS)"` для сборки под iOS
   - `xcodebuild -project Infotecs.xcodeproj -target "Infotecs (macOS)"` для сборки под macOS
   - `$ xcodebuild -alltargets` для сборки под все платформы
   
Дополнительные опции (архитектура, девайс и т.д.), можно указать с помощью параметра: `-destination`, например:

`-destination "generic/platform=macOS,variant=Mac Catalyst,name=Any Mac"`.
