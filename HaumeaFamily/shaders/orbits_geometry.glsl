layout(triangles) in;
//layout(triangle_strip, max_vertices = 4) out;
layout(line_strip, max_vertices = 128) out;

uniform float spriteRadius;
uniform float orbitsAlpha;
uniform mat4 uv_projectionMatrix;
uniform mat4 uv_modelViewMatrix;
uniform mat4 uv_modelViewInverseMatrix;
uniform mat4 uv_modelViewProjectionMatrix;
uniform int uv_simulationtimeDays;
uniform float uv_simulationtimeSeconds;
uniform float uv_fade;
//out vec2 texcoord;
out vec4 color;


void main()
{
    if(uv_fade<0.001)
        return;

    //Epoch
    float epoch = 10957.5;//(J2000) 2000-01-01 -> (2000-1970)*365.25
	float TWOPI=6.2831853;
	color=vec4(4.0,0.2,1.0,orbitsAlpha*uv_fade);

    //Transform
    vec3 globalUp = vec3(0,1,0);
    //Use the data from the three vertices to decode the orbit params
	float e = gl_in[0].gl_Position.y;
	float a = 1495.97871*gl_in[0].gl_Position.x;
	float i = gl_in[0].gl_Position.z*TWOPI/360.;
 	float OMEGA = gl_in[1].gl_Position.y*TWOPI/360.;
	float omega = gl_in[1].gl_Position.x*TWOPI/360.;
	float M = gl_in[1].gl_Position.z*TWOPI/360.;
	float Hmag = gl_in[2].gl_Position.x;
	float per_y = gl_in[2].gl_Position.y;
	float discovery = gl_in[2].gl_Position.z;

	vec3 b = vec3(-i,omega,OMEGA);
	vec3 c = cos(b);
	vec3 s = sin(b);

	vec4 pos; 
	float E=0.0;
	float dTheta=2.0*3.1415926535/127.;
	for (int i=0;i<128;i++) {
		E=i*dTheta;

		vec3 P;
		P.x = c.z*c.y - s.z*c.x*s.y;
		P.y = c.z*s.y + s.z*c.x*c.y;
		P.z = s.z*s.x;
		P=vec3(-P.x,-P.y,-P.z);

		vec3 Q;
		Q.x = -s.z*c.y - c.z*c.x*s.y;
		Q.y = -s.z*s.y + c.z*c.x*c.y;
		Q.z = s.x*c.z;
		Q = vec3(-Q.x,-Q.y,-Q.z);

		pos = vec4(a * (cos(E) - e) * P + a * sqrt(1.0 - e * e) * sin(E) * Q, 1.0);
		gl_Position = uv_modelViewProjectionMatrix * pos;
		EmitVertex();
	}
	EndPrimitive();
}
