# openapi.api.CompetitionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**competitionAddEntry**](CompetitionApi.md#competitionaddentry) | **POST** /api/Competition/Add | 
[**competitionClean**](CompetitionApi.md#competitionclean) | **DELETE** /api/Competition/Clean | 
[**competitionGetResults**](CompetitionApi.md#competitiongetresults) | **GET** /api/Competition/Results | 


# **competitionAddEntry**
> bool competitionAddEntry(name, time)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCompetitionApi();
final String name = name_example; // String | 
final double time = 1.2; // double | 

try {
    final response = api.competitionAddEntry(name, time);
    print(response);
} catch on DioError (e) {
    print('Exception when calling CompetitionApi->competitionAddEntry: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | 
 **time** | **double**|  | 

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **competitionClean**
> bool competitionClean()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCompetitionApi();

try {
    final response = api.competitionClean();
    print(response);
} catch on DioError (e) {
    print('Exception when calling CompetitionApi->competitionClean: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**bool**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **competitionGetResults**
> List<SmartHookahModelsRedisCompetitionEntry> competitionGetResults()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getCompetitionApi();

try {
    final response = api.competitionGetResults();
    print(response);
} catch on DioError (e) {
    print('Exception when calling CompetitionApi->competitionGetResults: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List&lt;SmartHookahModelsRedisCompetitionEntry&gt;**](SmartHookahModelsRedisCompetitionEntry.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

