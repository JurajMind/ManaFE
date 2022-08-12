# openapi.api.ReservationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**reservationAddLateTime**](ReservationApi.md#reservationaddlatetime) | **POST** /api/Reservations/{id}/AddLateTime | 
[**reservationAddTable**](ReservationApi.md#reservationaddtable) | **POST** /api/Reservations/{id}/AddTable | 
[**reservationCancelReservation**](ReservationApi.md#reservationcancelreservation) | **POST** /api/Reservations/{id}/Cancel | 
[**reservationCreate**](ReservationApi.md#reservationcreate) | **POST** /api/Reservations/Create | 
[**reservationGetManagereservationsInfo**](ReservationApi.md#reservationgetmanagereservationsinfo) | **GET** /api/Reservations/{id}/Manage | 
[**reservationGetPersonReservations**](ReservationApi.md#reservationgetpersonreservations) | **GET** /api/Reservations/Person | 
[**reservationGetReservationDetail**](ReservationApi.md#reservationgetreservationdetail) | **GET** /api/Reservations/{id}/Detail | 
[**reservationGetReservationUsage**](ReservationApi.md#reservationgetreservationusage) | **GET** /api/Reservations/{id}/Usage | 
[**reservationGetReservations**](ReservationApi.md#reservationgetreservations) | **GET** /api/Reservations/Reservations | 
[**reservationRemoveTable**](ReservationApi.md#reservationremovetable) | **DELETE** /api/Reservations/{id}/RemoveTable | 
[**reservationUpdateReservationState**](ReservationApi.md#reservationupdatereservationstate) | **POST** /api/Reservations/{id}/UpdateState | 


# **reservationAddLateTime**
> PlacesReservationsReservationDto reservationAddLateTime(id, time)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();
final int id = 56; // int | 
final int time = 56; // int | 

try {
    final response = api.reservationAddLateTime(id, time);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->reservationAddLateTime: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **time** | **int**|  | 

### Return type

[**PlacesReservationsReservationDto**](PlacesReservationsReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationAddTable**
> PlacesReservationsReservationDto reservationAddTable(id, tableId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();
final int id = 56; // int | 
final int tableId = 56; // int | 

try {
    final response = api.reservationAddTable(id, tableId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->reservationAddTable: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **tableId** | **int**|  | 

### Return type

[**PlacesReservationsReservationDto**](PlacesReservationsReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationCancelReservation**
> bool reservationCancelReservation(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();
final int id = 56; // int | 

try {
    final response = api.reservationCancelReservation(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->reservationCancelReservation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationCreate**
> PlacesReservationsReservationDto reservationCreate(reservation)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();
final PlacesReservationsReservationDto reservation = ; // PlacesReservationsReservationDto | 

try {
    final response = api.reservationCreate(reservation);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->reservationCreate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reservation** | [**PlacesReservationsReservationDto**](PlacesReservationsReservationDto.md)|  | 

### Return type

[**PlacesReservationsReservationDto**](PlacesReservationsReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetManagereservationsInfo**
> PlacesReservationsReservationManageDto reservationGetManagereservationsInfo(id, date)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();
final int id = 56; // int | 
final DateTime date = 2013-10-20T19:20:30+01:00; // DateTime | 

try {
    final response = api.reservationGetManagereservationsInfo(id, date);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->reservationGetManagereservationsInfo: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **date** | **DateTime**|  | 

### Return type

[**PlacesReservationsReservationManageDto**](PlacesReservationsReservationManageDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetPersonReservations**
> List<PlacesReservationsReservationDto> reservationGetPersonReservations()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();

try {
    final response = api.reservationGetPersonReservations();
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->reservationGetPersonReservations: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;PlacesReservationsReservationDto&gt;**](PlacesReservationsReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetReservationDetail**
> PlacesReservationsReservationDetailDto reservationGetReservationDetail(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();
final int id = 56; // int | 

try {
    final response = api.reservationGetReservationDetail(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->reservationGetReservationDetail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**PlacesReservationsReservationDetailDto**](PlacesReservationsReservationDetailDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetReservationUsage**
> SmartHookahServicesPlaceReservationUsageDto reservationGetReservationUsage(id, date)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();
final int id = 56; // int | 
final DateTime date = 2013-10-20T19:20:30+01:00; // DateTime | 

try {
    final response = api.reservationGetReservationUsage(id, date);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->reservationGetReservationUsage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **date** | **DateTime**|  | 

### Return type

[**SmartHookahServicesPlaceReservationUsageDto**](SmartHookahServicesPlaceReservationUsageDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationGetReservations**
> List<PlacesReservationsReservationDto> reservationGetReservations(from, to)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();
final DateTime from = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime to = 2013-10-20T19:20:30+01:00; // DateTime | 

try {
    final response = api.reservationGetReservations(from, to);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->reservationGetReservations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **DateTime**|  | 
 **to** | **DateTime**|  | 

### Return type

[**List&lt;PlacesReservationsReservationDto&gt;**](PlacesReservationsReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationRemoveTable**
> PlacesReservationsReservationDto reservationRemoveTable(id, tableId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();
final int id = 56; // int | 
final int tableId = 56; // int | 

try {
    final response = api.reservationRemoveTable(id, tableId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->reservationRemoveTable: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **tableId** | **int**|  | 

### Return type

[**PlacesReservationsReservationDto**](PlacesReservationsReservationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reservationUpdateReservationState**
> bool reservationUpdateReservationState(id, state)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getReservationApi();
final int id = 56; // int | 
final String state = state_example; // String | 

try {
    final response = api.reservationUpdateReservationState(id, state);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReservationApi->reservationUpdateReservationState: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **state** | **String**|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

