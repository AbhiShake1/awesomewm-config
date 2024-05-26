import 'package:edm/base/base.dart';
import 'package:edm/constants/dimens.dart';
import 'package:edm/utils/extensions.dart';

@sageLocalWidget
class SageButton extends StatelessWidget {
  const SageButton({
    required this.text,
    required this.onPressed,
    this.isDisabled = false,
    this.expanded = true,
    this.color,
    this.textStyle,
    this.textColor,
    this.disabledColor,
    this.borderRadius,
    this.padding,
    this.iconAssetUrl,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;
  final bool expanded;
  final Color? color;
  final Color? disabledColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final bool isDisabled;
  final double? borderRadius;
  final EdgeInsets? padding;
  final String? iconAssetUrl;

  @override
  Widget build(BuildContext context) {
    final btnColorDisabled = disabledColor ?? context.color.surface20;
    final effectiveTextColor = textColor ?? context.color.scaffoldBackground.inverted;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(isDisabled ? btnColorDisabled : color ?? context.color.primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? d_borderRadius),
          ),
        ),
        padding: MaterialStateProperty.all(padding),
        minimumSize: !expanded ? null : MaterialStateProperty.all(const Size(double.infinity, d_buttonHeight)),
      ),
      onPressed: isDisabled ? null : onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconAssetUrl != null) ...[
            SageImage.asset(url: iconAssetUrl!, width: d_iconSm, height: d_iconSm, color: effectiveTextColor),
            d_margin05.widthBox,
          ],
          Text(
            text,
            style: textStyle ?? TextStyle(color: effectiveTextColor),
          ),
        ],
      ),
    );
  }
}

@sageLocalWidget
class SageIconButton extends StatelessWidget {
  const SageIconButton({required this.svgUrl, required this.onPressed, this.color, super.key});

  final String svgUrl;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SageImage.asset(url: svgUrl),
    );
  }
}
