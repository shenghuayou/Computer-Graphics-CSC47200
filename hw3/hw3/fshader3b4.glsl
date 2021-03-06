#version 330


// Interpolated values from the vertex shaders
in vec3 vColor;
in vec3 Position_worldspace;
in vec3 Normal_cameraspace;
in vec3 EyeDirection_cameraspace;
in vec3 LightDirection_cameraspace;

out vec4 fragColor;

void main(){

	// Light emission properties
	vec3 LightColor = vec3(1,1,1);
	float LightPower = 0.6f;
	
	// Material properties
	vec3 MaterialDiffuseColor = vColor;
	vec3 MaterialAmbientColor = vec3(0.4,0.4,0.4) * MaterialDiffuseColor;
	vec3 MaterialSpecularColor = vec3(0.3,0.3,0.3);
	// Normal of the computed fragment, in camera space
	vec3 n = normalize( Normal_cameraspace );
	// Direction of the light (from the fragment to the light)
	vec3 l = normalize( LightDirection_cameraspace );
	// Cosine of the angle between the normal and the light direction, 
	// clamped above 0
	//  - light is at the vertical of the triangle -> 1
	//  - light is perpendiular to the triangle -> 0
	//  - light is behind the triangle -> 0
	float cosTheta = clamp( dot( n, l ), 0, 1);

	// Eye vector (towards the camera)
	vec3 E = normalize(EyeDirection_cameraspace);
	// Direction in which the triangle reflects the light
	vec3 R = reflect(-l, n);
	// Cosine of the angle between the Eye vector and the Reflect vector,
	// clamped to 0
	//  - Looking into the reflection -> 1
	//  - Looking elsewhere -> < 1
	float cosAlpha = clamp( dot( E,R ), 0, 1 );
	
	// Ambient : simulates indirect lighting
	// Diffuse : "color" of the object
	// Specular : reflective highlight, like a mirror
	
	fragColor = vec4((MaterialAmbientColor +
		       LightPower * cosTheta * MaterialDiffuseColor * LightColor +
		       LightPower * pow(cosAlpha,5) * MaterialSpecularColor * LightColor) , 1.0);
		       
}