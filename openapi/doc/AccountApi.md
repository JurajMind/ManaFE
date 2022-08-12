# openapi.api.AccountApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accountConfirmEmail**](AccountApi.md#accountconfirmemail) | **POST** /api/Account/api/Account/ConfirmEmail | 
[**accountForgotPassword**](AccountApi.md#accountforgotpassword) | **POST** /api/Account/ForgotPassword | 
[**accountRegister**](AccountApi.md#accountregister) | **POST** /api/Account/Register | 
[**accountResetPassword**](AccountApi.md#accountresetpassword) | **POST** /api/Account/api/Account/ResetPassword | 


# **accountConfirmEmail**
> Object accountConfirmEmail(userId, code)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAccountApi();
final String userId = userId_example; // String | 
final String code = code_example; // String | 

try {
    final response = api.accountConfirmEmail(userId, code);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountApi->accountConfirmEmail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **code** | **String**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountForgotPassword**
> Object accountForgotPassword(model)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAccountApi();
final SmartHookahModelsForgotPasswordViewModel model = ; // SmartHookahModelsForgotPasswordViewModel | 

try {
    final response = api.accountForgotPassword(model);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountApi->accountForgotPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **model** | [**SmartHookahModelsForgotPasswordViewModel**](SmartHookahModelsForgotPasswordViewModel.md)|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountRegister**
> Object accountRegister(userModel)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAccountApi();
final UserModel userModel = ; // UserModel | 

try {
    final response = api.accountRegister(userModel);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountApi->accountRegister: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userModel** | [**UserModel**](UserModel.md)|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **accountResetPassword**
> Object accountResetPassword(userId, code)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAccountApi();
final String userId = userId_example; // String | 
final String code = code_example; // String | 

try {
    final response = api.accountResetPassword(userId, code);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AccountApi->accountResetPassword: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | 
 **code** | **String**|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

