
delete require.cache[require.resolve('./firebaseWorkout')]
FirebaseWorkout = require('./firebaseWorkout')

delete require.cache[require.resolve('./data')]
data = require("./data")

f = new FirebaseWorkout()

f.deleteAllWorkouts()

f.addWorkout(data.workoutSetup())

f.addComponent(data.strengthComponent())
f.addComponent(data.metconComponent())
# Set up a comment for a pull request