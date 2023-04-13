
import 'package:ams_frontend/src/apis/apis.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AsyncDataBuilder<State, P extends ProviderBase<AsyncValue<State>>>
    extends ConsumerWidget {
  const AsyncDataBuilder({
    super.key,
    required this.provider,
    required this.builder,
    this.withRefreshIndicator = false,
    this.withErrorScaffold = false,
    this.withLoadingScaffold = false,
  });

  final P provider;
  final Widget Function(State data) builder;
  final bool withRefreshIndicator;

  final bool withErrorScaffold;
  final bool withLoadingScaffold;

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

        return withErrorScaffold
            ? Scaffold(
                body: _errorBuild(ref, message, context),
              )
            : _errorBuild(ref, message, context);
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

  Center _errorBuild(WidgetRef ref, String message, BuildContext context) {
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
  }
}