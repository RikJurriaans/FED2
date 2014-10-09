module 'C'

C.perspectiveCamera = (degrees, color) -> 
    new THREE.PerspectiveCamera(degrees, Settings.width / Settings.height, 1, 1000)
