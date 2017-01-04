angular.module('portal.controllers').controller "EmailRequestsFormController", ["$scope", "$log", "$http", ($scope, $log, $http) ->
  $scope.submitting = false
  resetForm = ->
    $scope.form = {existing_query: "0", category: $scope.categoryName}

  $scope.init = (categoryName) ->
    $scope.categoryName = categoryName
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
    return if $scope.submitting

    $scope.submitting = true
    $scope.successMessage = ""
    return false if isMissingRequiredFields()
    promise = $http.post("/email_requests", { email_requests: $scope.form })
    promise.then( (res) ->
      $scope.submitting = false
      $scope.successMessage = "Request Sent!"
      resetForm()
    , (error) ->
      $scope.submitting = false
      $log.error(error)
      alert("Unable to send request. Error: #{error.data}")
    )
]