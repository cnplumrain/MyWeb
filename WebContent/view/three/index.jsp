<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/three.js"></script>
<script type="text/javascript" src="../js/Detector.js"></script>
<script type="text/javascript" src="../js/stats.min.js"></script>
<script type="text/javascript" src="../js/Cloth.js"></script>
<script type="text/javascript">
function init() {
	var canvas=document.getElementById('mainCanvas');
	var width=window.innerWidth;
	var height=window.innerHeight;
	canvas.width=width;
	canvas.height= height;
    // renderer
    var renderer = new THREE.WebGLRenderer({
        canvas: canvas
    });
    renderer.setClearColor(0x000000); // black

    // scene
    var scene = new THREE.Scene();

    // camera
    var camera = new THREE.PerspectiveCamera(30, width/height, 1, 100);
    camera.position.set(5, 10, 4);
    camera.lookAt(new THREE.Vector3(0, 0, 0));
    scene.add(camera);

 	// sphere
	var ballGeo = new THREE.SphereGeometry( 1, 20, 20 );
	var ballMaterial = new THREE.MeshNormalMaterial();

	sphere = new THREE.Mesh( ballGeo, ballMaterial );
	sphere.castShadow = true;
	sphere.receiveShadow = true;
	scene.add( sphere );

    // render
    renderer.render(scene, camera);
}
</script>
</head>
<body onload="init()">

	<canvas id="mainCanvas" width="400px" height="300px" ></canvas>
</body>
</html>