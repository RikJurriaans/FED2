# Rik Jurriaans 2014.
# Functional google cardboard experiment.


# Create a new function out of smaller functions.
basic = _.compose(ThreeObj.create, ThreeObj.lambertMaterial)

cube = basic(0x0000ff)(ThreeObj.boxGeometry(x: 2, y: 2, z: 2))
cube.overdraw = true

light = L.ambientLight 0x000044

dirLight = L.directionalLight 0xffffff
dirLight.position.set(0.3, 1, 0.4).normalize()


camera = Camera.perspectiveCamera()
renderer = _.compose(Cardboard.effect, Render.fsRenderer)()
controls = Cardboard.init()

Setup.init(camera, renderer, controls)(
    (renderer, camera, scene, controls) ->
        camera.updateProjectionMatrix()

        if controls.controls.freeze is false
            controls.controls.update()
        else controls.orbitControls.update()

        renderer.effect.render(scene, camera)
    , Render.framerate(30)
)(cube, light, dirLight)
