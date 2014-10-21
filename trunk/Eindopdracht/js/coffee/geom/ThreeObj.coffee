module 'G'

G.basicMaterial = (color) ->
    new THREE.MeshBasicMaterial( color: color )

G.lambertMaterial = (color) ->
    new THREE.MeshLambertMaterial( color: color )

G.boxGeometry = (size) ->
    new THREE.BoxGeometry(size.x, size.y, size.z)

G.sphereGeometry = (radius, segments) ->
    new THREE.CircleGeometry(radius, segments)

G.create = (material) ->
    (geometry) -> 
        new THREE.Mesh(geometry, material)

