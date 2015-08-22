assert = require('chai').assert
fields = require('leadconduit-fields')
integration = require('../src/caller_id')

describe 'Caller ID Request', ->

  beforeEach ->
    process.env.WHITEPAGES_CALLER_ID_API_KEY = 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE'
    @vars = lead: { phone_1: '7732658399' }
    @request = integration.request(@vars)

  it 'should have url', ->
    assert.equal @request.url, 'https://proapi.whitepages.com/2.0/phone.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE&phone_number=7732658399&response_type=callerid'

  it 'should be get', ->
    assert.equal 'GET', @request.method

describe 'Caller ID Response', ->
  
  it 'should parse JSON body and return success when criteria matches a Person', ->
    vars = {}
    req = {}
    res =
      status: 200,
      headers:
        'Content-Type': 'application/json'
      body: '{
 "results":[
  "Phone.48f76fef-a2df-4b08-cfe3-bc7128b6f60f.Durable"
 ],
 "dictionary":{
  "Person.5dd6ff04-23ea-4d39-a995-744e64e219a2.Durable":{
   "id":{
    "key":"Person.5dd6ff04-23ea-4d39-a995-744e64e219a2.Durable",
    "url":"https://proapi.whitepages.com/2.0/entity/Person.5dd6ff04-23ea-4d39-a995-744e64e219a2.Durable.json?api_key=a31423a6c88767c6060715e52ec1058a",
    "type":"Person",
    "uuid":"5dd6ff04-23ea-4d39-a995-744e64e219a2",
    "durability":"Durable"
   },
   "type":"Full",
   "names":[
    {
     "salutation":null,
     "first_name":"Anthony",
     "middle_name":"R",
     "last_name":"Stevens",
     "suffix":null,
     "valid_for":null
    }
   ],
   "age_range":{
    "start":40,
    "end":44
   },
   "gender":"Male",
   "locations":null,
   "phones":null,
   "best_name":"Anthony R Stevens",
   "best_location":null
  },
  "Location.fff829d2-82ec-4d45-abe2-04475d7da371.Durable":{
   "id":{
    "key":"Location.fff829d2-82ec-4d45-abe2-04475d7da371.Durable",
    "url":"https://proapi.whitepages.com/2.0/entity/Location.fff829d2-82ec-4d45-abe2-04475d7da371.Durable.json?api_key=a31423a6c88767c6060715e52ec1058a",
    "type":"Location",
    "uuid":"fff829d2-82ec-4d45-abe2-04475d7da371",
    "durability":"Durable"
   },
   "type":"Address",
   "valid_for":null,
   "legal_entities_at":null,
   "city":"Seattle",
   "postal_code":"98199",
   "zip4":"1902",
   "state_code":"WA",
   "country_code":"US",
   "address":"3430 36th Ave W, Seattle WA 98199-1902",
   "house":"3430",
   "street_name":"36th",
   "street_type":"Ave",
   "pre_dir":null,
   "post_dir":"W",
   "apt_number":null,
   "apt_type":null,
   "box_number":null,
   "is_receiving_mail":true,
   "not_receiving_mail_reason":null,
   "usage":"Residential",
   "delivery_point":"SingleUnit",
   "box_type":null,
   "address_type":"Street",
   "lat_long":{
    "latitude":47.651402,
    "longitude":-122.403214,
    "accuracy":"RoofTop"
   },
   "is_deliverable":true,
   "standard_address_line1":"3430 36th Ave W",
   "standard_address_line2":"",
   "standard_address_location":"Seattle WA 98199-1902"
  },
  "Phone.48f76fef-a2df-4b08-cfe3-bc7128b6f60f.Durable":{
   "id":{
    "key":"Phone.48f76fef-a2df-4b08-cfe3-bc7128b6f60f.Durable",
    "url":"https://proapi.whitepages.com/2.0/entity/Phone.48f76fef-a2df-4b08-cfe3-bc7128b6f60f.Durable.json?api_key=a31423a6c88767c6060715e52ec1058a",
    "type":"Phone",
    "uuid":"48f76fef-a2df-4b08-cfe3-bc7128b6f60f",
    "durability":"Durable"
   },
   "line_type":"Mobile",
   "belongs_to":[
    {
     "id":{
      "key":"Person.5dd6ff04-23ea-4d39-a995-744e64e219a2.Durable",
      "url":"https://proapi.whitepages.com/2.0/entity/Person.5dd6ff04-23ea-4d39-a995-744e64e219a2.Durable.json?api_key=a31423a6c88767c6060715e52ec1058a",
      "type":"Person",
      "uuid":"5dd6ff04-23ea-4d39-a995-744e64e219a2",
      "durability":"Durable"
     },
     "valid_for":null,
     "is_historical":false
    }
   ],
   "associated_locations":[
    {
     "id":{
      "key":"Location.fff829d2-82ec-4d45-abe2-04475d7da371.Durable",
      "url":"https://proapi.whitepages.com/2.0/entity/Location.fff829d2-82ec-4d45-abe2-04475d7da371.Durable.json?api_key=a31423a6c88767c6060715e52ec1058a",
      "type":"Location",
      "uuid":"fff829d2-82ec-4d45-abe2-04475d7da371",
      "durability":"Durable"
     },
     "valid_for":null,
     "is_historical":null,
     "contact_type":null,
     "contact_creation_date":null
    }
   ],
   "is_valid":true,
   "phone_number":"2064098427",
   "country_calling_code":"1",
   "extension":null,
   "carrier":"AT&T",
   "do_not_call":true,
   "reputation":{
    "spam_score":2,
    "spam_index":1,
    "level":1,
    "details":[
     {
      "score":2,
      "type":"NotApplicable",
      "category":"NotApplicable"
     }
    ]
   },
   "is_prepaid":null,
   "is_connected":true,
   "best_location":{
    "id":{
     "key":"Location.fff829d2-82ec-4d45-abe2-04475d7da371.Durable",
     "url":"https://proapi.whitepages.com/2.0/entity/Location.fff829d2-82ec-4d45-abe2-04475d7da371.Durable.json?api_key=a31423a6c88767c6060715e52ec1058a",
     "type":"Location",
     "uuid":"fff829d2-82ec-4d45-abe2-04475d7da371",
     "durability":"Durable"
    }
   }
  }
 },
 "messages":[]
}'
    expected =
      caller_id:
        outcome: 'success'
        reason: null
        billable: 1
        phone_number: '2064098427'
        country_code: 'US'
        reputation_level: 1
        is_connected: true
        is_valid: true
        is_prepaid: null
        carrier: 'AT&T'
        line_type: 'Mobile'
        belongs_to:
          name: 'Anthony R Stevens'
          gender: 'Male'
          age_range:
            start: 40
            end: 44
          location:
            address: '3430 36th Ave W, Seattle WA 98199-1902'
            city: 'Seattle'
            state: 'WA'
            postal_code: '98199'
            lat_long:
              latitude: 47.651402
              longitude: -122.403214
            delivery_point: 'SingleUnit'
            is_receiving_mail: true

    response = integration.response(vars, req, res)
    assert.deepEqual response, expected

  it 'should parse JSON body and return success when criteria matches a Business', ->
    vars = {}
    req = {}
    res =
      status: 200,
      headers:
        'Content-Type': 'application/json'
      body: '{
 "results":[
  "Phone.4d796fef-a2df-4b08-cfe3-bc7128b6f6bb.Durable"
 ],
 "dictionary":{
  "Business.8250ffff-9c0e-4b9b-9fcc-ab646535ad97.Durable":{
   "id":{
    "key":"Business.8250ffff-9c0e-4b9b-9fcc-ab646535ad97.Durable",
    "url":"https://proapi.whitepages.com/2.0/entity/Business.8250ffff-9c0e-4b9b-9fcc-ab646535ad97.Durable.json?api_key=a31423a6c88767c6060715e52ec1058a",
    "type":"Business",
    "uuid":"8250ffff-9c0e-4b9b-9fcc-ab646535ad97",
    "durability":"Durable"
   },
   "name":"Whitepages",
   "locations":null,
   "phones":null
  },
  "Location.f680d715-f932-4e68-9e64-9871113a6b81.Durable":{
   "id":{
    "key":"Location.f680d715-f932-4e68-9e64-9871113a6b81.Durable",
    "url":"https://proapi.whitepages.com/2.0/entity/Location.f680d715-f932-4e68-9e64-9871113a6b81.Durable.json?api_key=a31423a6c88767c6060715e52ec1058a",
    "type":"Location",
    "uuid":"f680d715-f932-4e68-9e64-9871113a6b81",
    "durability":"Durable"
   },
   "type":"Address",
   "valid_for":null,
   "legal_entities_at":null,
   "city":"Seattle",
   "postal_code":"98101",
   "zip4":"2603",
   "state_code":"WA",
   "country_code":"US",
   "address":"1301 5th Ave, Seattle, WA 98101-2603",
   "house":"1301",
   "street_name":"5th",
   "street_type":"Ave",
   "pre_dir":null,
   "post_dir":null,
   "apt_number":null,
   "apt_type":null,
   "box_number":null,
   "is_receiving_mail":null,
   "not_receiving_mail_reason":null,
   "usage":null,
   "delivery_point":null,
   "box_type":null,
   "address_type":null,
   "lat_long":{
    "latitude":47.608624,
    "longitude":-122.334442,
    "accuracy":"RoofTop"
   },
   "is_deliverable":false,
   "standard_address_line1":"1301 5th Ave",
   "standard_address_line2":"",
   "standard_address_location":"Seattle, WA 98101-2603"
  },
  "Phone.4d796fef-a2df-4b08-cfe3-bc7128b6f6bb.Durable":{
   "id":{
    "key":"Phone.4d796fef-a2df-4b08-cfe3-bc7128b6f6bb.Durable",
    "url":"https://proapi.whitepages.com/2.0/entity/Phone.4d796fef-a2df-4b08-cfe3-bc7128b6f6bb.Durable.json?api_key=a31423a6c88767c6060715e52ec1058a",
    "type":"Phone",
    "uuid":"4d796fef-a2df-4b08-cfe3-bc7128b6f6bb",
    "durability":"Durable"
   },
   "line_type":"Landline",
   "belongs_to":[
    {
     "id":{
      "key":"Business.8250ffff-9c0e-4b9b-9fcc-ab646535ad97.Durable",
      "url":"https://proapi.whitepages.com/2.0/entity/Business.8250ffff-9c0e-4b9b-9fcc-ab646535ad97.Durable.json?api_key=a31423a6c88767c6060715e52ec1058a",
      "type":"Business",
      "uuid":"8250ffff-9c0e-4b9b-9fcc-ab646535ad97",
      "durability":"Durable"
     },
     "valid_for":null,
     "is_historical":false
    }
   ],
   "associated_locations":[
    {
     "id":{
      "key":"Location.f680d715-f932-4e68-9e64-9871113a6b81.Durable",
      "url":"https://proapi.whitepages.com/2.0/entity/Location.f680d715-f932-4e68-9e64-9871113a6b81.Durable.json?api_key=a31423a6c88767c6060715e52ec1058a",
      "type":"Location",
      "uuid":"f680d715-f932-4e68-9e64-9871113a6b81",
      "durability":"Durable"
     },
     "valid_for":null,
     "is_historical":null,
     "contact_type":null,
     "contact_creation_date":null
    }
   ],
   "is_valid":true,
   "phone_number":"2069735100",
   "country_calling_code":"1",
   "extension":null,
   "carrier":"tw telecom",
   "do_not_call":false,
   "reputation":{
    "spam_score":0,
    "spam_index":1,
    "level":1,
    "details":[
     {
      "score":0,
      "type":"NotApplicable",
      "category":"NotApplicable"
     }
    ]
   },
   "is_prepaid":false,
   "is_connected":true,
   "best_location":{
    "id":{
     "key":"Location.f680d715-f932-4e68-9e64-9871113a6b81.Durable",
     "url":"https://proapi.whitepages.com/2.0/entity/Location.f680d715-f932-4e68-9e64-9871113a6b81.Durable.json?api_key=a31423a6c88767c6060715e52ec1058a",
     "type":"Location",
     "uuid":"f680d715-f932-4e68-9e64-9871113a6b81",
     "durability":"Durable"
    }
   }
  }
 },
 "messages":[]
}'
    expected =
      caller_id:
        outcome: 'success'
        reason: null
        billable: 1
        phone_number: '2069735100'
        country_code: 'US'
        reputation_level: 1
        is_connected: true
        is_valid: true
        is_prepaid: false
        carrier: 'tw telecom'
        line_type: 'Landline'
        belongs_to:
          name: 'Whitepages'
          age_range: null
          gender: null
          location:
            address: '1301 5th Ave, Seattle, WA 98101-2603'
            city: 'Seattle'
            state: 'WA'
            postal_code: '98101'
            lat_long:
              latitude: 47.608624
              longitude: -122.334442
            delivery_point: null
            is_receiving_mail: null

    response = integration.response(vars, req, res)
    assert.deepEqual response, expected

  it 'should parse JSON body and return failure when area code is invalid', ->
    vars = {}
    req = {}
    res =
      status: 200,
      headers:
        'Content-Type': 'application/json'
      body: '
        {
 "results":[
  "Phone.1af76fef-a2e0-4b08-cfe3-bc7128b76159.Ephemeral"
 ],
 "dictionary":{
  "Phone.1af76fef-a2e0-4b08-cfe3-bc7128b76159.Ephemeral":{
   "id":{
    "key":"Phone.1af76fef-a2e0-4b08-cfe3-bc7128b76159.Ephemeral",
    "url":null,
    "type":"Phone",
    "uuid":"1af76fef-a2e0-4b08-cfe3-bc7128b76159",
    "durability":"Ephemeral"
   },
   "line_type":null,
   "belongs_to":[],
   "associated_locations":[],
   "is_valid":false,
   "phone_number":"2964098427",
   "country_calling_code":"1",
   "extension":null,
   "carrier":null,
   "do_not_call":null,
   "reputation":{
    "spam_score":50,
    "spam_index":3,
    "level":3,
    "details":[
     {
      "score":50,
      "type":"Risk",
      "category":"TollFree"
     }
    ]
   },
   "is_prepaid":null,
   "is_connected":false,
   "best_location":null
  }
 },
 "messages":[
  {
   "severity":"warning",
   "type":"input_field",
   "code":"invalid_input",
   "message":"qiWithPhone: invalid area code",
   "ancillary_data":{
    "field":"phone"
   }
  }
 ]
}'
    expected =
      caller_id:
        outcome: 'failure'
        billable: 1
        reason: 'invalid area code'
        
    response = integration.response(vars, req, res)
    assert.deepEqual response, expected

  it 'should parse JSON body and return failure when missing area code', ->
    vars = {}
    req = {}
    res =
      status: 200,
      headers:
        'Content-Type': 'application/json'
      body: '{
 "results":[
  "Phone.12f76fef-a2d6-4b08-cfe3-bc7128b67dfd.Ephemeral"
 ],
 "dictionary":{
  "Phone.12f76fef-a2d6-4b08-cfe3-bc7128b67dfd.Ephemeral":{
   "id":{
    "key":"Phone.12f76fef-a2d6-4b08-cfe3-bc7128b67dfd.Ephemeral",
    "url":null,
    "type":"Phone",
    "uuid":"12f76fef-a2d6-4b08-cfe3-bc7128b67dfd",
    "durability":"Ephemeral"
   },
   "line_type":null,
   "belongs_to":[],
   "associated_locations":[],
   "is_valid":false,
   "phone_number":"4098427",
   "country_calling_code":"1",
   "extension":null,
   "carrier":null,
   "do_not_call":null,
   "reputation":{
    "spam_score":50,
    "spam_index":3,
    "level":3,
    "details":[
     {
      "score":50,
      "type":"Risk",
      "category":"TollFree"
     }
    ]
   },
   "is_prepaid":null,
   "is_connected":null,
   "best_location":null
  }
 },
 "messages":[
  {
   "severity":"warning",
   "type":"input_field",
   "code":"invalid_input",
   "message":"qiWithPhone: missing area code",
   "ancillary_data":{
    "field":"phone"
   }
  }
 ]
}'
    expected =
      caller_id:
        outcome: 'failure'
        reason: 'missing area code'
        billable: 1
        
    response = integration.response(vars, req, res)
    assert.deepEqual response, expected

  it 'should parse JSON body and return error on invalid URI', ->
    vars = {}
    req = {}
    res =
      status: 404,
      headers:
        'Content-Type': 'application/json'
      body: '{"error":{"message":"Invalid Resource URI"}}'
    expected =
      caller_id:
        outcome: 'error'
        billable: 0
        reason: 'WhitePages error: Invalid Resource URI'

    response = integration.response(vars, req, res)
    assert.deepEqual response, expected

  
  it 'should return error outcome on non-200 response status', ->
    vars = {}
    req = {}
    res =
      status: 400,
      headers:
        'Content-Type': 'application/json'
      body: '{"error":{"message":"Some Error"}}'
    expected =
      caller_id:
        outcome: 'error'
        billable: 0
        reason: 'WhitePages error: Some Error'
    response = integration.response(vars, req, res)
    assert.deepEqual response, expected

describe 'Validation', ->

  it 'should not allow null phone', ->
    error = integration.validate(lead: { phone_1: null })
    assert.equal error, 'phone must not be blank'

  it 'should not allow undefined phone', ->
    error = integration.validate(lead: {})
    assert.equal error, 'phone must not be blank'

  it 'should not allow invalid phone', ->
    error = integration.validate(lead: fields.buildLeadVars(phone_1: 'donkey'))
    assert.equal error, 'phone must be valid'

  it 'should not error when phone_1 is valid', ->
    error = integration.validate(lead: fields.buildLeadVars(phone_1: '5127891111'))
    assert.isUndefined error

  it 'should not error when phone_1 is missing the valid key', ->
    error = integration.validate(lead: { phone_1: '5127891111' })
    assert.isUndefined error



  
