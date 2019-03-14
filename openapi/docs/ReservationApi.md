# openapi.api.ReservationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**reservationAddTable**](ReservationApi.md#reservationAddTable) | **POST** /api/Reservations/{id}/AddTable | 
[**reservationCancelReservation**](ReservationApi.md#reservationCancelReservation) | **POST** /api/Reservations/{id}/Cancel | 
[**reservationCreate**](ReservationApi.md#reservationCreate) | **POST** /api/Reservations/Create | 
[**reservationGetManagereservationsInfo**](ReservationApi.md#reservationGetManagereservationsInfo) | **GET** /api/Reservations/{id}/Manage | 
[**reservationGetPersonReservations**](ReservationApi.md#reservationGetPersonReservations) | **GET** /api/Reservations/Person | 
[**reservationGetReservationDetail**](ReservationApi.md#reservationGetReservationDetail) | **GET** /api/Reservations/{id}/Detail | 
[**reservationGetReservationUsage**](ReservationApi.md#reservationGetReservationUsage) | **GET** /api/Reservations/{id}/Usage | 
[**reservationGetReservations**](ReservationApi.md#reservationGetReservations) | **GET** /api/Reservations/Reservations | 
<<<<<<< HEAD
[**reservationUpdateReservationState**](ReservationApi.md#reservationUpdateReservationState) | **POST** /api/Reservations/{id}/UpdateState/{state} | 
=======
[**reservationRemoveTable**](ReservationApi.md#reservationRemoveTable) | **DELETE** /api/Reservations/{id}/RemoveTable | 
[**reservationUpdateReservationState**](ReservationApi.md#reservationUpdateReservationState) | **POST** /api/Reservations/{id}/UpdateState | 
>>>>>>> 19bc15211d6023d79b2be68db25d3fcfb9567f9a


# **reservationAddTable**
> ReservationDto reservationAddTable(id, body)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 
var body = new int(); // int | 

try { 
    var result = api_instance.reservationAddTable(id, body);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationAddTable: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **body** | **int**|  | 

### Return type

[**ReservationDto**](ReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationCancelReservation**
> bool reservationCancelReservation(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 

try { 
    var result = api_instance.reservationCancelReservation(id);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationCancelReservation: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationCreate**
> ReservationDto reservationCreate(reservationDto)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var reservationDto = new ReservationDto(); // ReservationDto | 

try { 
    var result = api_instance.reservationCreate(reservationDto);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationCreate: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservationDto** | [**ReservationDto**](ReservationDto.md)|  | 

### Return type

[**ReservationDto**](ReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetManagereservationsInfo**
> ReservationManageDto reservationGetManagereservationsInfo(id, date)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 
var date = 2013-10-20T19:20:30+01:00; // DateTime | 

try { 
    var result = api_instance.reservationGetManagereservationsInfo(id, date);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationGetManagereservationsInfo: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **date** | **DateTime**|  | [default to null]

### Return type

[**ReservationManageDto**](ReservationManageDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetPersonReservations**
> List<ReservationDto> reservationGetPersonReservations()



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();

try { 
    var result = api_instance.reservationGetPersonReservations();
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationGetPersonReservations: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<ReservationDto>**](ReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetReservationDetail**
> ReservationDetailDto reservationGetReservationDetail(id)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 

try { 
    var result = api_instance.reservationGetReservationDetail(id);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationGetReservationDetail: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]

### Return type

[**ReservationDetailDto**](ReservationDetailDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetReservationUsage**
> SmartHookahServicesPlaceReservationUsageDto reservationGetReservationUsage(id, date)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 
var date = 2013-10-20T19:20:30+01:00; // DateTime | 

try { 
    var result = api_instance.reservationGetReservationUsage(id, date);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationGetReservationUsage: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **date** | **DateTime**|  | [default to null]

### Return type

[**SmartHookahServicesPlaceReservationUsageDto**](SmartHookahServicesPlaceReservationUsageDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetReservations**
> List<ReservationDto> reservationGetReservations(from, to)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var from = 2013-10-20T19:20:30+01:00; // DateTime | 
var to = 2013-10-20T19:20:30+01:00; // DateTime | 

try { 
    var result = api_instance.reservationGetReservations(from, to);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationGetReservations: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **DateTime**|  | [default to null]
 **to** | **DateTime**|  | [default to null]

### Return type

[**List<ReservationDto>**](ReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

<<<<<<< HEAD
# **reservationUpdateReservationState**
> bool reservationUpdateReservationState(id, state)
=======
# **reservationRemoveTable**
> ReservationDto reservationRemoveTable(id, body)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 
var body = new int(); // int | 

try { 
    var result = api_instance.reservationRemoveTable(id, body);
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationRemoveTable: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
 **body** | **int**|  | 

### Return type

[**ReservationDto**](ReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationUpdateReservationState**
> bool reservationUpdateReservationState(id, body)
>>>>>>> 19bc15211d6023d79b2be68db25d3fcfb9567f9a



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new ReservationApi();
var id = 56; // int | 
<<<<<<< HEAD
var state = state_example; // String | 

try { 
    var result = api_instance.reservationUpdateReservationState(id, state);
=======
var body = new String(); // String | 

try { 
    var result = api_instance.reservationUpdateReservationState(id, body);
>>>>>>> 19bc15211d6023d79b2be68db25d3fcfb9567f9a
    print(result);
} catch (e) {
    print("Exception when calling ReservationApi->reservationUpdateReservationState: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [default to null]
<<<<<<< HEAD
 **state** | **String**|  | [default to null]
=======
 **body** | **String**|  | 
>>>>>>> 19bc15211d6023d79b2be68db25d3fcfb9567f9a

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

<<<<<<< HEAD
 - **Content-Type**: Not defined
=======
 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
>>>>>>> 19bc15211d6023d79b2be68db25d3fcfb9567f9a
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

