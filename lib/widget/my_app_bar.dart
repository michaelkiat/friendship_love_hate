import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar({
    this.backgroundColor,
    this.shadowColor,
    this.elevation = 0.0,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.shape,
    this.foregroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.backwardsCompatibility,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.onPressed,
    this.appBarActionType = AppBarActionType.back,
  });
  final Color backgroundColor;
  final Color shadowColor;
  final double elevation;
  final Widget leading;
  final bool automaticallyImplyLeading;
  final Widget title;
  final List<Widget> actions;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final ShapeBorder shape;
  final Color foregroundColor;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final IconThemeData actionsIconTheme;
  final TextTheme textTheme;
  final bool primary;
  final bool centerTitle;
  final bool excludeHeaderSemantics;
  final double titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double toolbarHeight;
  final double leadingWidth;
  final bool backwardsCompatibility;
  final TextStyle toolbarTextStyle;
  final TextStyle titleTextStyle;
  final SystemUiOverlayStyle systemOverlayStyle;
  final VoidCallback onPressed;
  final AppBarActionType appBarActionType;

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

enum AppBarActionType {
  close,
  back,
}

class _MyAppBarState extends State<MyAppBar> {
  Widget defaultLeading(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;

    return canPop
        ? IconButton(
            icon: Icon(
              widget.appBarActionType == AppBarActionType.back
                  ? Icons.arrow_back
                  : Icons.close,
            ),
            color: Colors.black,
            tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
            onPressed: () {
              if (widget?.onPressed != null) {
                widget.onPressed();
              } else {
                Navigator.maybePop(context);
              }
            },
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget?.backgroundColor,
      shadowColor: widget?.shadowColor,
      elevation: widget.elevation,
      leading: widget?.leading ?? defaultLeading(context),
      automaticallyImplyLeading: widget?.automaticallyImplyLeading,
      title: widget?.title,
      actions: widget?.actions,
      flexibleSpace: widget?.flexibleSpace,
      bottom: widget?.bottom,
      shape: widget?.shape,
      foregroundColor: widget?.foregroundColor,
      brightness: widget?.brightness,
      iconTheme: widget?.iconTheme,
      actionsIconTheme: widget?.actionsIconTheme,
      textTheme: widget?.textTheme,
      primary: widget?.primary,
      centerTitle: widget?.centerTitle,
      excludeHeaderSemantics: widget?.excludeHeaderSemantics,
      titleSpacing: widget?.titleSpacing,
      toolbarOpacity: widget?.toolbarOpacity,
      bottomOpacity: widget?.bottomOpacity,
      toolbarHeight: widget?.toolbarHeight,
      leadingWidth: widget?.leadingWidth,
      backwardsCompatibility: widget?.backwardsCompatibility,
      toolbarTextStyle: widget?.toolbarTextStyle,
      titleTextStyle: widget?.titleTextStyle,
      systemOverlayStyle: widget?.systemOverlayStyle,
    );
  }
}
