angular.module('portal.controllers').controller "EmailRequestsFormController", ["$scope", "$log", "$http", ($scope, $log, $http) ->
  resetForm = ->
    $scope.form = {existing_query: "0"}

  $scope.init = ->
    resetForm()

  isMissingRequiredFields = ->
    $scope.errors = {}
    requiredFields = ["name", "lo_name", "email", "event_date", "who_to_send_to", "subject_line", "desired_goal", "detailed_description"]
    angular.forEach(requiredFields, (field) ->
      if !$scope.form[field] || $scope.form[field] == ''
        $scope.errors[field] = true
    )
    return Object.keys($scope.errors).length > 0

  $scope.submitRequest = ->
    $scope.successMessage = ""
    return false if isMissingRequiredFields()
    promise = $http.post("/email_requests", { email_requests: $scope.form })
    promise.then( (res) ->
      $scope.successMessage = "Request Sent!"
      resetForm()
    , (error) ->
      $log.error(error)
      alert("Unable to send request. Error: #{error.data}")
    )
]