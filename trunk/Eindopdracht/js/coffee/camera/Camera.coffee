module 'Camera'

Camera.perspectiveCamera = -> 
    ding = new THREE.PerspectiveCamera(90, 1, 0.001, 700)
    ding.position.z = 5
    ding

