The index method allows the api user to fetch a course list.  

When using the course#index method with an Api key, where the API key is for a particular learner, it is often desireable to return
the learner's registration data on each course selected.   This lets the API client avoid having to query the learner's data
for each course returned.   You can do this with the **include_registrations** parameter.
