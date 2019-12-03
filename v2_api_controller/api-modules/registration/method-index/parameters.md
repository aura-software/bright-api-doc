<table>
  <tr>
    <th>Parameter</th>
    <th>Example</th>
    <th>Notes</th>
  </tr>
   <tr>
     <td>__access method__</td>
	 <td>api_key=[an api key created previously</td>
	 <td>see [Access Modes](#access-modes)</td>
  </tr>
  <tr>
    <td>last_only</td>
	<td>last_only=t</td>
	<td>when included in the parameter string, we will return a single registration
    record, that being the last one created.  Useful in cases where multiple registrations are found and only the most recent one
should be returned.</td>
  </tr>	
  <tr>
    <td>registration_guid</td>
    <td>registration_guid=...</td>
    <td>The SCORM Cloud registration GUID</td>
  </tr>
  <tr>
    <td>course_guid</td>
  	<td>course_guid=a_scorm_cloud_course_id</td>
	<td>filter registrations to the specified course id.</td>
  </tr>	
  <tr>
    <td>learner_id</td>
  	<td>learner_id=jane.doe@me.com</td>
	<td>filter registrations to the specified learner_id.</td>
  </tr>	
  <tr>
    <td>refresh_if_launched</td>
	<td>refresh_if_launched=t</td>
	<td>if the last launch date of this registration is newer than the last crawl date, this will force the record to recrawl prior to returning a result.</td>
  </tr>	
  <tr>
    <td>crawl</td>
  	<td>crawl=t</td>
	<td>forces the registration to recrawl</td>
  </tr>	
  <tr>
    <td>include_deleted</td>
  	<td>include_deleted=t</td>
	<td>By default, deleted registrations are removed from the results.  Adding this flag suppresses this behavior.</td>
  </tr>	
</table>

