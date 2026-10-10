import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import 'app_error_view.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.appBar,
    this.body,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawerScrimColor,
    this.bottomSheet,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.primary = true,
    this.restorationId,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final Color? drawerScrimColor;
  final Widget? bottomSheet;
  final DrawerCallback? onDrawerChanged;
  final DrawerCallback? onEndDrawerChanged;
  final bool primary;
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? Theme.of(context).colorScheme.surface;

    return Scaffold(
      appBar: appBar,
      body: body != null
          ? SafeArea(
              top: appBar == null && !extendBodyBehindAppBar,
              bottom: bottomNavigationBar == null && !extendBody,
              child: body!,
            )
          : null,
      backgroundColor: effectiveBackgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawer: drawer,
      endDrawer: endDrawer,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButtonAnimator: floatingActionButtonAnimator,
      persistentFooterButtons: persistentFooterButtons,
      drawerScrimColor: drawerScrimColor,
      bottomSheet: bottomSheet,
      onDrawerChanged: onDrawerChanged,
      onEndDrawerChanged: onEndDrawerChanged,
      primary: primary,
      restorationId: restorationId,
    );
  }
}

class AppScaffoldWithBackground extends StatelessWidget {
  const AppScaffoldWithBackground({
    super.key,
    this.appBar,
    required this.body,
    this.backgroundColor = AppColors.surfaceLight,
    this.backgroundImage,
    this.backgroundImageFit = BoxFit.cover,
    this.backgroundImageAlignment = Alignment.center,
    this.resizeToAvoidBottomInset = true,
    this.extendBody = false,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Color backgroundColor;
  final ImageProvider? backgroundImage;
  final BoxFit backgroundImageFit;
  final Alignment backgroundImageAlignment;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: Stack(
        children: [
          // Background
          Container(
            width: double.infinity,
            height: double.infinity,
            color: backgroundColor,
            child: backgroundImage != null
                ? Image(
                    image: backgroundImage!,
                    fit: backgroundImageFit,
                    alignment: backgroundImageAlignment,
                    width: double.infinity,
                    height: double.infinity,
                  )
                : null,
          ),
          // Content
          SafeArea(
            top: appBar == null,
            bottom: bottomNavigationBar == null && !extendBody,
            child: body,
          ),
        ],
      ),
    );
  }
}

class AppScaffoldWithGradient extends StatelessWidget {
  const AppScaffoldWithGradient({
    super.key,
    this.appBar,
    required this.body,
    this.gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.surfaceLight,
        AppColors.white,
      ],
    ),
    this.resizeToAvoidBottomInset = true,
    this.extendBody = false,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Gradient gradient;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: Container(
        decoration: BoxDecoration(gradient: gradient),
        child: SafeArea(
          top: appBar == null,
          bottom: bottomNavigationBar == null && !extendBody,
          child: body,
        ),
      ),
    );
  }
}

class AppScaffoldWithScroll extends StatelessWidget {
  const AppScaffoldWithScroll({
    super.key,
    this.appBar,
    required this.body,
    this.backgroundColor,
    this.padding = AppSizes.screenPadding,
    this.physics,
    this.controller,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? Theme.of(context).colorScheme.surface;

    return Scaffold(
      appBar: appBar,
      backgroundColor: effectiveBackgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: SafeArea(
        top: appBar == null,
        bottom: bottomNavigationBar == null,
        child: SingleChildScrollView(
          physics: physics,
          controller: controller,
          keyboardDismissBehavior: keyboardDismissBehavior,
          padding: padding,
          child: body,
        ),
      ),
    );
  }
}

class AppScaffoldWithList extends StatelessWidget {
  const AppScaffoldWithList({
    super.key,
    this.appBar,
    required this.children,
    this.backgroundColor,
    this.padding = AppSizes.screenPadding,
    this.physics,
    this.shrinkWrap = false,
    this.controller,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  final PreferredSizeWidget? appBar;
  final List<Widget> children;
  final Color? backgroundColor;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final ScrollController? controller;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? Theme.of(context).colorScheme.surface;

    return Scaffold(
      appBar: appBar,
      backgroundColor: effectiveBackgroundColor,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: SafeArea(
        top: appBar == null,
        bottom: bottomNavigationBar == null,
        child: ListView(
          physics: physics,
          shrinkWrap: shrinkWrap,
          controller: controller,
          keyboardDismissBehavior: keyboardDismissBehavior,
          padding: padding,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          semanticChildCount: semanticChildCount,
          children: children,
        ),
      ),
    );
  }
}

class AppPageWrapper extends StatelessWidget {
  const AppPageWrapper({
    super.key,
    required this.child,
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.showBackButton = true,
    this.onBackPressed,
    this.centerTitle = true,
    this.elevation = 0,
    this.bottom,
    this.preferredSize,
  });

  final Widget child;
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final bool centerTitle;
  final double elevation;
  final PreferredSizeWidget? bottom;
  final Size? preferredSize;

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    return AppScaffold(
      appBar: AppBar(
        title: title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.titleLarge,
              )
            : null,
        centerTitle: centerTitle,
        leading: showBackButton && canPop
            ? leading ??
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: AppSizes.iconMd,
                  ),
                  onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
                  tooltip: 'رجوع',
                )
            : leading,
        actions: actions,
        backgroundColor: backgroundColor ?? Colors.transparent,
        elevation: elevation,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        bottom: bottom,
        leadingWidth: 48,
      ),
      body: child,
    );
  }
}

class AppAuthScaffold extends StatelessWidget {
  const AppAuthScaffold({
    super.key,
    required this.body,
    this.backgroundColor = AppColors.surfaceLight,
    this.logo,
    this.logoSize = AppSizes.logoMd,
  });

  final Widget body;
  final Color backgroundColor;
  final Widget? logo;
  final double logoSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: AppSizes.screenPadding,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  AppSizes.spacing4xl * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (logo != null) ...[
                  Center(child: logo!),
                  SizedBox(height: AppSizes.spacing3xl),
                ],
                Expanded(
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: body,
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