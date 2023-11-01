import 'package:balance_home_app/config/app_colors.dart';
import 'package:balance_home_app/config/app_layout.dart';
import 'package:balance_home_app/src/core/presentation/views/app_title.dart';
import 'package:balance_home_app/src/core/presentation/widgets/app_will_pop_scope.dart';
import 'package:balance_home_app/src/features/auth/presentation/views/auth_background_view.dart';
import 'package:balance_home_app/src/core/presentation/widgets/app_language_picker_dropdown.dart';
import 'package:balance_home_app/src/core/providers.dart';
import 'package:balance_home_app/src/core/utils/widget_utils.dart';
import 'package:balance_home_app/src/features/auth/presentation/widgets/login_form.dart';
import 'package:balance_home_app/src/features/auth/presentation/widgets/register_form.dart';
import 'package:balance_home_app/src/features/currency/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_picker/languages.dart';

class AuthView extends ConsumerWidget {
  /// Named route for [AuthView]
  static const String routeName = 'authentication';

  /// Path route for [AuthView]
  static const String routePath = 'auth';

  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  final registerUsernameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerRepeatPasswordController = TextEditingController();

  final cache = ValueNotifier<Widget>(Container());

  AuthView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = ref.watch(appLocalizationsProvider);
    final appLocalizationStateNotifier =
        ref.read(appLocalizationsProvider.notifier);

    final isConnected = connectionStateListenable.value;

    final currencyTypeListController =
        ref.watch(currencyTypeListsControllerProvider);

    return AppWillPopScope(
      child: Scaffold(
        appBar: AppBar(
            title: const AppTitle(fontSize: 30),
            backgroundColor: AppColors.appBarBackgroundColor,
            automaticallyImplyLeading: false),
        body: SafeArea(
          child: AuthBackgroundWidget(
              child: currencyTypeListController.when<Widget>(
                  data: (currencyTypes) {
            cache.value = Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: AppLanguagePickerDropdown(
                      appLocalizations: appLocalizations,
                      onValuePicked: (Language language) {
                        Locale locale = Locale(language.isoCode);
                        appLocalizationStateNotifier.setLocale(locale);
                      }),
                ),
                const SizedBox(height: AppLayout.genericPadding),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                            isScrollable: true,
                            indicatorColor:
                                const Color.fromARGB(255, 7, 136, 76),
                            tabs: [
                              Tab(
                                child: Text(
                                  appLocalizations.signIn,
                                  style: GoogleFonts.openSans(
                                      color:
                                          const Color.fromARGB(255, 27, 27, 27),
                                      fontSize: 20),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  appLocalizations.register,
                                  style: GoogleFonts.openSans(
                                      color:
                                          const Color.fromARGB(255, 27, 27, 27),
                                      fontSize: 20),
                                ),
                              )
                            ]),
                        Expanded(
                            child: TabBarView(children: [
                          LoginForm(
                            emailController: loginEmailController,
                            passwordController: loginPasswordController,
                          ),
                          RegisterForm(
                              usernameController: registerUsernameController,
                              emailController: registerEmailController,
                              passwordController: registerPasswordController,
                              repeatPasswordController:
                                  registerRepeatPasswordController,
                              currencyTypes: currencyTypes)
                        ])),
                      ],
                    ),
                  ),
                )
              ],
            );
            return cache.value;
          }, error: (error, _) {
            if (!isConnected) {
              return showError(
                  background: cache.value,
                  icon: Icons.network_wifi_1_bar,
                  text: appLocalizations.noConnection);
            }
            return showError(
                error: error,
                background: cache.value,
                text: appLocalizations.genericError);
          }, loading: () {
            return showLoading(background: cache.value);
          })),
        ),
      ),
    );
  }
}
