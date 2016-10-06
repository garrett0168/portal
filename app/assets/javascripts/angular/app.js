angular.module('portal.controllers', []);
angular.module('portal.models', []);
var portalApp = angular.module('portal', ['portal.controllers', 'portal.models'])
    .config(['$httpProvider', function($httpProvider) {
      $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
    }]);
