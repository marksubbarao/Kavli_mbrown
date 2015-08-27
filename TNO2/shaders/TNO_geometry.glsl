layout(triangles) in;
layout(triangle_strip, max_vertices = 4) out;
//layout(line_strip, max_vertices = 4) out;

uniform float spriteRadius;
uniform float markerAlpha;
uniform float displayMode;
uniform float periCut;
uniform float apCut;
uniform mat4 uv_projectionMatrix;
uniform mat4 uv_modelViewMatrix;
uniform mat4 uv_modelViewInverseMatrix;
uniform mat4 uv_modelViewProjectionMatrix;
uniform int uv_simulationtimeDays;
uniform float uv_simulationtimeSeconds;
uniform float uv_fade;
out vec2 texcoord;
out vec4 color;


mat3 rotationMatrix(vec3 axis, float angle) // axis should be normalized
{
    float s = sin(angle);
    float c = cos(angle);
    float oc = 1.0 - c;
    
    return mat3(oc * axis.x * axis.x + c,           oc * axis.x * axis.y - axis.z * s,  oc * axis.z * axis.x + axis.y * s,
                oc * axis.x * axis.y + axis.z * s,  oc * axis.y * axis.y + c,           oc * axis.y * axis.z - axis.x * s,
                oc * axis.z * axis.x - axis.y * s,  oc * axis.y * axis.z + axis.x * s,  oc * axis.z * axis.z + c);
}

void drawSprite(vec4 position, float radius, float rotation)  // Camera facing square
{  
    vec3 objectSpaceUp = vec3(0, 0, 1);
    vec3 objectSpaceCamera = (uv_modelViewInverseMatrix * vec4(0, 0, 0, 1)).xyz;
    vec3 cameraDirection = normalize(objectSpaceCamera - position.xyz);
    vec3 orthogonalUp = normalize(objectSpaceUp - cameraDirection * dot(cameraDirection, objectSpaceUp));
    vec3 rotatedUp = rotationMatrix(cameraDirection, rotation) * orthogonalUp;
    vec3 side = cross(rotatedUp, cameraDirection);
    texcoord = vec2(0, 1);
	gl_Position = uv_modelViewProjectionMatrix * vec4(position.xyz + radius * (-side + rotatedUp), 1);
	EmitVertex();
    texcoord = vec2(0, 0);
	gl_Position = uv_modelViewProjectionMatrix * vec4(position.xyz + radius * (-side - rotatedUp), 1);
	EmitVertex();
    texcoord = vec2(1, 1);
	gl_Position = uv_modelViewProjectionMatrix * vec4(position.xyz + radius * (side + rotatedUp), 1);
	EmitVertex();
    texcoord = vec2(1, 0);
	gl_Position = uv_modelViewProjectionMatrix * vec4(position.xyz + radius * (side - rotatedUp), 1);
	EmitVertex();
	EndPrimitive();
}

void main()
{
    if(uv_fade<0.001)
        return;
	color=vec4(1.0,1.0,0.4,markerAlpha*uv_fade);
    //Epoc
    float epoc = 10957.5;//(J2000) 2000-01-01 -> (2000-1970)*365.25
	float TWOPI=6.2831853;
    //Transform
    vec3 globalUp = vec3(0,1,0);
    //Use the data from the three vertices to decode the orbit params
	float e = gl_in[0].gl_Position.y;
	float a = gl_in[0].gl_Position.x;
	float i = gl_in[0].gl_Position.z*TWOPI/360.;
 	float OMEGA = gl_in[1].gl_Position.y*TWOPI/360.;
	float omega = gl_in[1].gl_Position.x*TWOPI/360.;
	float M = gl_in[1].gl_Position.z*TWOPI/360.;
	float Hmag = gl_in[2].gl_Position.x;
	int displayTrigger = int(gl_in[2].gl_Position.y);
	float discovery = gl_in[2].gl_Position.z;

    float M0 = M+3.1415926;
    float period = sqrt(a*a*a)*365.25;
	float boost=1.0;
    float dayfract = uv_simulationtimeSeconds/(24.0*3600.0);//0.5*2.0*3.14*(time)/(sqrt(a.x*a.x*a.x/3347937656.835192));
    float days = uv_simulationtimeDays-epoc;
    M = M0+2.0*3.141526*mod(0.5+(days+dayfract)/period,1.0);
	int display =0;
	float farDist=apCut;
	float nearDist=periCut;
	if (displayMode>0.5 && displayMode<1.5){
	  display = 1;
	} 
	if (displayMode>1.5 && displayMode<2.5){
	  display = 1;
	  farDist=100.;
	  if (displayTrigger ==2) {
	    color=vec4(0.2,1.0,1.0,markerAlpha*uv_fade);
		boost=3.0;
	  } 
	}
	if (displayMode>2.5 && displayMode<3.5){
	  display = 1;
	  if (displayTrigger ==3) {
	    color=vec4(0.2,1.0,1.0,markerAlpha*uv_fade);
		boost=3.0;
	  } 
	}
	if (displayMode>3.5 && displayMode<4.5 && displayTrigger!=0){
	  display = 1;
	  if (displayTrigger ==4) {
	    color=vec4(0.2,1.0,1.0,markerAlpha*uv_fade);
		boost=3.0;
	  }
    }
	if (displayMode>4.5 && displayMode<5.5 && displayTrigger!=0){
	  display = 1;
    }

    if (spriteRadius>0.0 && (a*(1.-e)>nearDist) && (a*(1.+e)<farDist) && display==1) {
       a=1495.97871*a;
		float E = M+3.1415926;
		E = E + e*sin(E)/(1.0-e*cos(E));
		//Iterate Kepler, if you see any bad behaviour with eccentric asteroids, try adding a few more or a dynamic loop
		for (int j=0; j < 15;j++) {
		   E = E - (E-e*sin(E)-M)/(1.0-e*cos(E));
		}

		vec3 b = vec3(i,omega,OMEGA);
		vec3 c = cos(b);
		vec3 s = sin(b);

		vec3 P;
		P.x = c.z*c.y - s.z*c.x*s.y;
		P.y = c.z*s.y + s.z*c.x*c.y;
		P.z = -s.z*s.x;
		P=vec3(-P.x,-P.y,-P.z);

		vec3 Q;
		Q.x = -s.z*c.y - c.z*c.x*s.y;
		Q.y = -s.z*s.y + c.z*c.x*c.y;
		Q.z = -s.x*c.z;
		Q = vec3(-Q.x,-Q.y,-Q.z);

		vec4 pos = vec4(a * (cos(E) - e) * P + a * sqrt(1.0 - e * e) * sin(E) * Q, 1.0);
		if ((discovery-40587)<uv_simulationtimeDays) {
		//if (Hmag<30.) {
		  drawSprite(pos,boost*spriteRadius*clamp(8.0-Hmag,2.0,4.0),0.0);
		}
	}
}
  
  
  
  