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

ThreeObj.sphereGeometry = (radius, wsegments, hsegments) ->
    new THREE.SphereGeometry(radius, wsegments, hsegments)

ThreeObj.create = (material) ->
    (geometry) -> 
        new THREE.Mesh(geometry, material)

