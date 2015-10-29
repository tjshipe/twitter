angular.module('myApp').factory 'Post', ['Restangular',
  (Restangular) ->
    service =
      all: () ->
        Restangular.all('posts').getList()

      get: (id) ->
        Restangular.one('posts', id).get()

      new: () ->
        {body: ''}

      create: (params) ->
        Restangular.all('posts').post( params )

      update: (id, params) ->
        Restangular.one('posts', id).patch( params )

      delete: (id) ->
        Restangular.one('posts', id).remove()

    service
]