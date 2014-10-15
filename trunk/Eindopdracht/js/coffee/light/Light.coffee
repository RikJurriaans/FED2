module 'L'

# dit kan wat polymorphischer worden.
L.ambientLight = (color) -> new THREE.AmbientLight(color)
L.directionalLight = (color) -> new THREE.DirectionalLight(color)
