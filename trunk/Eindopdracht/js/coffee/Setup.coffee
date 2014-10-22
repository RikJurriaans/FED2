module 'Setup'


# render = -> 
#     # @renderer.render(@scene, @camera)
#     Setup.effect.render(@scene, @camera)
#     Setup.controls.update()


# resizer
# @param onResize:Function = function that gets called on resize.
# @return void
# resizer = (onResize = null) ->
#     window.addEventListener('resize', (e) => 
#         # if a function is set run that function.
#         if onResize? then onResize()

#         Setup.effect.setSize(window.innerWidth, window.innerHeight)

#         # resize the canvas.
#         if @renderer?
#             @renderer.setSize(window.innerWidth, window.innerHeight)
#             @camera.aspect = window.innerWidth / window.innerHeight
#             @camera.updateProjectionMatrix()
#     )


# setOrientationControls = (e) =>
#     controls = new THREE.DeviceOrientationControls(@camera, true)
#     controls.connect()
#     controls.update()
#     @renderer.domElement.addEventListener('click', fullscreen, false)
#     window.removeEventListener('deviceOrientation', setOrientationControls, true)

# deze functie moet naar Interaction...
# cardboard
# cardboard = ->
#     controls = new THREE.OrbitControls(@camera, @renderer.domElement)
#     controls.rotateUp(Math.PI / 4)
#     # ff naar kijken is kapot.
#     # controls.target.set(
#     #     @camera.position.x + 0.1,
#     #     @camera.position.y,
#     #     @camera.position.z
#     # )
#     controls.noZoom = true
#     controls.noPan = true
#     window.addEventListener('deviceOrientation', setOrientationControls, true)
#     controls


# init function for setting up the scene.
# Setup.init = (settings) -> 
#     _.bind(_.compose(setSize, renderReady), settings)()

#     # create new global functions with settings in the scope.
#     Setup.add = _.bind(addToScene, settings)
#     Setup.resizer = _.bind(resizer, settings)
#     Setup.controls = _.bind(cardboard, settings)()
#     Setup.effect = new THREE.StereoEffect(settings.renderer)
#     Setup.effect.setSize(window.innerWidth, window.innerHeight)

# Scene :: Scene -> Object -> Scene
add = (scene) -> (object) -> scene.add(object)

Setup.init = (scene, camera, renderer, controls = null) -> (renderFunc, frameRate) ->
    scene.add(camera)

    # standard template for controls object
    controls = controls(scene, camera, renderer)

    setInterval(->
        renderFunc(renderer, camera, scene, controls)
    , frameRate)

    # another curried function to add objects to the scene.
    # Init :: Function -> Function
    (objects) -> 
        _.map(objects, add(scene))

