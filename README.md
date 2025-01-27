# flying embers

A flying embers effect implemented in the Unity visual effect graph and shader graph.

Traditionally these are made by stretching the particle quad along velocity, but that approach breaks at grazing angles. Also a stretched texture is far from the depth-of-field-and-motion-blur-induced shape we've come to recognize as embers in films.

Here's an implementation, which tries to be more physically-accurate, and holds up in close-ups and at grazing angles.

![debug ember](Images/debug_ember.gif)


![orbit](Images/wide_orbit_shot.gif)

![shallow dof](Images/shallow_dof.gif)

The repository doesn't contain the ground assets or the character, but otherwise it's the same scene.

## known issues

- If you have both the game view and scene view open at the same time, particles will align correctly only in the game view. Best to have both in the same tab group.
