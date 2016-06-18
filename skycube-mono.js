    AFRAME.registerComponent('skycube', {
      schema: {folder: { type: "string" }},

      update: function() {
        var loader = new THREE.CubeTextureLoader();
        var urls = [ "L-2.jpg","L-0.jpg","L-5.jpg","L-4.jpg","L-1.jpg","L-3.jpg"];
        var materialArray = [];
        for (var i = 0; i < 6; i++) {
          materialArray.push( new THREE.MeshBasicMaterial({
            map: (new THREE.TextureLoader).load(this.data.folder+"/" + urls[i]),
            depthWrite: false
          }));
        }
        var material = new THREE.MeshFaceMaterial(materialArray);
        var skyboxGeometry = new THREE.BoxGeometry(500,500,500);
        this.el.setObject3D('mesh', new THREE.Mesh(skyboxGeometry,material));
        this.materials = material;
      }
    });