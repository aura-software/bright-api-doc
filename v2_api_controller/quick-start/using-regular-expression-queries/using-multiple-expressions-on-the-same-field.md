It is possible to repeatedly query the same field from multiple
regular expressions.  To do this, use a numerical suffix on the query
parameter.  So instead of custom_re, for example, use

 * custom_re0
 * custom_re1

etc.

```shell
wget -qO- 'https://[BRIGHT URL]/bright/api/v2/course.json?[key logic]&
custom_re0=points_available\":\"([4-9]|[1-9]([0-9])+)&custom_re1="category":"onboarding"'
```

Note:

 * This search is full text, including in custom [JSON] text.
 * Therefore you must support JSON syntax include ':' assisgments.

