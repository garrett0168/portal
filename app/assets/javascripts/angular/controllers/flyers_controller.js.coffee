angular.module('portal.controllers').controller "FlyerFormController", ["$scope", "$log", "$http", ($scope, $log, $http) ->
  $scope.init = (flyer) ->
    $scope.flyer = flyer
    $scope.categoryChanged()

  $scope.categoryChanged = ->
    if $scope.flyer.category_id && $scope.flyer.category_id != ''
      $http.get("/categories/#{$scope.flyer.category_id}").then( (resp) ->
        $scope.availableSubcategories = resp.data.children
      , (error) -> 
        $log.error("Unable to get categories", error)
      )

  $scope.addNewSubcategory = ->
    $scope.flyer.flyers_subcategories.push({})

  $scope.canAddSubcategory = ->
    $scope.flyer.category_id && $scope.availableSubcategories && $scope.availableSubcategories.length > 0
]
