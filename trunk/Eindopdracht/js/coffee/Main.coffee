basic = G.create G.lambertMaterial(0x0000ff)
cube = basic G.boxGeometry(x: 1, y: 1, z: 1)
cube.overdraw = true

light = L.ambientLight 0x000044

dirLight = L.directionalLight 0xffffff
dirLight.position.set(0.3, 1, 0.4).normalize()


objects = [ cube, light, dirLight ]

# Setup scene, renderer, camera and render.
renderFunction = Setup.init(Settings.settings)
setInterval(renderFunction, Settings.frameRate)
# renderFunction()
Setup.resizer()

# Add all objects to the scene.
_.map(objects, Setup.add)
