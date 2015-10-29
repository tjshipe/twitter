angular.module('myApp', ['ngAnimate', 'ui.router', 'templates', 'restangular', 'Devise'])
  .run(['$rootScope', '$state', ($rootScope, $state) ->
    $rootScope.$on "devise:unauthorized", (event, xhr, deferred) ->
      $state.go('home')

    $rootScope.$on 'devise:logout', (event, oldCurrentUser) ->
      $state.go('home', {reload: true})
  ])
  .config(['$httpProvider', '$stateProvider', '$urlRouterProvider', '$locationProvider', 'AuthInterceptProvider', ($httpProvider, $stateProvider, $urlRouterProvider, $locationProvider, AuthInterceptProvider) ->
    AuthInterceptProvider.interceptAuth(true)
    $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest'
    $urlRouterProvider.when "/", "feed"
    $urlRouterProvider.otherwise "/"

    $stateProvider.state 'home',
      url: '/login'
      templateUrl: 'home.html'
      controller: 'HomeCtrl'

    $stateProvider.state 'feed',
      url: '/feed'
      templateUrl: 'feed.html'
      controller: 'FeedCtrl'
      resolve:
        currentUser: ['Auth', (Auth) ->
          Auth.currentUser()
        ]
  ])



