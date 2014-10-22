module 'ThreeObj'

ThreeObj.set = (object) -> 
    (property) -> 
        (val) ->
            object.position[property] = val
            object
    

ThreeObj.basicMaterial = (color) ->
    new THREE.MeshBasicMaterial( color: color )

ThreeObj.lambertMaterial = (color) ->
    new THREE.MeshLambertMaterial( color: color )

ThreeObj.boxGeometry = (size) ->
    new THREE.BoxGeometry(size.x, size.y, size.z)

ThreeObj.sphereGeometry = (radius, segments) ->
    new THREE.CircleGeometry(radius, segments)

ThreeObj.create = (material) ->
    (geometry) -> 
        new THREE.Mesh(geometry, material)

