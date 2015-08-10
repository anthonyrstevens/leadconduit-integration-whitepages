assert = require('chai').assert
fields = require('leadconduit-fields')
integration = require('../src/phone')
time = require('timekeeper')


describe 'Phone Request', ->

  beforeEach ->
    time.freeze(new Date('Thu, 31 Jul 2015 17:45:32 +0000'))
    process.env.WHITEPAGES_API_KEY = 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE'
    @vars = lead: { phone_1: '7732658399' }
    @request = integration.request(@vars)

  afterEach ->
    time.reset()

  it 'should have url', ->
    assert.equal @request.url, 'https://proapi.whitepages.com/2.0/phone.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE&phone_number=7732658399'

  it 'should be get', ->
    assert.equal 'GET', @request.method

describe 'Phone Response', ->
  # success is defined as a non-partial transaction with the subscriber status of 'Active'
  # and with a phone_type_code not equal to 6, 7, 8, 9, 11, or 20
  it 'should parse JSON body and return success when criteria matches', ->
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
    "url":"https://proapi.whitepages.com/2.0/entity/Person.5dd6ff04-23ea-4d39-a995-744e64e219a2.Durable.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
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
   "locations":[
    {
     "id":{
      "key":"Location.93c7a0ff-40c3-483c-b95d-483c1f7c2a0b.Durable",
      "url":"https://proapi.whitepages.com/2.0/entity/Location.93c7a0ff-40c3-483c-b95d-483c1f7c2a0b.Durable.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
      "type":"Location",
      "uuid":"93c7a0ff-40c3-483c-b95d-483c1f7c2a0b",
      "durability":"Durable"
     },
     "valid_for":{
      "start":{
       "year":1999,
       "month":9,
       "day":6
      },
      "stop":null
     },
     "is_historical":false,
     "contact_type":"Home",
     "contact_creation_date":1361177170
    }
   ],
   "phones":[
    {
     "id":{
      "key":"Phone.48f76fef-a2df-4b08-cfe3-bc7128b6f60f.Durable",
      "url":"https://proapi.whitepages.com/2.0/entity/Phone.48f76fef-a2df-4b08-cfe3-bc7128b6f60f.Durable.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
      "type":"Phone",
      "uuid":"48f76fef-a2df-4b08-cfe3-bc7128b6f60f",
      "durability":"Durable"
     },
     "valid_for":null,
     "contact_type":"Home",
     "contact_creation_date":1384274570
    },
    {
     "id":{
      "key":"Phone.9f4f6fef-a2df-4b08-cfe3-bc7128b6f605.Durable",
      "url":"https://proapi.whitepages.com/2.0/entity/Phone.9f4f6fef-a2df-4b08-cfe3-bc7128b6f605.Durable.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
      "type":"Phone",
      "uuid":"9f4f6fef-a2df-4b08-cfe3-bc7128b6f605",
      "durability":"Durable"
     },
     "valid_for":{
      "start":{
       "year":1999,
       "month":9,
       "day":6
      },
      "stop":null
     },
     "contact_type":"Home",
     "contact_creation_date":1360022400
    }
   ],
   "best_name":"Anthony R Stevens",
   "best_location":{
    "id":{
     "key":"Location.93c7a0ff-40c3-483c-b95d-483c1f7c2a0b.Durable",
     "url":"https://proapi.whitepages.com/2.0/entity/Location.93c7a0ff-40c3-483c-b95d-483c1f7c2a0b.Durable.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
     "type":"Location",
     "uuid":"93c7a0ff-40c3-483c-b95d-483c1f7c2a0b",
     "durability":"Durable"
    }
   }
  },
  "Location.93c7a0ff-40c3-483c-b95d-483c1f7c2a0b.Durable":{
   "id":{
    "key":"Location.93c7a0ff-40c3-483c-b95d-483c1f7c2a0b.Durable",
    "url":"https://proapi.whitepages.com/2.0/entity/Location.93c7a0ff-40c3-483c-b95d-483c1f7c2a0b.Durable.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
    "type":"Location",
    "uuid":"93c7a0ff-40c3-483c-b95d-483c1f7c2a0b",
    "durability":"Durable"
   },
   "type":"Address",
   "valid_for":null,
   "legal_entities_at":[
    {
     "id":{
      "key":"Person.5dd6ff04-23ea-4d39-a995-744e64e219a2.Durable",
      "url":"https://proapi.whitepages.com/2.0/entity/Person.5dd6ff04-23ea-4d39-a995-744e64e219a2.Durable.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
      "type":"Person",
      "uuid":"5dd6ff04-23ea-4d39-a995-744e64e219a2",
      "durability":"Durable"
     },
     "valid_for":{
      "start":{
       "year":1999,
       "month":9,
       "day":6
      },
      "stop":null
     },
     "is_historical":false
    },
    {
     "id":{
      "key":"Person.b3baf3b1-650e-4c0b-921e-e5e7461303fc.Durable",
      "url":"https://proapi.whitepages.com/2.0/entity/Person.b3baf3b1-650e-4c0b-921e-e5e7461303fc.Durable.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
      "type":"Person",
      "uuid":"b3baf3b1-650e-4c0b-921e-e5e7461303fc",
      "durability":"Durable"
     },
     "valid_for":{
      "start":{
       "year":1999,
       "month":9,
       "day":6
      },
      "stop":null
     },
     "is_historical":false
    }
   ],
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
    "url":"https://proapi.whitepages.com/2.0/entity/Phone.48f76fef-a2df-4b08-cfe3-bc7128b6f60f.Durable.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
    "type":"Phone",
    "uuid":"48f76fef-a2df-4b08-cfe3-bc7128b6f60f",
    "durability":"Durable"
   },
   "line_type":"Mobile",
   "belongs_to":[
    {
     "id":{
      "key":"Person.5dd6ff04-23ea-4d39-a995-744e64e219a2.Durable",
      "url":"https://proapi.whitepages.com/2.0/entity/Person.5dd6ff04-23ea-4d39-a995-744e64e219a2.Durable.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
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
      "key":"Location.93c7a0ff-40c3-483c-b95d-483c1f7c2a0b.Durable",
      "url":"https://proapi.whitepages.com/2.0/entity/Location.93c7a0ff-40c3-483c-b95d-483c1f7c2a0b.Durable.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
      "type":"Location",
      "uuid":"93c7a0ff-40c3-483c-b95d-483c1f7c2a0b",
      "durability":"Durable"
     },
     "valid_for":null,
     "is_historical":false,
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
     "key":"Location.93c7a0ff-40c3-483c-b95d-483c1f7c2a0b.Durable",
     "url":"https://proapi.whitepages.com/2.0/entity/Location.93c7a0ff-40c3-483c-b95d-483c1f7c2a0b.Durable.json?api_key=AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE",
     "type":"Location",
     "uuid":"93c7a0ff-40c3-483c-b95d-483c1f7c2a0b",
     "durability":"Durable"
    }
   }
  }
 },
 "messages":[]
}'
    expected =
      live:
        outcome: "success"
        reason: null
        error: null
        billable: 1
        phone_number: "2064098427"
        country_code: "US"
        reputation:
          level: 1
        is_connected: true
        is_valid: true
        do_not_call: true
        is_prepaid: null
        carrier: "AT&T"
        line_type: "Mobile"

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
      live:
        outcome: "failure"
        billable: 1
        reason: 'invalid area code'
        error: 'invalid area code'
        
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
      live:
        outcome: "failure"
        reason: 'missing area code'
        billable: 1
        error: 'missing area code'

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
      live:
        outcome: "error"
        billable: 0
        reason: "WhitePages error: Invalid Resource URI"

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
      live:
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



  
