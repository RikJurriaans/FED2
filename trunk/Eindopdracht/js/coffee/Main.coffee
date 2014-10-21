basic = G.create G.lambertMaterial(0x0000ff)
cube = basic G.boxGeometry(x: 1, y: 1, z: 1)
cube.overdraw = true

light = L.ambientLight 0x000044

dirLight = L.directionalLight 0xffffff
dirLight.position.set(0.3, 1, 0.4).normalize()


Setup.init(new THREE.Scene,
           new THREE.PerspectiveCamera(90, 1, 0.001, 700), 
           new THREE.WebGLRenderer)(
           # This is the render function.
           (renderer, camera, scene) ->
               renderer.render(scene, camera)
           , 1000 / 24)(
               # the objects for in the scene.
               [cube, light, dirLight]
           )
           
