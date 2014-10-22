Setup.init(
    new THREE.Scene,
    Camera.perspectiveCamera(),
    _.compose(Cardboard.effect, Render.fsRenderer)(),
    Cardboard.init
)((renderer, camera, scene, controls) ->

    camera.updateProjectionMatrix()

    console.log controls.controls.freeze
    if controls.controls.freeze is false
        controls.controls.update()
    else controls.orbitControls.update()

    renderer.effect.render(scene, camera)

, 1000 / 24)((-> 
    basic = _.compose(ThreeObj.create, ThreeObj.lambertMaterial)

    cube = basic(0x0000ff)(ThreeObj.boxGeometry(x: 2, y: 2, z: 2))
    cube.overdraw = true

    light = L.ambientLight 0x000044

    dirLight = L.directionalLight 0xffffff
    dirLight.position.set(0.3, 1, 0.4).normalize()

    [cube, light, dirLight])()
)
