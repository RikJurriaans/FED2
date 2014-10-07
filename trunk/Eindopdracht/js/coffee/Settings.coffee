module 'Settings'

Settings.settings = 
    scene : new THREE.Scene
    camera : new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000)
    renderer : new THREE.WebGLRenderer
    maxWidth : window.innerWidth
    maxHeight : window.innerHeight
    frameRate : 1000/24
