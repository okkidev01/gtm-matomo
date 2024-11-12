___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Okki Matomo Tracking Tag",
  "categories": ["ANALYTICS"],
  "brand": {
    "id": "brand_matomo",
    "displayName": "okki-shop-matomo",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAADg0lEQVRIie2WXWxURRTHz8ydO/fubru7aWlrv4QW2vIh4AohYDYqLQ8aA5EQnwySGPURNTEmPviiGH0wmuAHBPABQqTGJ2NCaaqGKrYlaa0NJTRtpbvQhPYudW139967e2fm+CJ0d90KD/C28zhn5v+b+Z85J0MQER7moA9VvQwoAx7IYCsFlMLegVj/8Gw2J7Z21OzvagtVGHejmLJyo9+ruQkwK/X1naz9qZV0SMlCE1K9f3ywu2cCAAghQqrIhtov3u16ZFUAAJQ1bX/7lkr8SagGiEApj75qdB0uCSht0Xe9k+d6JgyDmQYzuBbw6X9MJI6cGJIKAaXb+wnevk64H5gBuglUz176On3tp/sF3JhLfdk9ynWN5E36TdY3GD93YQoyc3J2DJiZ5wJhQKYuHk06C/cGIOKnp4etpK1RUhTSGT36zeiVsRinCgqDlLLFZOzH8VP3Bpz/daZ3IGbyEsmnlCylnCPdN9I0REEVqViGeXX+wkxy6P8AiaTz2ZkRggArdFjOyOhN+dX1zZwiI4oAEECTyBlkV0J6wEd/i510xOIKAITPz/4et22t3gSTgigNMTTZPb/1w/ie2WxYILUV7/ur/Rit0et0n89ccOKXb57NX7/8TH+ZnHu9fwRW+4BRYks6tqSNLAEAFOcCACCnWJg5dTyVEb5c8NauZ35uaAowQwNABNi3/oNHw9sKbrDoiY8Tca/ND5wCAazU5NNVakdICVVCHoBTkVF80q61FN342FBNLWdcu3NieSl+IivSBYDzljXupHUk/7qvAAWau6rXbKgWXmkGAQQpWlsHm9bYht+4e1FKmJWZnlroLwCMp1JFThAEm+Chlx+vq/JLVSIfnoebO/TIE7cCQR8tqBkgQKz0VAEgyFiRBgKgVNvba98+tF39B6AUBiv0jw7vfW7nS8AkFO9FgwUKAHtqVvk0TeX1payUW4LBRsaf3712f+c62/XyJdyceO3AlrXNlZHmFxvDm4TK5qkrRo2WqicLANtCoTdbWhDAkdJVKiPlar//vfY2TigAvPPKjmikyXY9NyfcrHCy4oXOtoN7NwKATs3drW+EzUZPOkLlPOUi4s7mgw2Vm+5YnXfqgWSyx7L+9ryOQMWB+vp6c7k/26744eL08NV5TaPRSMOz0RamLddQOpe4ZvXdtmdMFlxXHW0ORZbzUf4XlQFlAPwDXYWGXACj6aEAAAAASUVORK5CYII\u003d"
  },
  "description": "Okki Matomo Tracking Tag",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "idSite",
    "displayName": "Matomo idSite",
    "simpleValueType": true,
    "valueHint": "1",
    "notSetText": "Field is required",
    "help": "The idSite you want to track data into.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "POSITIVE_NUMBER"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "siteUrl",
    "displayName": "site domain",
    "simpleValueType": true,
    "valueHint": "1",
    "notSetText": "Field is required",
    "help": "The site domian you want to track data into, exp: *.cnmingyang.com.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "cmsUrl",
    "displayName": "cms url",
    "simpleValueType": true,
    "valueHint": "1",
    "notSetText": "Field is required",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
   {
    "type": "TEXT",
    "name": "matomoUrl",
    "displayName": "matomo  url",
    "simpleValueType": true,
    "valueHint": "1",
    "notSetText": "Field is required",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
var log = require('logToConsole');
var createQueue = require('createQueue');
var injectScript = require('injectScript');
const getQueryParameters = require('getQueryParameters');
const getUrl = require('getUrl');
const readTitle = require('readTitle');
const getCookieValues = require('getCookieValues');
const sendPixel= require('sendPixel');

log('data =', data);

var onSuccess = function() {
  log('Tracker.js loaded successfully');
  data.gtmOnSuccess();
};

var onFailure = function() {
  log('Tracker.js loading failed');
  data.gtmOnFailure();
};

if (data.idSite && data.siteUrl) {
  log('data =', data);
  
  var _paq = createQueue('_paq');

  const currentUrl = window.location.href;
  if (getUrl('query').includes('gclid=')) {
    var id = getQueryParameters('gclid');
    var domain = getUrl('host');
    var url = data.cmsUrl+ `/shop-api/External/Gclid?gclid=${id}&domain=${domain}`;
    sendPixel(url);
  }

  var gclid = getCookieValues('gclid');
  if (gclid) {
    _paq(['setCustomDimension', (customDimensionId = 4), (customDimensionValue = gclid)]);
  }

  _paq(['setDocumentTitle', getUrl('host') + '/' + readTitle()]);
  _paq(['setCookieDomain', data.siteUrl]);
  _paq(['trackPageView']);
  _paq(['enableLinkTracking']);


  _paq(['setTrackerUrl', data.matomoUrl + 'matomo.php']);
  _paq(['setSiteId', data.idSite]);

  var trackingJSURL = 'https://shopcdnpro.grainajz.com/tpl-common/common/js/matomo.js';
  log('injecting script: ' + trackingJSURL);
  injectScript(trackingJSURL, onSuccess, onFailure, trackingJSURL);
}

___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://shopcdnpro.grainajz.com/tpl-common/common/js/matomo.js"
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
  },
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
                    "string": "_paq"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
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

scenarios:
- name: should_load_matomo_js
  code: |-
    const mockData = {
      "idSite":"3",
      "cmsUrl": "https://cms.xiaoman.cn",
      "matomoUrl": "https://matomo.datasanalytics.com/"
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 08/11/2024, 12:31:16


