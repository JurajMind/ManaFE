# openapi.api.PlaceCalendarApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**placeCalendarCreatePlaceEventFromFacebook**](PlaceCalendarApi.md#placecalendarcreateplaceeventfromfacebook) | **GET** /api/PlaceCalendar/CreateEventFromFacebook | 
[**placeCalendarDeletePlaceDay**](PlaceCalendarApi.md#placecalendardeleteplaceday) | **DELETE** /api/PlaceCalendar/DeletePlaceDay | 
[**placeCalendarDeletePlaceEvent**](PlaceCalendarApi.md#placecalendardeleteplaceevent) | **DELETE** /api/PlaceCalendar/DeletePlaceEvent | 
[**placeCalendarFindEventsBy**](PlaceCalendarApi.md#placecalendarfindeventsby) | **GET** /api/PlaceCalendar/FindEventsBy | 
[**placeCalendarGetPlaceCalendar**](PlaceCalendarApi.md#placecalendargetplacecalendar) | **GET** /api/PlaceCalendar/GetCalendar | 
[**placeCalendarGetPlaceDay**](PlaceCalendarApi.md#placecalendargetplaceday) | **GET** /api/PlaceCalendar/GetPlaceDay | 
[**placeCalendarGetPlaceEvent**](PlaceCalendarApi.md#placecalendargetplaceevent) | **GET** /api/PlaceCalendar/GetPlaceEvent | 
[**placeCalendarSavePlaceDay**](PlaceCalendarApi.md#placecalendarsaveplaceday) | **POST** /api/PlaceCalendar/SavePlaceDay | 
[**placeCalendarSavePlaceEvent**](PlaceCalendarApi.md#placecalendarsaveplaceevent) | **POST** /api/PlaceCalendar/SavePlaceEvent | 


# **placeCalendarCreatePlaceEventFromFacebook**
> Dto placeCalendarCreatePlaceEventFromFacebook(url)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPlaceCalendarApi();
final String url = url_example; // String | 

try {
    final response = api.placeCalendarCreatePlaceEventFromFacebook(url);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PlaceCalendarApi->placeCalendarCreatePlaceEventFromFacebook: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **url** | **String**|  | 

### Return type

[**Dto**](Dto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarDeletePlaceDay**
> Dto placeCalendarDeletePlaceDay(dayId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPlaceCalendarApi();
final int dayId = 56; // int | 

try {
    final response = api.placeCalendarDeletePlaceDay(dayId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PlaceCalendarApi->placeCalendarDeletePlaceDay: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dayId** | **int**|  | 

### Return type

[**Dto**](Dto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarDeletePlaceEvent**
> Dto placeCalendarDeletePlaceEvent(eventId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPlaceCalendarApi();
final int eventId = 56; // int | 

try {
    final response = api.placeCalendarDeletePlaceEvent(eventId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PlaceCalendarApi->placeCalendarDeletePlaceEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 

### Return type

[**Dto**](Dto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarFindEventsBy**
> PlaceEventCollection placeCalendarFindEventsBy(placeId, startsAfter, endsBefore, privacyType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPlaceCalendarApi();
final int placeId = 56; // int | 
final DateTime startsAfter = 2013-10-20T19:20:30+01:00; // DateTime | 
final DateTime endsBefore = 2013-10-20T19:20:30+01:00; // DateTime | 
final String privacyType = privacyType_example; // String | 

try {
    final response = api.placeCalendarFindEventsBy(placeId, startsAfter, endsBefore, privacyType);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PlaceCalendarApi->placeCalendarFindEventsBy: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **int**|  | 
 **startsAfter** | **DateTime**|  | 
 **endsBefore** | **DateTime**|  | 
 **privacyType** | **String**|  | [optional] 

### Return type

[**PlaceEventCollection**](PlaceEventCollection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarGetPlaceCalendar**
> PlaceCalendarDto placeCalendarGetPlaceCalendar(placeId, privacyType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPlaceCalendarApi();
final int placeId = 56; // int | 
final String privacyType = privacyType_example; // String | 

try {
    final response = api.placeCalendarGetPlaceCalendar(placeId, privacyType);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PlaceCalendarApi->placeCalendarGetPlaceCalendar: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **int**|  | 
 **privacyType** | **String**|  | [optional] 

### Return type

[**PlaceCalendarDto**](PlaceCalendarDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarGetPlaceDay**
> PlaceDay placeCalendarGetPlaceDay(placeId, dayId, dayDate, privacyType)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPlaceCalendarApi();
final int placeId = 56; // int | 
final int dayId = 56; // int | 
final DateTime dayDate = 2013-10-20T19:20:30+01:00; // DateTime | 
final String privacyType = privacyType_example; // String | 

try {
    final response = api.placeCalendarGetPlaceDay(placeId, dayId, dayDate, privacyType);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PlaceCalendarApi->placeCalendarGetPlaceDay: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **int**|  | 
 **dayId** | **int**|  | 
 **dayDate** | **DateTime**|  | 
 **privacyType** | **String**|  | [optional] 

### Return type

[**PlaceDay**](PlaceDay.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarGetPlaceEvent**
> PlaceEvent placeCalendarGetPlaceEvent(eventId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPlaceCalendarApi();
final int eventId = 56; // int | 

try {
    final response = api.placeCalendarGetPlaceEvent(eventId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PlaceCalendarApi->placeCalendarGetPlaceEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | 

### Return type

[**PlaceEvent**](PlaceEvent.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarSavePlaceDay**
> Dto placeCalendarSavePlaceDay(placeDay)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPlaceCalendarApi();
final PlaceDay placeDay = ; // PlaceDay | 

try {
    final response = api.placeCalendarSavePlaceDay(placeDay);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PlaceCalendarApi->placeCalendarSavePlaceDay: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeDay** | [**PlaceDay**](PlaceDay.md)|  | 

### Return type

[**Dto**](Dto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarSavePlaceEvent**
> Dto placeCalendarSavePlaceEvent(placeEvent)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPlaceCalendarApi();
final PlaceEvent placeEvent = ; // PlaceEvent | 

try {
    final response = api.placeCalendarSavePlaceEvent(placeEvent);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PlaceCalendarApi->placeCalendarSavePlaceEvent: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeEvent** | [**PlaceEvent**](PlaceEvent.md)|  | 

### Return type

[**Dto**](Dto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/xml, text/xml, multipart/form-data, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

