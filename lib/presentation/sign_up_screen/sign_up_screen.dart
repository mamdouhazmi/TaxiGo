import 'package:flutter/material.dart';
import 'package:taxigo/country.dart';
import 'package:taxigo/country_pickers.dart';
import '../core/app_export.dart';
import '../theme/custom_style.dart';
import '../widgets/app_bar/appbar_leading_image.dart';
import '../widgets/app_bar/appbar_title.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_checkbox_button.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_phone_number.dart';
import '../widgets/custom_text_form_field.dart';

// ignore for file: must be immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController nameInputController = TextEditingController();
  TextEditingController emailInputController = TextEditingController();
  Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('880');
  TextEditingController phoneNumberController = TextEditingController();
  List<String> dropdownItemList = ['Item One', 'Item Two', 'Item Three'];
  bool termsAgreementCheckbox = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 14.h,
                  top: 18.h,
                  right: 14.h,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign up ",
                        style: CustomTextStyles.headlineSmallOnPrimary,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    _buildNameInput(context),
                    SizedBox(height: 20.h),
                    _buildEmailInput(context),
                    SizedBox(height: 20.h),
                    _buildPhoneNumber(context),
                    SizedBox(height: 20.h),
                    CustomDropDown(
                      hintText: "Gender",
                      items: dropdownItemList,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                        vertical: 16.h,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _buildTermsAgreementCheckbox(context),
                    SizedBox(height: 18.h),
                    _buildSignUpButton(context),
                    SizedBox(height: 16.h),
                    _buildDividerRow(context),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomIconButton(
                          height: 48.h,
                          width: 48.h,
                          padding: EdgeInsets.all(14.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgGmail,
                          ),
                        ),
                        SizedBox(width: 14.h),
                        CustomIconButton(
                          height: 48.h,
                          width: 48.h,
                          padding: EdgeInsets.all(12.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgSocialSignUpDefault,
                          ),
                        ),
                        SizedBox(width: 14.h),
                        CustomIconButton(
                          height: 48.h,
                          width: 48.h,
                          padding: EdgeInsets.all(12.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgUser,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 52.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: CustomTextStyles.titleMediumGray700_1,
                          ),
                          TextSpan(
                            text: "Sign in",
                            style: CustomTextStyles.titleMediumOnErrorContainer,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 38.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 32.h,
      leading: AppBarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 8.h),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      title: AppBarTitle(
        text: "Back",
        margin: EdgeInsets.only(left: 5.h),
      ),
    );
  }

  Widget _buildNameInput(BuildContext context) {
    return CustomTextFormField(
      controller: nameInputController,
      hintText: "Name",
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 16.h,
      ),
    );
  }

  Widget _buildEmailInput(BuildContext context) {
    return CustomTextFormField(
      controller: emailInputController,
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 16.h,
      ),
    );
  }

  Widget _buildPhoneNumber(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomPhoneNumber(
        country: selectedCountry,
        controller: phoneNumberController,
        onTap: (Country value) {
          selectedCountry = value;
        },
      ),
    );
  }

  Widget _buildTermsAgreementCheckbox(BuildContext context) {
    return CustomCheckboxButton(
      text:
          "By signing up, you agree to the Terms of service and\nPrivacy policy.",
      isExpandedText: true,
      value: termsAgreementCheckbox,
      onChange: (value) {
        termsAgreementCheckbox = value;
      },
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Sign Up",
      buttonStyle: CustomButtonStyles.fillOnErrorContainer,
      buttonTextStyle: CustomTextStyles.titleMediumPrimary,
    );
  }

  Widget _buildDividerRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(),
          ),
          SizedBox(width: 6.h),
          Text(
            "or",
            style: CustomTextStyles.titleMediumOnErrorContainer,
          ),
          SizedBox(width: 6.h),
          Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
