getCube = ->
    geometry = new THREE.BoxGeometry(1, 1, 1)
    material = new THREE.MeshBasicMaterial( color: 0x00ff00 )
    new THREE.Mesh(geometry, material)


objects = [ getCube() ]

# Setup scene, renderer, camera and render.
Setup.init(Settings.settings)

# Add all objects to the scene.
_.map(objects, Setup.add)
