#!/usr/bin/env ruby

require 'ckuru-tools'
load 'lib/markup.rb'
load 'lib/markup/doc.rb'
load 'lib/markup/section.rb'
load 'lib/bright_api_parameter.rb'
load 'lib/bright_api_method.rb'

apiDocSpecification = {
  # Top Level Sections.  If there's an empty hash here, you can find the full document in [for example]:
  # md/v2_api_controller/introduction.md
  'Introduction' => {},
  'General Usage' => {
    'RESTful API' => {
      'Determining your :id for create and update' => {},
    },
    'List of Available Resources' => {},
    'Special Considerations for Cross-Browser Scripting Restrictions' => {}
  },
  'Quick Start' => {
    'Using The Examples' => {},
    'Prerequisite Data' => {},
    'Specifying a results format' => {
      'Overview' => {},
      'Fetching an XML result' => {},
      'Fetching an JSON result' => {},
      'Fetching a CSV result' => {},
    },
    'Using Regular Expression Queries' => {
                                           'Complex Example' => {},
                                           'Using Multiple Expressions On The Same Field.' => {},
                                          },
    'Specifying the List Of Fields To Be Returned' => {
                                                      },
  },
  'Access Modes' => {
    'Via Bright API Key' => {},
    'Via Realm ID and Secret Key' => {},
    'Via SCORMCloud App ID and Secret Key' => {},
  },
  'API Modules' => {
    'List Of Parameters Available To All Methods' => {},
    'API Key' => {
      'Method: create' => {
        'HTTP Model:' => {},
        'Parameters' => {},
        'Return Data' => {},
        'Example:' => {},
        'HTTP Codes' => {},
      },
    },
    'Course' => {
      'Determining your :id for create and update' => {},
#      'Format of Return Data' => {},
      'Method: Index' => {
        'HTTP Model:' => {},
        'Parameters' => {},
        'Example' => {},
        'HTTP Codes' => {},
      },
    },
    'Invitation' => {
      'Method: add_learners' => BrightApiMethod.new(
        realm_only_api: true,
        http_model: 'invitation/add_learners[.format]?param1=value1&...',
        parameters: {
          'api_template' => BrightApiParameter.new(
            example: '(public|extended)',
            notes: 'When set to "extended", the response will include three fields, "record", "messages", and "registration_guids".  The "record" is the invitation, and "registration_guids" includes a complex document that can be used to determine if the user in question actualy received their course registrations.   This is high useful in the case of invitations used implement license keys.  For this type, a user can be added to an invitation without seats available for one or more courses.  In this case, the registration_guids document can be used to determine if the user is actually registered to the courses associated with the invitation.  Messages contains information from the license key processor relevant for user feedback.'),
          'learners' => BrightApiParameter.new(
            example: '["users1@exampledomain.com","user2@anotherexample.com"]',
            notes: 'URI encoded array of strings, where each string is an email address.  These learners will be added to the invitation, and will receive registrations for the courses associated with the invitation [license data dependent].  ',
            ),
          'name' => BrightApiParameter.new(
            example: 'myinvitation',
            notes: 'you must specify the invitation by name.  Failure to do so, or to specify a valid invitation name, will result in a return code of 404'
            ),
          'nodelay' => BrightApiParameter.new(
            example: 'true',
            notes: 'External initialization of registrations will occur synchronously [request will block until they are completed].  The default is asynchronous initialization'
            ),
          'skip_external_initialization'  => BrightApiParameter.new(
            example: 'true',
            notes: 'Useful in tests scenarios.  The registrations created won\'t be externally initialized in the course provider like SCORMCloud'
            ),
          'unlearners' => BrightApiParameter.new(
            example: '["users1@exampledomain.com","user2@anotherexample.com"]',
            notes: 'URI encoded array of strings, where each string is an email address.  These learners will be removed from the invitation.  Associated registrations will be marked inactive.',
            )
          },
        http_codes: {
          '200' => 'Success; items returned.  If show_registration_guids is set to true, the return document is altered.  See the documentation for that parameter for more information.',
          '401' => 'If you do not pass a valid realm_guid/realm_secret_key, you will receive HTTP 401',
          '404' => '(not found); The value passed in via your name parameter did not match an invitation for this realm',
          '500' => 'An illegal request, such as a malformed argument',
        },
        ),
    },
    'Realm User' => {
      'Method: index' => BrightApiMethod.new(
        realm_only_api: true,
        http_model: 'realm_user[.format]?param1=value1&...',
        parameters: {
          'email' => BrightApiParameter.new(
            example: 'jane.doe@me.com',
            notes: 'filter results to just this email address.'),
        },
        http_codes: {
          '200' => 'Success; items returned',
          '401' => 'If you do not specify a valid api_key, sc_app_id/sc_secret_key or realm_guid/realm_secret_key, you will receive HTTP 401',
          '500' => 'An illegal request, such as a malformed argument',
        }
        ),
      'Method: create' => {
        'Parameters' => {},
        'HTTP Codes' => {},
        'Example' => {},
      },
      'Method: update (gupdate)' => {
        'Parameters' => {},
        'HTTP Codes' => {},
        'Example' => {},
      },
    },
    'Registration' => {
      'Determining your :id for create and update' => {},
      'Format of return data' => {},
      'Method: index' => BrightApiMethod.new(
        http_model: 'registration[.format]?param1=value1&...',
        parameters: {
          last_only: BrightApiParameter.new(
            example: 't',
            notes: 'when included in the parameter string, we will return a single registration record, that being the last one created.  Useful in cases where multiple registrations are found and only the most recent one should be returned.'),
          course_guid: BrightApiParameter.new(
            example: '[a scorm cloud course id]',
            notes: 'filter results to just this SCORMCloud course ID'),
          learner_id: BrightApiParameter.new(
            example: 'jane.doe@me.com',
            notes: 'filter results to just this email address.'),
          refresh_if_launched: BrightApiParameter.new(
            example: 't',
            notes: 'if the last launch date of this registration is newer than the last crawl date, this will force the record to recrawl prior to returning a result.'),
          crawl: BrightApiParameter.new(
            example: 't',
            notes: 'forces the registration to recrawl')
        },
        http_codes: {
          '200' => 'Success; items returned',
          '401' => 'If you do not specify a valid api_key, sc_app_id/sc_secret_key or realm_guid/realm_secret_key, you will receive HTTP',
          '500' => 'An illegal request, such as a malformed argument',
        }
        ),
      'Method: create' => {
        'Parameters' => {},
        'HTTP Codes' => {},
        'Example' => {},
      },
      'Method: launch_url' => BrightApiMethod.new(
        http_model: 'registration/[registration_guid]/launch_url.[format=xml|json|csv]?params...',
        parameters: {
          'launching' => BrightApiParameter.new(
            example: '?launching=1',
            notes: 'Deprecated.  Historically, caused the creation of a launchHistory record in Bright; which is now deprecated'
            ),
          'review' => BrightApiParameter.new(
            example: '?review=1',
            notes: 'Specifies the course will be launched in review mode and progress will not be tracked'
            ),
          'redirect_url' => BrightApiParameter.new(
            example: '?redirect_url=[uri encodeed URL]',
            notes: 'When the user exits the course, the browser window will redirect to this URL'
            ),
          'tags' => BrightApiParameter.new(
            example: '?tags=[uri encoded list of course tags]',
            notes: 'Feature included for backward compatibility with the SCORMCloud plugin for WordPress.   When a course was launched from a page/post, the course was auto-tagged with the page category.'
            ),
        },
        http_codes: {
          '200' => 'Success; items returned',
          '401' => 'If you do not specify a valid api_key, sc_app_id/sc_secret_key or realm_guid/realm_secret_key, you will receive HTTP',
          '500' => 'An illegal request, such as a malformed argument',
        }
      ),
    },
    'StoredQuery' => {
      'Method: initialize' => BrightApiMethod.new(
        http_model: 'initialize[.format]',
        http_codes: {
          '200' => 'Success; items returned',
          '401' => 'If you do not specify a valid api_key, sc_app_id/sc_secret_key or realm_guid/realm_secret_key, you will receive HTTP 401',
        }
        ),
      'Method: run' => BrightApiMethod.new(
        http_model: 'run[.format]?name=[query-name]&...',
        parameters: {
          'name' => BrightApiParameter.new(
            example: 'myStoredQuery',
            notes: 'this is the query to run.  Note for "builtin" queries, these are available for all realms and you will need to set query_scope=bright'
          ),
          'query_scope' => BrightApiParameter.new(
            example: 'bright',
            notes: 'when set to "bright", the indication is this stored query is generic, not custom to your course provider or realm'),
          'format' => BrightApiParameter.new(
            example: 'csv|json|xml',
            notes: 'defines the format the data should be returned as.  Will set the content type of the response'),
        },
        http_codes: {
          '200' => 'Success; items returned',
          '401' => 'If you do not specify a valid api_key, sc_app_id/sc_secret_key or realm_guid/realm_secret_key, you will receive HTTP 401',
          '404' => 'A typical result when no stored query is found for your name= paramter',
          '500' => 'An illegal request, such as a malformed argument',
        }
        )
    },
    'Template' => {
      'Method: index' => BrightApiMethod.new(
        realm_only_api: true,
        http_model: 'template[.format]?param1=value1&...',
        parameters: {
          'name' => BrightApiParameter.new(
            example: 'My Template',
            notes: 'filter results to just this name.'
          ),
          'markup' => BrightApiParameter.new(
            example: 'handlebars',
            notes: 'filter results to just this markup.'
          ),
          'mimetype' => BrightApiParameter.new(
            example: 'text/html',
            notes: 'filter results to just this mimetype.'
          ),
        },
        http_codes: {
          '200' => 'Success; items returned',
          '401' => 'If you do not specify a valid api_key, sc_app_id/sc_secret_key or realm_guid/realm_secret_key, you will receive HTTP 401',
          '500' => 'An illegal request, such as a malformed argument',
        }
      ),
      'Method: create' => {
        'Parameters' => {
        },
        'HTTP Codes' => {},
        'Example' => {},
      },
      'Method: update (gupdate)' => {
        'Parameters' => {},
        'HTTP Codes' => {},
        'Example' => {},
      },
    },
  },
  'Debugging Errors' => {
    'Fetching HTTP Error Codes from a GET Request' => {},
    'Fetching HTTP Error Codes from a POST Request' => {},
    'Debugging Authentication Errors' => {},
  },
}


doc=Markup::Doc.new(title: 'Bright V2 API Specification', path: __FILE__) do |doc|
  Markup.recursively_assign(doc.sections, apiDocSpecification.keys, apiDocSpecification)
end


doc.gen

