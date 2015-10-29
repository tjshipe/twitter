angular.module('myApp').controller 'HomeCtrl', ['$scope', '$state', 'Auth', 
  ($scope, $state, Auth) ->
    $scope.user = {email: '', password: ''}

    $scope.login = ->
      Auth.login($scope.user).then ((user) ->
        $state.go('feed')
      ), (error) ->
        alert 'Invalid login'
]
