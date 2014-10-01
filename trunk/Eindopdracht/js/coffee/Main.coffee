setup = 
    scene : new THREE.Scene
    camera : new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000)
    renderer : new THREE.WebGLRenderer

makeCube = ->
    geometry = new THREE.BoxGeometry(1,1,1)
    material = new THREE.MeshBasicMaterial(color : 0x00ff00)
    cube = new THREE.Mesh(geometry, material)

render = setup ->
    requestAnimationFrame((setup) -> render(setup))
    setup.renderer.render(setup.scene, setup.camera)


browser = renderer ->
    renderer.setSize(window.innerWidth, window.innerHeight)
    document.body.appendChild(renderer.domElement)


setup(browser(setup))
