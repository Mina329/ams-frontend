import 'package:ams_frontend/src/apis/api_error.dart';
import 'package:ams_frontend/src/konstants/kcolors.dart';
import 'package:ams_frontend/src/konstants/kdoubles.dart';
import 'package:ams_frontend/src/konstants/kints.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncDataBuilder<State, P extends ProviderBase<AsyncValue<State>>>
    extends ConsumerWidget {
  const AsyncDataBuilder({
    super.key,
    required this.provider,
    required this.builder,
    this.withRefreshIndicator = false,
  });

  final P provider;
  final Widget Function(State data) builder;
  final bool withRefreshIndicator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(provider);

    Future<void> onRefresh() async {
      ref.invalidate(provider);
    }

    return withRefreshIndicator
        ? RefreshIndicator(
            color: KColors.lightCyan,
            onRefresh: onRefresh,
            child: _dataWidget(asyncValue, ref, context),
          )
        : _dataWidget(asyncValue, ref, context);
  }

  Widget _dataWidget(
    AsyncValue<State> asyncValue,
    WidgetRef ref,
    BuildContext context,
  ) {
    return asyncValue.when(
      skipLoadingOnRefresh: false,
      data: builder,
      error: (error, __) {
        late String message;

        if (error is ApiError) {
          message = error.maybeWhen(
            unauthorized: (message) => message,
            invalidOperation: (message) => message,
            orElse: () => error.toString(),
          );
        } else {
          message = error.toString();
        }

        return Center(
          child: InkWell(
            radius: KRadiuses.r30,
            borderRadius: BorderRadius.circular(KRadiuses.r30),
            onTap: () {
              ref.invalidate(provider);
            },
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: KColors.white,
                borderRadius: BorderRadius.circular(KRadiuses.r30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(KPaddings.p30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    const SizedBox(height: KSizes.s10),
                    Icon(
                      Icons.refresh_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      loading: () => Center(
        child: SpinKitFadingCube(
          color: KColors.white,
        ),
      ),
    );
  }
}

extension AsyncValueExt<T> on AsyncValue<T> {
  void maybeDataAndReport(
    BuildContext context,
    void Function(T)? onData,
  ) {
    whenOrNull(
      data: onData != null
          ? (data) {
              onData(data);
            }
          : null,
      error: (error, stackTrace) {
        context.toast(error.toString(), level: ToastLevel.error);
      },
    );
  }

  Widget dataBuilder({
    required Widget Function(BuildContext context, WidgetRef ref, T data)
        builder,
    ProviderOrFamily? provider,
  }) {
    return Consumer(
      builder: (context, ref, child) => when(
        skipLoadingOnRefresh: false,
        data: (data) {
          return builder(context, ref, data);
        },
        error: (error, stackTrace) {
          return Center(
              child: Card(
                  child: Column(
            children: [
              const Text('error'),
              if (provider != null)
                IconButton(
                  onPressed: () {
                    ref.invalidate(provider);
                  },
                  icon: const Icon(Icons.refresh_outlined),
                )
            ],
          )));
        },
        loading: () {
          return Center(
            child: SpinKitFadingCube(
              color: KColors.white,
            ),
          );
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        child: Container(
          padding: const EdgeInsets.all(KPaddings.p60),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(KRadiuses.r40),
          ),
          child: CircularProgressIndicator(
            color: KColors.lightCyan,
          ),
        ),
      ),
    );
  }
}

extension ThemeModeExt on ThemeMode {
  IconData get icon => this == ThemeMode.dark
      ? Icons.dark_mode_outlined
      : Icons.light_mode_outlined;

  ThemeMode get inverse =>
      this == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;

  String l10n(BuildContext context) =>
      this == ThemeMode.dark ? context.l10n.darkMode : context.l10n.lightMode;
}

extension ScheduleToString on Schedule {
  String toHumanString() {
    // todo
    throw UnimplementedError();
  }

  String toExprString() {
    final minutes = this.minutes?.map((e) => '$e').join(',') ?? '';
    final hours = this.hours?.map((e) => '$e').join(',');
    final days = this.days?.map((e) => '$e').join(',');
    final months = this.months?.map((e) => '$e').join(',');
    final weekdays = this.weekdays?.map((e) => '$e').join(',');

    return '$minutes $hours $days $months $weekdays';
  }
}

extension AppLocaleExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension StringHardCodedExt on String {
  String get hardcoded => this;
}

enum ToastLevel {
  success,
  warning,
  error,
}

extension ToastExt on BuildContext {
  void toast(
    String message, {
    ToastLevel level = ToastLevel.success,
  }) {
    const List<Color> colors = [
      Colors.green,
      Colors.orange,
      Colors.red,
    ];

    const List<IconData> icons = [
      Icons.message_outlined,
      Icons.warning_amber_outlined,
      Icons.error_outline,
    ];

    final color = colors[level.index];
    final icon = icons[level.index];

    Flushbar(
      title: level.name,
      titleColor: color,
      message: message,
      messageColor: color,
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      duration: KDurations.toast,
      icon: Icon(
        icon,
        color: color,
      ),
      leftBarIndicatorColor: color,
      backgroundColor: color.withAlpha(30),
      margin: const EdgeInsets.all(KSizes.s10),
      borderRadius: BorderRadius.circular(KSizes.s10),
    ).show(this);
  }
}
