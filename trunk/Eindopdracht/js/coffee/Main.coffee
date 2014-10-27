# Rik Jurriaans 2014.
# google cardboard experiment

# # Create a new function out of smaller functions.
# basic = _.compose(ThreeObj.create, ThreeObj.lambertMaterial)

# cube = basic(0x0000ff)(ThreeObj.boxGeometry(x: 1, y: 1, z: 1))
# # cube.overdraw = true

light = L.ambientLight 0x000044

dirLight = L.directionalLight 0xffffff
dirLight.position.set(0.3, 1, 0.4).normalize()

# camera = Camera.perspectiveCamera()
camera = new THREE.PerspectiveCamera(90, window.innerWidth / window.innerHeight, 0.0001, 1000)
camera.position.z = 5

# renderer = _.compose(Cardboard.effect, Render.fsRenderer)()
renderer = Render.fsRenderer()
Render.fullBrowser(renderer)
controls = Cardboard.init


# Create the sky.
box = ->
    skyBoxTexture = THREE.ImageUtils.loadTextureCube([
        'img/s_px.jpg',
        'img/s_nx.jpg',
        'img/s_py.jpg',
        'img/s_ny.jpg',
        'img/s_pz.jpg',
        'img/s_nz.jpg'
    ])

    skyBoxShader = THREE.ShaderLib.cube
    skyBoxShader.uniforms.tCube.value = skyBoxTexture

    skyBoxMaterial = new THREE.ShaderMaterial(
        fragmentShader: skyBoxShader.fragmentShader,
        vertexShader: skyBoxShader.vertexShader,
        uniforms: skyBoxShader.uniforms,
        deptTest: false,
        depthWrite: false,
        side: THREE.BackSide
    )

    skyBox = new THREE.Mesh(
        new THREE.BoxGeometry(500, 500, 500),
        skyBoxMaterial
    )

data = {"date": 2456958.0235199998, "results": {"sun": [[383933.93870091182, -154864.6735461785, -88439.849411909221], [662.24091806523109, 668.73608576947083, 272.55192272562215]], "moon": [[123838675.35331032, 75400917.349349886, 32697762.045243558], [-1386327.5672629988, 1937713.4020441414, 844361.26179993642]], "earth": [[123920058.29867895, 75751834.04974024, 32817451.993256208], [-1474325.3107929253, 1954048.5269320244, 847040.84617713629]]}, "unit": "km"}
console.log data

# The sun is always in the middle.
sunRadius = 1300000
sunMeterial = ThreeObj.lambertMaterial
planet = _.compose(ThreeObj.create, sunMeterial)
sun = planet(0xffffff)(ThreeObj.sphereGeometry(sunRadius, 100, 100))

earthRadius = 1
console.log earthRadius
planet = _.compose(ThreeObj.create, ThreeObj.lambertMaterial)
earth = planet(0xff0000)(ThreeObj.sphereGeometry(earthRadius, 100, 100))
# earth.position.set(1, 1, 1)



Setup.init(camera, renderer, controls)(
    (renderer, camera, scene, controls) ->
        camera.updateProjectionMatrix()

        if controls?
            if controls.controls.freeze is false
                controls.controls.update()
            else controls.orbitControls.update()

        renderer.render(scene, camera)
    , Render.framerate(30)
)(sun, earth, light, dirLight)
