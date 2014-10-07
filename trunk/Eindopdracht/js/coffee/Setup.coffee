module 'Setup'

setSize = -> @renderer.setSize(@maxWidth, @maxHeight)

renderReady = ->
    document.body.appendChild(@renderer.domElement)
    @camera.position.z = 5

render = -> @renderer.render(@scene, @camera)

addToScene = (object) -> @scene.add(object)

# build more complex functions out of simple ones
Setup.init = (settings) -> 
    _.bind(_.compose(setSize, renderReady), settings)()
    setInterval(_.bind(render, settings), settings.frameRate)
    Setup.add = _.bind(addToScene, settings)
