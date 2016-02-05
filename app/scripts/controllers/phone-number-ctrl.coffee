do ->

  PhoneNumberController = ->
    
    # Controller Variables ========
    vm = this
    # Initialize ==================

    format = (phone) ->

      vm.display = ''
      return

    vm.display = ''
    # Map VM Functions ============
    vm.format = format
    # Controller Functions ========
    return

  'use strict'
  angular.module('ngPhoneFormat').controller 'PhoneNumberController', PhoneNumberController
  PhoneNumberController.$inject = []
  return