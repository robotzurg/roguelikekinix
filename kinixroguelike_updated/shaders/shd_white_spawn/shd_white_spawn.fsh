//
// Simple passthrough fragment shader
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float shd_alpha;
uniform float shd_alpha_fade;

float random (vec2 st) {
    return fract(sin(dot(st.xy,vec2(12.9878,78.243)))*43777.545379);
}


void main() {
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
    vec2 st = gl_FragCoord.xy/shd_alpha;
    float rnd = random( st ) * shd_alpha_fade;
    gl_FragColor = vec4(1,1,1,gl_FragColor.a * rnd);
}