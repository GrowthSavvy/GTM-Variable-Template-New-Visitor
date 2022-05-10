___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Is new visitor",
  "categories": ["UTILITY"],
  "description": "Returns \"true\" if the Google Analytics Client ID got created less than the specified amount of minutes ago.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "minutes",
    "displayName": "Google Analytics Client ID max age in minutes",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "POSITIVE_NUMBER"
      }
    ],
    "alwaysInSummary": true,
    "defaultValue": 1440,
    "help": "This variable will return \"true\" if the Google Analytics Client ID got created less than the specified amount of minutes ago. (e.g. 1440 minutes for visitors not older than one day.)"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const copyFromWindow = require('copyFromWindow');
const getTimestampMillis = require('getTimestampMillis');
const makeString = require('makeString');

const clientId = copyFromWindow('gaGlobal.vid');

if(clientId !== undefined){
  const timestamp = clientId.match("[^.]+$")[0];
  const actualTimestamp = makeString(getTimestampMillis()).match("^.{10}")[0];
  if(actualTimestamp - timestamp <= (data.minutes * 60)) {
    return true;
  }
  return false;
}

return undefined;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gaGlobal.vid"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 10/05/2022, 15:10:59


