# settings
settings = 
    scene : new THREE.Scene
    camera : new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000)
    renderer : new THREE.WebGLRenderer
    maxWidth : window.innerWidth
    maxHeight : window.innerHeight


# general things
setSize = ->
    @renderer.setSize(@maxWidth, @maxHeight)

addRenderer = ->
    document.body.appendChild(@renderer.domElement)
    @camera.position.z = 5

render = -> @renderer.render(@scene, @camera)

addToScene = (object) -> @scene.add(object)


# some less general things...
getCube = ->
    geometry = new THREE.BoxGeometry(1,1,1)
    material = new THREE.MeshBasicMaterial( color: 0x00ff00 )
    new THREE.Mesh(geometry, material)



# All objects in the scene
objects = [ getCube() ]

# bind the settings object to setSize(addRender())
# build more complex functions out of simple ones
setup = _.bind(_.compose(setSize, addRenderer), settings)
setup()

# do the rendering
setInterval(_.bind(render, settings), 1000/24)


# Add all objects to the scene.
_.map(objects, _.bind(addToScene, settings))
