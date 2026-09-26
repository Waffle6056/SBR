shader_type spatial;


uniform sampler2D bumpNoise;
uniform sampler2D textureNoise;
varying vec4 world_position;

void vertex() {
	// Called for every vertex the material is visible on.
	world_position = (MODEL_MATRIX * vec4(VERTEX, 1.0));
	VERTEX.y += texture(bumpNoise, world_position.xz).r * 0.1;
}

void fragment() {
	// Called for every pixel the material is visible on.
	float n = texture(textureNoise, world_position.xz).r + 0.2;
	ALBEDO = vec3(1.0 * n, 1.0 * n, 1.2 * n);
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
