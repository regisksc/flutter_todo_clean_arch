import 'package:features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infra/exports/dependencies.dart';

import 'auth_controller.dart';
import 'auth_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => AuthController()),
        Bind.lazySingleton<AuthDataSource>(
            (i) => FirebaseAuthDatasource(store: FirebaseFirestore.instance, auth: FirebaseAuth.instance)),
        Bind.lazySingleton<ConcreteAuthRepository>((i) => ConcreteAuthRepository(i.get<AuthDataSource>())),
        Bind.lazySingleton<LogUserInUsecase>((i) => LogUserInUsecase(i.get<AuthRepository>())),
        Bind.lazySingleton<RegisterUserUsecase>((i) => RegisterUserUsecase(i.get<AuthRepository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => AuthPage()),
        ChildRoute(
          'inProgress',
          child: (_, args) => Scaffold(
            body: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(70),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Hi ${(args.data as UserEntity).name}! You logged in with ${(args.data as UserEntity).email.get}",
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'You logged in, but app is under construction. Sorry for the inconvenience',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ];
}
