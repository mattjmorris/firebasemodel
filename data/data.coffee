exports.workoutSetup = ->
  {
  "date": "2014-11-01",
  "notes": "Don't forget to do all parts"
  }

exports.strengthComponent = ->
  {
  "name": "Strength",
  "description": "squats, alternating with pull-ups",
  "record": "sets",
  "rounds": 1,
  "sets": [
    {
      "exercise": "squats",
      "reps": 6,
      "1RMPercent": 50
    },
    {
      "exercise": "pull-ups",
      "reps": "max",
      "modifiers": [
        "chest to bar",
        "strict"
      ]
    },
    {
      "exercise": "squats",
      "reps": 6,
      "1RMPercent": 60
    },
    {
      "exercise": "pull-ups",
      "reps": "max"
    }
  ]
  }

exports.metconComponent = ->
  {
  "name": "metcon",
  "metadata": {
    "secs": 720,
    "rounds": "max",
    "record": "rounds",
    "sets": [
      {
        "exercise": "pull-ups",
        "reps": 5
      },
      {
        "exercise": "push-ups",
        "reps": 10
      },
      {
        "exercise": "squats",
        "reps": 15
      }
    ]
  }
  }