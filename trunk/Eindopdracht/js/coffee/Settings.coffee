module 'Settings'

Settings.settings = 
    scene : new THREE.Scene
    camera : new THREE.PerspectiveCamera(90, 1, 0.001, 700)
    renderer : new THREE.WebGLRenderer
    maxWidth : window.innerWidth
    maxHeight : window.innerHeight
    frameRate : 1000/24
