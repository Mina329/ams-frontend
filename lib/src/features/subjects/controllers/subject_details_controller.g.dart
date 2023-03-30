// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$subjectDetailsControllerHash() =>
    r'0e08579167f88d04b1399208c612ea3a2cee3194';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SubjectDetailsController
    extends BuildlessAutoDisposeAsyncNotifier<SubjectDetailsState> {
  late final String arg;

  FutureOr<SubjectDetailsState> build(
    String arg,
  );
}

/// See also [SubjectDetailsController].
@ProviderFor(SubjectDetailsController)
const subjectDetailsControllerProvider = SubjectDetailsControllerFamily();

/// See also [SubjectDetailsController].
class SubjectDetailsControllerFamily
    extends Family<AsyncValue<SubjectDetailsState>> {
  /// See also [SubjectDetailsController].
  const SubjectDetailsControllerFamily();

  /// See also [SubjectDetailsController].
  SubjectDetailsControllerProvider call(
    String arg,
  ) {
    return SubjectDetailsControllerProvider(
      arg,
    );
  }

  @override
  SubjectDetailsControllerProvider getProviderOverride(
    covariant SubjectDetailsControllerProvider provider,
  ) {
    return call(
      provider.arg,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'subjectDetailsControllerProvider';
}

/// See also [SubjectDetailsController].
class SubjectDetailsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SubjectDetailsController,
        SubjectDetailsState> {
  /// See also [SubjectDetailsController].
  SubjectDetailsControllerProvider(
    this.arg,
  ) : super.internal(
          () => SubjectDetailsController()..arg = arg,
          from: subjectDetailsControllerProvider,
          name: r'subjectDetailsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$subjectDetailsControllerHash,
          dependencies: SubjectDetailsControllerFamily._dependencies,
          allTransitiveDependencies:
              SubjectDetailsControllerFamily._allTransitiveDependencies,
        );

  final String arg;

  @override
  bool operator ==(Object other) {
    return other is SubjectDetailsControllerProvider && other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<SubjectDetailsState> runNotifierBuild(
    covariant SubjectDetailsController notifier,
  ) {
    return notifier.build(
      arg,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
