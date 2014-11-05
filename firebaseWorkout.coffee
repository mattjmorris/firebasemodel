$q 				= require 'q'
Firebase 	= require('firebase')
_ 				= require("lodash")
moment		= require('moment')

class FirebaseWorkout
	_mainRef = new Firebase "https://omegatest.firebaseio.com/"
	_deferred = undefined

	constructor: ->
		@workout = undefined
		@workoutId = undefined
		@componentId = undefined

	addWorkout: (data) ->
		newWorkoutRef = _mainRef.child("workouts").push(data)
		@workoutId = newWorkoutRef.name()

	addComponent: (data) ->
		throw "Need a workout first" unless @workoutId
		@componentId = _mainRef.child("workouts").child(@workoutId).child("components").push(data)

	loadMostRecentWorkout: ->
		recentWorkoutQuery = _mainRef.child("workouts").limit(1)
		deferred = $q.defer()
		recentWorkoutQuery.once 'value', (snap) =>
			if _.has(snap, 'val')
				@workoutId = _.first(_.keys(snap.val()))
				@workout = snap.val()[@workoutId]
			deferred.resolve()
		deferred.promise

	deleteMostRecentWorkout: ->
		recentWorkoutQuery = _mainRef.child("workouts").limit(1)
		deferred = $q.defer()
		recentWorkoutQuery.once 'value', (snap) =>
			@workoutId = _.first(_.keys(snap.val()))
			@workout = snap.val()[@workoutId]
			_mainRef.child("workouts/#{@workoutId}").remove(@_onComplete)
			deferred.resolve()
		deferred.promise

	deleteAllWorkouts: ->
		_deferred = $q.defer()
		_mainRef.child("workouts").remove(@_onComplete)
		_deferred.promise

	deleteMostRecentComponent: ->
		_deferred = $q.defer()
		@loadMostRecentWorkout().then =>
			recentComponentQuery = _mainRef.child("workouts/#{@workoutId}/components").limit(1)
			recentComponentQuery.once 'value', (snap) =>
				componentId = _.first(_.keys(snap.val()))
				_mainRef.child("workouts/#{@workoutId}/components/#{componentId}").remove(@_onComplete)
		_deferred.promise

	_onComplete: (error) ->
		if (error)
			console.log 'Synchronization failed', error
			_deferred.resolve()
		else
			console.log 'Synchronization succeeded'
			_deferred.resolve()

module.exports = FirebaseWorkout
