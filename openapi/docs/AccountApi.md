# openapi.api.AccountApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**accountForgotPassword**](AccountApi.md#accountForgotPassword) | **POST** /api/Account/ForgotPassword | 
[**accountRegister**](AccountApi.md#accountRegister) | **POST** /api/Account/Register | 


# **accountForgotPassword**
> Object accountForgotPassword(smartHookahModelsForgotPasswordViewModel)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new AccountApi();
var smartHookahModelsForgotPasswordViewModel = new SmartHookahModelsForgotPasswordViewModel(); // SmartHookahModelsForgotPasswordViewModel | 

try { 
    var result = api_instance.accountForgotPassword(smartHookahModelsForgotPasswordViewModel);
    print(result);
} catch (e) {
    print("Exception when calling AccountApi->accountForgotPassword: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **smartHookahModelsForgotPasswordViewModel** | [**SmartHookahModelsForgotPasswordViewModel**](SmartHookahModelsForgotPasswordViewModel.md)|  | 

### Return type

[**Object**](Object.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

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

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

