//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 color = vec4(1.0,1.0,1.0,gl_FragColor.a);
	gl_FragColor = color;
}
