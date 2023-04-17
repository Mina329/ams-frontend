import 'package:ams_frontend/src/apis/apis.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AsyncDataBuilder<State, P extends ProviderBase<AsyncValue<State>>>
    extends ConsumerWidget {
  const AsyncDataBuilder({
    super.key,
    required this.provider,
    this.data,
    this.withRefreshIndicator = false,
    this.withErrorScaffold = false,
    this.withLoadingScaffold = false,
  });

  final P provider;
  final Widget Function(State data)? data;
  final bool withRefreshIndicator;

  final bool withErrorScaffold;
  final bool withLoadingScaffold;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(provider);

    return withRefreshIndicator
        ? RefreshIndicator(
            color: KColors.lightCyan,
            onRefresh: () async {
              ref.invalidate(provider);
            },
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
      data: data ?? (State _) => Container(),
      error: (error, __) {
        String? msg;

        if (error is ApiError) {
          error.when(
            network: () {},
            notFound: () {},
            unauthorized: (message) {
              msg = message;
            },
            faceRecognition: () {},
            badRequest: () {},
            invalidOperation: (message) {
              msg = message;
            },
            internal: () {},
          );
        }

        msg ??= 'error happend'.hardcoded;

        return withErrorScaffold
            ? Scaffold(
                body: _errorBuild(ref, msg!, error, context),
              )
            : _errorBuild(ref, msg!, error, context);
      },
      loading: () => withLoadingScaffold
          ? Scaffold(body: _loadingBuild())
          : _loadingBuild(),
    );
  }

  Center _loadingBuild() {
    return Center(
      child: SpinKitFadingCube(
        color: KColors.white,
      ),
    );
  }

  Center _errorBuild(
    WidgetRef ref,
    String message,
    Object error,
    BuildContext context,
  ) {
    final color = Theme.of(context).primaryColor;
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(KRadiuses.r30),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    message,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: color),
                  ),
                ),
                const SizedBox(height: KSizes.s10),
                Text(
                  error.toString(),
                  maxLines: 10,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: color),
                ),
                const SizedBox(height: KSizes.s20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(color),
                    iconColor: MaterialStatePropertyAll(KColors.white),
                    foregroundColor: MaterialStatePropertyAll(KColors.white),
                    elevation: const MaterialStatePropertyAll(KElevations.e10),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: KPaddings.p10),
                    ),
                  ),
                  onPressed: () {
                    ref.invalidate(provider);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(context.l10n.retry),
                      const Icon(Icons.refresh_outlined),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
