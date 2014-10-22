module 'Setup'

# Scene :: Scene -> ThreeObject -> undefined
add = (scene) -> (object) -> scene.add(object)

# Init :: camera, renderer, controls -> Function, Float -> Array -> Scene
Setup.init = (camera, renderer, controls = null) -> (renderFunc, frameRate) ->
    scene = new THREE.Scene

    # standard template for controls object
    controls = controls(scene, camera, renderer)

    setInterval(->
        renderFunc(renderer, camera, scene, controls)
    , frameRate)

    # another curried function to add objects to the scene.
    (objects...) -> 
        _.map(objects, add(scene))

