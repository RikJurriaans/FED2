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
camera = new THREE.PerspectiveCamera(90, window.innerWidth / window.innerHeight, 0.0001, 1000000000)
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

data = {"date": 2456958.2902000002, "results": {"mercury": [[930780.46339593455, 40593625.435083255, 21622070.368173573], [-5052187.1755984453, -3742.4456342440099, 521753.74094806425]], "sun": [[384110.50712484348, -154686.30001716455, -88367.148735455819], [661.95596107450399, 668.99844648501778, 272.6758752265502]], "neptune": [[4106391240.0638866, -1628638089.8020017, -768844073.29628408], [185415.67064234047, 402409.82788501156, 160092.40830082115]], "earthmoon": [[123524858.59454161, 76267807.435987204, 33041524.333831247], [-1483172.5625202372, 1947726.9036480908, 844353.85189195955]], "moon": [[123467782.82597755, 75917533.458061755, 32922814.55832202], [-1395278.3505385835, 1936720.944537397, 843448.14763028314]], "jupiter": [[-501859236.16942918, 559095835.30640531, 251849486.2650966], [-887069.69281571265, -616188.89243538002, -242518.4318530476]], "uranus": [[2898342515.1108446, 702095957.06234443, 266506732.90994442], [-151729.97739574511, 495864.73971809674, 219321.54790567816]], "mars": [[126969624.38145645, -149794564.75127721, -72141517.204090312], [1744684.830088208, 1335267.4626601879, 565332.19600810995]], "earth": [[123525560.62867968, 76272115.819323376, 33042984.468613949], [-1484253.6646920014, 1947862.2773664354, 844364.99208904651]], "venus": [[-87475149.829805329, -59531790.174508691, -21244687.734730415], [1740544.6909247781, -2216216.0499368175, -1107267.0357970451]], "pluto": [[1076659323.7357812, -4461036990.9583578, -1716546033.365186], [467383.26571251114, 61200.023490143431, -121722.8208160528]], "geomoon": [[-57777.802702134795, -354582.36126162071, -120169.91029193024], [88975.314153417945, -11141.332829038362, -916.84445876337304]]}, "unit": "km"}

scale = 1000000


sunRadius = 30

sunMeterial = ThreeObj.lambertMaterial
planet = _.compose(ThreeObj.create, sunMeterial)
sun = planet(0xffffff)(ThreeObj.sphereGeometry(sunRadius/10, 100, 100))
sun.position.set(data.results.sun[0][0]/ scale, data.results.sun[0][1]/ scale, data.results.sun[0][2]/ scale)


sizes = {earth: sunRadius / 13, jupiter: sunRadius / 2, mercury: sunRadius / 26, neptune: sunRadius / 5, uranus: sunRadius / 6, venus: sunRadius / 13, mars: sunRadius / 26, pluto: sunRadius / 26}
 

basicPlanet = _.compose(ThreeObj.create, ThreeObj.lambertMaterial)

# makeGeom :: String -> ThreeMesh
makeGeom = (name) ->
    geom = basicPlanet(0xff0000)(ThreeObj.sphereGeometry(sizes[name], 100, 100))
    geom.name = name
    return geom

# positionPlanet :: ThreeMesh -> ThreeMesh
positionPlanet = (planet) ->
    console.log planet
    planet.position.set(data.results[planet.name][0][0]/ scale, 
                        data.results[planet.name][0][1]/ scale, 
                        data.results[planet.name][0][2]/ scale)
    planet

planet = _.compose(positionPlanet, makeGeom)

planets = _.map(['earth', 'jupiter', 'mercury', 'neptune', 'venus', 'mars', 'pluto', 'uranus'], planet)


Setup.init(camera, renderer, controls)(
    (renderer, camera, scene, controls) ->
        camera.updateProjectionMatrix()

        if controls?
            if controls.controls.freeze is false
                controls.controls.update()
            else controls.orbitControls.update()

        renderer.render(scene, camera)
    , Render.framerate(30)
)([sun, light, dirLight].concat planets)
