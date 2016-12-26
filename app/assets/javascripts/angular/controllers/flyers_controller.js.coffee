angular.module('portal.controllers').controller "FlyerFormController", ["$scope", "$log", "$http", ($scope, $log, $http) ->
  $scope.init = (flyer) ->
    $scope.flyer = flyer
    $scope.categoryChanged()

  $scope.categoryChanged = (reset) ->
    if $scope.flyer.category_id && $scope.flyer.category_id != ''
      # Reset subcategories
      $scope.flyer.uploadable_items_subcategories = [] if reset
      $scope.flyer.category_id = "" + $scope.flyer.category_id
      $http.get("/categories/#{$scope.flyer.category_id}").then( (resp) ->
        $scope.availableSubcategories = resp.data.children
        fixupSubcategories()
      , (error) -> 
        $log.error("Unable to get categories", error)
      )

  $scope.addNewSubcategory = ->
    $scope.flyer.uploadable_items_subcategories.push({})

  $scope.canAddSubcategory = ->
    $scope.flyer.category_id && $scope.availableSubcategories && $scope.availableSubcategories.length > 0

  fixupSubcategories = ->
    return unless $scope.availableSubcategories && $scope.availableSubcategories.length > 0
    for i in $scope.flyer.uploadable_items_subcategories
      if i.category_id
        for c in $scope.availableSubcategories
          i.selectedCategory = c if c.id == i.category_id
]
