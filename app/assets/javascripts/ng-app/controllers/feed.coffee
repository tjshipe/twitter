angular.module('myApp').controller 'FeedCtrl', ['$scope', 'Post', 
  ($scope, Post) ->
    $scope.post = {body: ''}

    Post.all().then (response) ->
      $scope.posts = response

    $scope.createPost = ->
      Post.create($scope.post).then (response) ->
        $scope.posts.unshift response

]
