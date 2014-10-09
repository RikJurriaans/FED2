basic = G.create G.lambertMaterial(0xff0000)
cube = basic G.boxGeometry(x: 1, y: 1, z: 1)

camera = C.perspectiveCamera(45, 0xffffff)
camera.position.z = 500

light = L.ambientLight 0x404040
dirLight = L.directionalLight 0xffffff
dirLight.position.set 1, 1, 1

objects = [ cube, light, camera ]

# Setup scene, renderer, camera and render.
Setup.init(Settings.settings)

# Add all objects to the scene.
_.map(objects, Setup.add)
