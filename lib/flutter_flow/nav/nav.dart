import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const SolarsystemWidget() : const LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const SolarsystemWidget() : const LoginWidget(),
        ),
        FFRoute(
          name: 'welcomeanflogin',
          path: '/welcomeanflogin',
          builder: (context, params) => const WelcomeanfloginWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'Signup',
          path: '/Signup',
          builder: (context, params) => const SignupWidget(),
        ),
        FFRoute(
          name: 'solarsystem',
          path: '/solarsystem',
          builder: (context, params) => const SolarsystemWidget(),
        ),
        FFRoute(
          name: 'neptunquiz',
          path: '/neptunquiz',
          builder: (context, params) => const NeptunquizWidget(),
        ),
        FFRoute(
          name: 'rightscore',
          path: '/RightScoreNp',
          builder: (context, params) => const RightscoreWidget(),
        ),
        FFRoute(
          name: 'wrongscore',
          path: '/wrongscore',
          builder: (context, params) => const WrongscoreWidget(),
        ),
        FFRoute(
          name: 'truefalsepage',
          path: '/truefalsepage',
          builder: (context, params) => const TruefalsepageWidget(),
        ),
        FFRoute(
          name: 'NeptuneWelcome',
          path: '/neptuneWelcome',
          builder: (context, params) => const NeptuneWelcomeWidget(),
        ),
        FFRoute(
          name: 'NeptuneInfo',
          path: '/neptuneInfo',
          builder: (context, params) => const NeptuneInfoWidget(),
        ),
        FFRoute(
          name: 'RightScoreCH',
          path: '/rightScoreCH',
          builder: (context, params) => const RightScoreCHWidget(),
        ),
        FFRoute(
          name: 'RightScore2',
          path: '/rightScore2',
          builder: (context, params) => const RightScore2Widget(),
        ),
        FFRoute(
          name: 'SecPage',
          path: '/secPage',
          builder: (context, params) => const SecPageWidget(),
        ),
        FFRoute(
          name: 'ThPage',
          path: '/thPage',
          builder: (context, params) => const ThPageWidget(),
        ),
        FFRoute(
          name: 'CharChoice',
          path: '/charChoice',
          builder: (context, params) => const CharChoiceWidget(),
        ),
        FFRoute(
          name: 'ShCHoice',
          path: '/shCHoice',
          builder: (context, params) => const ShCHoiceWidget(),
        ),
        FFRoute(
          name: 'instructions_Page1',
          path: '/instructionsPage1',
          builder: (context, params) => const InstructionsPage1Widget(),
        ),
        FFRoute(
          name: 'instructions_Page2',
          path: '/instructionsPage2',
          builder: (context, params) => const InstructionsPage2Widget(),
        ),
        FFRoute(
          name: 'Arrangement',
          path: '/arrangement',
          builder: (context, params) => const ArrangementWidget(),
        ),
        FFRoute(
          name: 'rightscoreCopy',
          path: '/rightscoreCopy',
          builder: (context, params) => const RightscoreCopyWidget(),
        ),
        FFRoute(
          name: 'Settings',
          path: '/settings',
          builder: (context, params) => const SettingsWidget(),
        ),
        FFRoute(
          name: 'editProfile',
          path: '/editProfile',
          builder: (context, params) => const EditProfileWidget(),
        ),
        FFRoute(
          name: 'Credits',
          path: '/credits',
          builder: (context, params) => const CreditsWidget(),
        ),
        FFRoute(
          name: 'Inctractions_Page3',
          path: '/inctractionsPage3',
          builder: (context, params) => const InctractionsPage3Widget(),
        ),
        FFRoute(
          name: 'instructions_Page4',
          path: '/instructionsPage4',
          builder: (context, params) => const InstructionsPage4Widget(),
        ),
        FFRoute(
          name: 'instructions_Page5',
          path: '/instructionsPage5',
          builder: (context, params) => const InstructionsPage5Widget(),
        ),
        FFRoute(
          name: 'instructions_Page9',
          path: '/instructionsPage9',
          builder: (context, params) => const InstructionsPage9Widget(),
        ),
        FFRoute(
          name: 'instructions_Page8',
          path: '/instructionsPage8',
          builder: (context, params) => const InstructionsPage8Widget(),
        ),
        FFRoute(
          name: 'instructions_Page7',
          path: '/instructionsPage7',
          builder: (context, params) => const InstructionsPage7Widget(),
        ),
        FFRoute(
          name: 'instructions_Page6',
          path: '/instructionsPage6',
          builder: (context, params) => const InstructionsPage6Widget(),
        ),
        FFRoute(
          name: 'NeptunPrize',
          path: '/neptunPrize',
          builder: (context, params) => const NeptunPrizeWidget(),
        ),
        FFRoute(
          name: 'uranusPrize',
          path: '/uranusPrize',
          builder: (context, params) => const UranusPrizeWidget(),
        ),
        FFRoute(
          name: 'starunPrize',
          path: '/saturnPrize',
          builder: (context, params) => const StarunPrizeWidget(),
        ),
        FFRoute(
          name: 'UranusQuiz1',
          path: '/uranusQuiz1',
          builder: (context, params) => const UranusQuiz1Widget(),
        ),
        FFRoute(
          name: 'WelcomeToUranus',
          path: '/welcomeToUranus',
          builder: (context, params) => const WelcomeToUranusWidget(),
        ),
        FFRoute(
          name: 'Uranus1',
          path: '/uranus1',
          builder: (context, params) => const Uranus1Widget(),
        ),
        FFRoute(
          name: 'Uranus2',
          path: '/uranus2',
          builder: (context, params) => const Uranus2Widget(),
        ),
        FFRoute(
          name: 'UranusQuiz1_RightScore',
          path: '/uranusQuiz1RightScore',
          builder: (context, params) => const UranusQuiz1RightScoreWidget(),
        ),
        FFRoute(
          name: 'UranusQuiz2',
          path: '/uranusQuiz2',
          builder: (context, params) => const UranusQuiz2Widget(),
        ),
        FFRoute(
          name: 'UranusQuiz2_RightScore',
          path: '/uranusQuiz2RightScore',
          builder: (context, params) => const UranusQuiz2RightScoreWidget(),
        ),
        FFRoute(
          name: 'UranusQuiz3',
          path: '/uranusQuiz3',
          builder: (context, params) => const UranusQuiz3Widget(),
        ),
        FFRoute(
          name: 'UranusQuiz4',
          path: '/uranusQuiz4',
          builder: (context, params) => const UranusQuiz4Widget(),
        ),
        FFRoute(
          name: 'UranusQuiz3_RightScore',
          path: '/uranusQuiz3RightScore',
          builder: (context, params) => const UranusQuiz3RightScoreWidget(),
        ),
        FFRoute(
          name: 'UranusQuiz4_RightScore',
          path: '/uranusQuiz4RightScore',
          builder: (context, params) => const UranusQuiz4RightScoreWidget(),
        ),
        FFRoute(
          name: 'UranusQuiz5_RightScore',
          path: '/uranusQuiz5RightScore',
          builder: (context, params) => const UranusQuiz5RightScoreWidget(),
        ),
        FFRoute(
          name: 'UranusQuiz5',
          path: '/uranusQuiz5',
          builder: (context, params) => const UranusQuiz5Widget(),
        ),
        FFRoute(
          name: 'Jupiterinfo',
          path: '/jupiterinfo',
          builder: (context, params) => const JupiterinfoWidget(),
        ),
        FFRoute(
          name: 'MCQJupiter',
          path: '/mCQJupiter',
          builder: (context, params) => const MCQJupiterWidget(),
        ),
        FFRoute(
          name: 'WelcomeJupiter',
          path: '/welcomeJupiter',
          builder: (context, params) => const WelcomeJupiterWidget(),
        ),
        FFRoute(
          name: 'TFJupiter',
          path: '/tFJupiter',
          builder: (context, params) => const TFJupiterWidget(),
        ),
        FFRoute(
          name: 'RightScoreJup',
          path: '/rightScoreJup',
          builder: (context, params) => const RightScoreJupWidget(),
        ),
        FFRoute(
          name: 'Rightscoreneptune',
          path: '/rightscoreneptune',
          builder: (context, params) => const RightscoreneptuneWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
