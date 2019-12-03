
All Bright API calls respond the parameters specified in [List of Parameters Available To All Methods](#api-modules-list-of-parameters-available-to-all-methods).

Parameters unique to this method, not included in above:

###### Control Parameters

Control parameters are not filters and cannot be used with [Using Regular Expression Queries](#quick-start-using-regular-expression-queries).

|Parameter|Example|Description|
|--|--|--|
|include_registrations|include_registrations=t|When access is via accessToken, with an associated user, a nested record showing the user's most recent registration to the course.|

###### Filter Parameters

Filter parameters restrict the rows to be returned.   Any filter parameter can be used with a regular expression, see [Using Regular Expression Queries](#quick-start-using-regular-expression-queries).


|Parameter|Example|Description|
|--|--|--|
|course_guid|course_guid=ACourseID|For a SCORMCloud course, this will match the course ID in scormcloud.  See also <a href="https://help.aura-software.com/finding-a-course-id-in-scormcloud/">Finding Your Course ID in SCORMCloud.|
|title|title=My%20Course|An exact match of the course Title. Don't forget to URI encode your data.|
|custom|custom=SomeCustomText|An exact match of the course custom. Don't forget to URI encode your data.  Much more useful with 'custom_re', as described in [Using Regular Expression Queries](#quick-start-using-regular-expression-queries)|
|id|id=[a course GUID]|As the Course GUID is the unique identifier for the course, it can be addressed via the id= construct|  

