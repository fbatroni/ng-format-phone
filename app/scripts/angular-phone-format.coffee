# load in google phonelib
require './googlePhoneLib.js'
require './controllers/phone-number-ctrl.coffee'

do ->

  ngPhoneFormat = ->
    {
      restrict: 'AE'
      replace: true
      scope: phoneNumber: '@phoneNumber'
      link: (scope, element, attrs, PhoneNumberController) ->
        phone = attrs.phoneNumber
        ext = attrs.ext
        PhoneNumberController.activate phone
        attrs.$observe 'phoneNumber', (value) ->
          phone = value
          PhoneNumberController.activate phone
          return
        return
      template: '<span style="white-space:nowrap;">{{ vm.display }}</span>'
      controller: 'PhoneNumberController'
      controllerAs: 'vm'
    }

  'use strict'
  angular.module('ngPhoneFormat').directive 'ngPhoneFormat', ngPhoneFormat
  return
