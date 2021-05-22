import 'package:features/features.dart';
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
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => AuthPage()),
      ];
}
