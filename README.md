# movie

This project is powered by Flutter **>=2.8.0** and Dart **>=2.18.0 <3.0.0**.


Bloc ([flutter_bloc](https://pub.dev/packages/flutter_bloc)) is used as an approach to state management, more precisely Cubit over Bloc from the same package. Bloc/Cubit handles `Events` and changes `States`. Screens and Widgtes subscribe to Bloc changes and send events (for Cubit, this is a direct method call).

#Screen Record





https://user-images.githubusercontent.com/33372890/232257055-5d469cc8-f0fe-419f-8268-8dcbeee4c5c2.mp4




#ScreenShot



<img  alt="Coding" height="400" src="https://user-images.githubusercontent.com/33372890/232257819-2cbb6795-08d7-4436-8867-2b208e72d7ae.jpeg"> <img  alt="Coding" height="400" src="https://user-images.githubusercontent.com/33372890/232257831-c9b038b3-17da-4b0f-b38c-287d72f468f4.jpeg"> <img  alt="Coding" height="400" src="https://user-images.githubusercontent.com/33372890/232257836-a29aa6ae-2e98-486f-9b31-671aa8d0b175.jpeg">

The main packages used in the project:
```yaml
  adobe_xd: ^2.0.1
  animate_do: ^2.1.0
  bloc: ^8.1.0
  cached_network_image: ^3.2.2
  carousel_slider: ^4.1.1
  cupertino_icons: ^1.0.2
  dartz: ^0.10.1
  dio: ^4.0.6
  equatable: ^2.0.5
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.1
  flutter_screenutil: ^5.5.4
  get_it: ^7.2.0
  google_fonts: ^3.0.1
  shimmer: ^2.0.0
```

## Project structure <a name="structure"></a>
|   |   |
|---|---|
|*main.dart*|The entry point to the application. Here is the initialization of DioHelper, CacheHelper and registration of common Blocs and Sizer that are used throughout the application.|
|*bloc/*|Global Cubit and Bloc Observer.|
|*data/*|Model classes used in the application, mapper and  data providers (local and remote) network(requests, responses).|
|*presentation/*|All UI elements used in the application.|
|---|---|
|*presentation/resources/*|Contain all resources(Strings images padding).|
|---|---|



