module 'Cardboard'

fullBrowser = (effect) -> effect.setSize(window.innerWidth, window.innerHeight)

fullscreen = ->
    if (@renderer.domElement.requestFullscreen)
        @renderer.domElement.requestFullscreen()
    else if (@renderer.domElement.msRequestFullscreen)
        @renderer.domElement.msRequestFullscreen()
    else if (@renderer.domElement.mozRequestFullScreen)
        @renderer.domElement.mozRequestFullScreen()
    else if (@renderer.domElement.webkitRequestFullscreen)
        @renderer.domElement.webkitRequestFullscreen()

initControls = (e) ->
    if e.alpha
        window.removeEventListener('deviceorientation', initControls, false)
        @renderer.domElement.addEventListener('click', _.bind(fullscreen, renderer : @renderer), false)
        @orbitControls.enabled = false
        @controls.connect()
        @controls.update()

# Renderer :: Renderer -> Renderer
Cardboard.effect = (renderer) -> 
    renderer.effect = new THREE.StereoEffect(renderer)
    fullBrowser(renderer.effect)
    renderer

Cardboard.init = (scene, camera, renderer) ->
    controls = new THREE.DeviceOrientationControls(camera, true)

    orbitControls = new THREE.OrbitControls(camera, renderer.domElement)
    orbitControls.noZoom = true
    orbitControls.noPan = true
    orbitControls.autoRotate = false

    initControls = _.bind(initControls, renderer: renderer, controls : controls, orbitControls : orbitControls)
    window.addEventListener('deviceorientation', initControls, false)

    controls: controls, orbitControls: orbitControls

