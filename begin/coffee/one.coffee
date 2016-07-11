# one threejs

# 场景 scene
# 相机 camera
# 渲染器 renderer

# 创建场景
scene = new THREE.Scene()

# 远景相机 进行远景投影的相机（ 透视，人眼模式
# 参数 ： 相机视锥体垂直视角，相机视锥体宽高比， 相机视锥体近裁减面， 相机视锥体远裁减面
camera = new THREE.PerspectiveCamera 75, window.innerWidth / window.innerHeight, 1, 1000

# 渲染器
renderer = new THREE.WebGLRenderer
    alpha: true
    antialias: true

renderer.setSize window.innerWidth, window.innerHeight

document.getElementById('world').appendChild renderer.domElement

#  正方体
geometry = new THREE.BoxGeometry 1, 1, 1

# 基础材质
material = new THREE.MeshBasicMaterial
    color: 0xffffff

# 网孔
cube = new THREE.Mesh geometry, material

scene.add cube

camera.position.z = 10
cube.position.z = -10

render = ->
    requestAnimationFrame render
    renderer.render scene, camera
    cube.rotation.x += 0.1;
    cube.rotation.y += 0.1;

render()
