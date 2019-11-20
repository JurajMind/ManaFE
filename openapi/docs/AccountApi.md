# openapi.api.AccountApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accountConfirmEmail**](AccountApi.md#accountConfirmEmail) | **POST** /api/Account/api/Account/ConfirmEmail | 
[**accountForgotPassword**](AccountApi.md#accountForgotPassword) | **POST** /api/Account/ForgotPassword | 
[**accountRegister**](AccountApi.md#accountRegister) | **POST** /api/Account/Register | 
[**accountResetPassword**](AccountApi.md#accountResetPassword) | **POST** /api/Account/api/Account/ResetPassword | 


# **accountConfirmEmail**
> Object accountConfirmEmail(userId, code)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AccountApi();
var userId = userId_example; // String | 
var code = code_example; // String | 

try { 
    var result = api_instance.accountConfirmEmail(userId, code);
    print(result);
} catch (e) {
    print("Exception when calling AccountApi->accountConfirmEmail: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | [default to null]
 **code** | **String**|  | [default to null]

### Return type

[**Object**](Object.md)

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

var api_instance = new AccountApi();
var model = new SmartHookahModelsForgotPasswordViewModel(); // SmartHookahModelsForgotPasswordViewModel | 

try { 
    var result = api_instance.accountForgotPassword(model);
    print(result);
} catch (e) {
    print("Exception when calling AccountApi->accountForgotPassword: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **model** | [**SmartHookahModelsForgotPasswordViewModel**](SmartHookahModelsForgotPasswordViewModel.md)|  | 

### Return type

[**Object**](Object.md)

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

var api_instance = new AccountApi();
var userModel = new UserModel(); // UserModel | 

try { 
    var result = api_instance.accountRegister(userModel);
    print(result);
} catch (e) {
    print("Exception when calling AccountApi->accountRegister: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userModel** | [**UserModel**](UserModel.md)|  | 

### Return type

[**Object**](Object.md)

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

var api_instance = new AccountApi();
var userId = userId_example; // String | 
var code = code_example; // String | 

try { 
    var result = api_instance.accountResetPassword(userId, code);
    print(result);
} catch (e) {
    print("Exception when calling AccountApi->accountResetPassword: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **String**|  | [default to null]
 **code** | **String**|  | [default to null]

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

