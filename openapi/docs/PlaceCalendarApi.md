# openapi.api.PlaceCalendarApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**placeCalendarCreatePlaceEventFromFacebook**](PlaceCalendarApi.md#placeCalendarCreatePlaceEventFromFacebook) | **GET** /api/PlaceCalendar/CreateEventFromFacebook | 
[**placeCalendarDeletePlaceDay**](PlaceCalendarApi.md#placeCalendarDeletePlaceDay) | **DELETE** /api/PlaceCalendar/DeletePlaceDay | 
[**placeCalendarDeletePlaceEvent**](PlaceCalendarApi.md#placeCalendarDeletePlaceEvent) | **DELETE** /api/PlaceCalendar/DeletePlaceEvent | 
[**placeCalendarFindEventsBy**](PlaceCalendarApi.md#placeCalendarFindEventsBy) | **GET** /api/PlaceCalendar/FindEventsBy | 
[**placeCalendarGetPlaceCalendar**](PlaceCalendarApi.md#placeCalendarGetPlaceCalendar) | **GET** /api/PlaceCalendar/GetCalendar | 
[**placeCalendarGetPlaceDay**](PlaceCalendarApi.md#placeCalendarGetPlaceDay) | **GET** /api/PlaceCalendar/GetPlaceDay | 
[**placeCalendarGetPlaceEvent**](PlaceCalendarApi.md#placeCalendarGetPlaceEvent) | **GET** /api/PlaceCalendar/GetPlaceEvent | 
[**placeCalendarSavePlaceDay**](PlaceCalendarApi.md#placeCalendarSavePlaceDay) | **POST** /api/PlaceCalendar/SavePlaceDay | 
[**placeCalendarSavePlaceEvent**](PlaceCalendarApi.md#placeCalendarSavePlaceEvent) | **POST** /api/PlaceCalendar/SavePlaceEvent | 


# **placeCalendarCreatePlaceEventFromFacebook**
> Dto placeCalendarCreatePlaceEventFromFacebook(url)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlaceCalendarApi();
var url = url_example; // String | 

try { 
    var result = api_instance.placeCalendarCreatePlaceEventFromFacebook(url);
    print(result);
} catch (e) {
    print("Exception when calling PlaceCalendarApi->placeCalendarCreatePlaceEventFromFacebook: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **url** | **String**|  | [default to null]

### Return type

[**Dto**](Dto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarDeletePlaceDay**
> Dto placeCalendarDeletePlaceDay(dayId)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlaceCalendarApi();
var dayId = 56; // int | 

try { 
    var result = api_instance.placeCalendarDeletePlaceDay(dayId);
    print(result);
} catch (e) {
    print("Exception when calling PlaceCalendarApi->placeCalendarDeletePlaceDay: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **dayId** | **int**|  | [default to null]

### Return type

[**Dto**](Dto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarDeletePlaceEvent**
> Dto placeCalendarDeletePlaceEvent(eventId)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlaceCalendarApi();
var eventId = 56; // int | 

try { 
    var result = api_instance.placeCalendarDeletePlaceEvent(eventId);
    print(result);
} catch (e) {
    print("Exception when calling PlaceCalendarApi->placeCalendarDeletePlaceEvent: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]

### Return type

[**Dto**](Dto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarFindEventsBy**
> PlaceEventCollection placeCalendarFindEventsBy(placeId, startsAfter, endsBefore, privacyType)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlaceCalendarApi();
var placeId = 56; // int | 
var startsAfter = 2013-10-20T19:20:30+01:00; // DateTime | 
var endsBefore = 2013-10-20T19:20:30+01:00; // DateTime | 
var privacyType = privacyType_example; // String | 

try { 
    var result = api_instance.placeCalendarFindEventsBy(placeId, startsAfter, endsBefore, privacyType);
    print(result);
} catch (e) {
    print("Exception when calling PlaceCalendarApi->placeCalendarFindEventsBy: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **int**|  | [default to null]
 **startsAfter** | **DateTime**|  | [default to null]
 **endsBefore** | **DateTime**|  | [default to null]
 **privacyType** | **String**|  | [optional] [default to null]

### Return type

[**PlaceEventCollection**](PlaceEventCollection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarGetPlaceCalendar**
> PlaceCalendarDto placeCalendarGetPlaceCalendar(placeId, privacyType)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlaceCalendarApi();
var placeId = 56; // int | 
var privacyType = privacyType_example; // String | 

try { 
    var result = api_instance.placeCalendarGetPlaceCalendar(placeId, privacyType);
    print(result);
} catch (e) {
    print("Exception when calling PlaceCalendarApi->placeCalendarGetPlaceCalendar: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **int**|  | [default to null]
 **privacyType** | **String**|  | [optional] [default to null]

### Return type

[**PlaceCalendarDto**](PlaceCalendarDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarGetPlaceDay**
> PlaceDay placeCalendarGetPlaceDay(placeId, dayId, dayDate, privacyType)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlaceCalendarApi();
var placeId = 56; // int | 
var dayId = 56; // int | 
var dayDate = 2013-10-20T19:20:30+01:00; // DateTime | 
var privacyType = privacyType_example; // String | 

try { 
    var result = api_instance.placeCalendarGetPlaceDay(placeId, dayId, dayDate, privacyType);
    print(result);
} catch (e) {
    print("Exception when calling PlaceCalendarApi->placeCalendarGetPlaceDay: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **placeId** | **int**|  | [default to null]
 **dayId** | **int**|  | [default to null]
 **dayDate** | **DateTime**|  | [default to null]
 **privacyType** | **String**|  | [optional] [default to null]

### Return type

[**PlaceDay**](PlaceDay.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarGetPlaceEvent**
> PlaceEvent placeCalendarGetPlaceEvent(eventId)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlaceCalendarApi();
var eventId = 56; // int | 

try { 
    var result = api_instance.placeCalendarGetPlaceEvent(eventId);
    print(result);
} catch (e) {
    print("Exception when calling PlaceCalendarApi->placeCalendarGetPlaceEvent: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **eventId** | **int**|  | [default to null]

### Return type

[**PlaceEvent**](PlaceEvent.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarSavePlaceDay**
> Dto placeCalendarSavePlaceDay(placeDay)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlaceCalendarApi();
var placeDay = new PlaceDay(); // PlaceDay | 

try { 
    var result = api_instance.placeCalendarSavePlaceDay(placeDay);
    print(result);
} catch (e) {
    print("Exception when calling PlaceCalendarApi->placeCalendarSavePlaceDay: $e\n");
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

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **placeCalendarSavePlaceEvent**
> Dto placeCalendarSavePlaceEvent(placeEvent)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new PlaceCalendarApi();
var placeEvent = new PlaceEvent(); // PlaceEvent | 

try { 
    var result = api_instance.placeCalendarSavePlaceEvent(placeEvent);
    print(result);
} catch (e) {
    print("Exception when calling PlaceCalendarApi->placeCalendarSavePlaceEvent: $e\n");
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

 - **Content-Type**: application/json, text/json, application/xml, text/xml, application/x-www-form-urlencoded
 - **Accept**: application/json, text/json, application/xml, text/xml

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

