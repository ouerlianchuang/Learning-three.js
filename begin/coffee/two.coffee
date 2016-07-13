scene = new THREE.Scene()

camera = new THREE.PerspectiveCamera 45, window.innerWidth / window.innerHeight, 0.1, 1000

spotLight = new THREE.SpotLight 0xffffff

spotLight.castShadow = true
spotLight.shadow.bias = 0.01


spotLight.position.set -40, 60, -10

renderer = new THREE.WebGLRenderer
    alpha: true
    antialias: true

renderer.setClearColor(new THREE.Color(0xEEEEEE))

renderer.setSize window.innerWidth, window.innerHeight

renderer.shadowMap.enabled = true
renderer.shadowMapSoft = true
axes = new THREE.AxisHelper 20

grid = new THREE.GridHelper(50, 5)
scene.add(grid);

planeGeometry = new THREE.PlaneGeometry 60, 20
planeMaterial = new THREE.MeshLambertMaterial
    color: 0xcccccc
plane = new THREE.Mesh planeGeometry, planeMaterial
plane.rotation.x = -0.5 * Math.PI
plane.position.x = 15
plane.position.y = 0
plane.position.z = 0
plane.receiveShadow = true;

cubeGeometry = new THREE.BoxGeometry 4, 4, 4
cubeMaterial = new THREE.MeshLambertMaterial
    color: 0x000000
cube = new THREE.Mesh cubeGeometry, cubeMaterial
cube.position.x = -4
cube.position.y = 4
cube.position.z = 0
cube.castShadow = true;

sphereGeometry = new THREE.SphereGeometry 4, 20, 20
sphereMaterial = new THREE.MeshLambertMaterial
    color: 0x7777ff
sphere = new THREE.Mesh sphereGeometry, sphereMaterial
sphere.position.x = 20
sphere.position.y = 4
sphere.position.z = 2
sphere.castShadow = true;

spotLight = new THREE.SpotLight(0xffffff);
spotLight.position.set(-40, 60, -10);
spotLight.castShadow = true;
spotLight.shadow.mapSize.width = 4096*2
spotLight.shadow.mapSize.height = 4096*2

# spotLight.shadow.camera.near = 8;
# spotLight.shadow.camera.far = 30;
# spotLight.shadow.darkness = 0.5;
# spotLight.shadow.camera.visible = true
# spotLight.shadowMapWidth = 4096*2;
# spotLight.shadowMapHeight = 4096*2;
# spotLight.shadowBias = 0

# game_var.shadowLight.castShadow = true
# game_var.shadowLight.shadow.camera.left = -400
# game_var.shadowLight.shadow.camera.right = 400
# game_var.shadowLight.shadow.camera.top = 400
# game_var.shadowLight.shadow.camera.bottom = -400
# game_var.shadowLight.shadow.camera.near = 1
# game_var.shadowLight.shadow.camera.far = 1000

# game_var.shadowLight.shadow.mapSize.width = 2048
# game_var.shadowLight.shadow.mapSize.height = 2048

controls = new THREE.OrbitControls( camera );

scene.add(spotLight);


scene.add cube
scene.add sphere
scene.add axes
scene.add plane

scene.add spotLight

camera.position.x = -30
camera.position.y = 40
camera.position.z = 30
camera.lookAt(scene.position);

document.getElementById('world').appendChild renderer.domElement

renderScene = ->
    requestAnimationFrame renderScene
    renderer.render scene, camera

renderScene()

