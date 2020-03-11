# openapi.api.CompetitionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://devmana.azurewebsites.net*

Method | HTTP request | Description
------------- | ------------- | -------------
[**competitionAddEntry**](CompetitionApi.md#competitionAddEntry) | **POST** /api/Competition/Add | 
[**competitionClean**](CompetitionApi.md#competitionClean) | **DELETE** /api/Competition/Clean | 
[**competitionGetResults**](CompetitionApi.md#competitionGetResults) | **GET** /api/Competition/Results | 


# **competitionAddEntry**
> bool competitionAddEntry(name, time)



### Example 
```dart
import 'package:openapi/api.dart';

var api_instance = new CompetitionApi();
var name = name_example; // String | 
var time = 1.2; // double | 

try { 
    var result = api_instance.competitionAddEntry(name, time);
    print(result);
} catch (e) {
    print("Exception when calling CompetitionApi->competitionAddEntry: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | [default to null]
 **time** | **double**|  | [default to null]

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

var api_instance = new CompetitionApi();

try { 
    var result = api_instance.competitionClean();
    print(result);
} catch (e) {
    print("Exception when calling CompetitionApi->competitionClean: $e\n");
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

var api_instance = new CompetitionApi();

try { 
    var result = api_instance.competitionGetResults();
    print(result);
} catch (e) {
    print("Exception when calling CompetitionApi->competitionGetResults: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<SmartHookahModelsRedisCompetitionEntry>**](SmartHookahModelsRedisCompetitionEntry.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/json, application/xml, text/xml, multipart/form-data

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

