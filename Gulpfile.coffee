gulp = require 'gulp'

FirebaseWorkout = require './firebase'

fireWorkout = new FirebaseWorkout()

#fireWorkout = new FirebaseWorkout()()

workoutData = {
	"date": "2014-11-01",
}

#gulp.task 'readMain', ->
#	firebase.readMain()
#	.then (data) =>
#		console.log data

gulp.task 'newWorkout', ->
	id = fireWorkout.newWorkout(workoutData)
	console.log id

gulp.task 'last workout', ->
	fireWorkout.lastWorkoutId()

gulp.task 'num', ->
	return 12

gulp.task 'yum num', ['num'] ->
