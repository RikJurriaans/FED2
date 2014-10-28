# Rik Jurriaans 2014.
# google cardboard experiment

light = L.ambientLight 0x000044

dirLight = L.directionalLight 0xffffff
dirLight.position.set(0.3, 1, 0.4).normalize()

camera = new THREE.PerspectiveCamera(90, window.innerWidth / window.innerHeight, 0.0001, 1000000000)
camera.position.z = 5

renderer = _.compose(Cardboard.effect, Render.fsRenderer)()
controls = Cardboard.init


Setup.init(camera, renderer, controls)(
    (renderer, camera, scene, controls) ->
        camera.updateProjectionMatrix()

        if controls?
            if controls.controls.freeze is false
                controls.controls.update()
            else controls.orbitControls.update()

        renderer.effect.render(scene, camera)
    , Render.framerate(30)
)(_.union([light, dirLight], Stellar.basic, Stellar.planets('earth', 'jupiter', 'mercury', 'neptune', 'venus', 'mars', 'pluto', 'uranus')))
