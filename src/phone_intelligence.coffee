querystring = require('querystring')
_s = require('underscore.string');

baseUrl = 'https://proapi.whitepages.com/2.0/phone.json'

#
# Request Function -------------------------------------------------------
#

request = (vars) ->

  url: "#{baseUrl}?api_key=#{process.env.WHITEPAGES_API_KEY}&phone_number=#{vars.lead.phone_1}",
  method: 'GET',
  headers:
    Accepts: 'application/json'

request.variables = ->
  [
    { name: 'lead.phone_1', type: 'string', required: true, description: 'Phone number' }
  ]

validate = (vars) ->
  return 'phone must not be blank' unless vars.lead?.phone_1?
  return 'phone must be valid' if vars.lead.phone_1?.valid? and vars.lead.phone_1.valid != true
  return 'phone must not be masked' if vars.lead.phone_1?.masked == true

#
# Response Function ------------------------------------------------------
#

response = (vars, req, res) ->

  result = {}
  
  if res.status == 200
    event = JSON.parse(res.body)
    if event.error 
      result = { outcome: 'error', reason: "#{event.error.message}", billable: 1 }
    else
      if event.messages and event.messages.length
        message_obj = event.messages[0]
        severity = message_obj.severity
        message = message_obj.message.replace /qiWithPhone: /, ""
        code = message_obj.code

        if severity == 'warning'
          result = { outcome: 'failure', reason: "#{message}", billable: 1 }
        else
          # error
          result = { outcome: 'error', reason: "#{message}", billable: 0 }

      else
        primary_key = event.results[0]
        phone_obj = event.dictionary[primary_key]
        
        best_location_key = phone_obj.best_location.id.key
        location_obj = event.dictionary[best_location_key]
        
        result.outcome = 'success'
        result.reason = null
        result.billable = 1
        result.phone_number = phone_obj.phone_number
        result.country_code = location_obj.country_code
        result.reputation_level = phone_obj.reputation.level
        result.is_connected = phone_obj.is_connected
        result.is_prepaid = phone_obj.is_prepaid
        result.do_not_call = phone_obj.do_not_call
        result.is_valid = phone_obj.is_valid
        result.carrier = phone_obj.carrier
        result.line_type = phone_obj.line_type


      # put rest of stuff here
  else
    # capture the error body, if we have one
    message = res.body
    try 
      json = JSON.parse(res.body)
      message = json.error.message
    catch
      # it's not JSON

    result = { outcome: 'error', reason: "WhitePages error: #{message}", billable: 0 }

  phone_intelligence: result
  
response.variables = ->
  [
    { name: 'phone_intelligence.outcome', type: 'string', description: 'Integration outcome (success, failure, or error)' }
    { name: 'phone_intelligence.reason', type: 'string', description: 'If integration fails, this is the reason why' }
    { name: 'phone_intelligence.phone_number', type: 'string', description: 'Whitepages Pro Phone Number' }
    { name: 'phone_intelligence.is_valid', type: 'boolean', description: 'Whitepages Pro Is Valid' }
    { name: 'phone_intelligence.is_connected', type: 'boolean', description: 'Whitepages Pro Is Connected' }
    { name: 'phone_intelligence.country_code', type: 'string', description: 'Whitepages Pro Country Code' }
    { name: 'phone_intelligence.line_type', type: 'string', description: 'Whitepages Pro Line Type' }
    { name: 'phone_intelligence.carrier', type: 'string', description: 'Whitepages Pro Carrier' }
    { name: 'phone_intelligence.is_prepaid', type: 'boolean', description: 'Whitepages Pro Is Prepaid' }
    { name: 'phone_intelligence.do_not_call', type: 'boolean', description: 'Whitepages Pro Do Not Call Registered' }
    { name: 'phone_intelligence.reputation.level', type: 'number', description: 'Whitepages Pro Reputation Level' }
  ]


#
# Exports ----------------------------------------------------------------
#

module.exports =
  name: 'Phone Data Append'
  validate: validate
  request: request
  response: response

#
# Helpers ----------------------------------------------------------------
#
