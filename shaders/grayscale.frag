// by Nikos Papadopoulos, 4rknova / 2013
// WTFPL

#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main
#define F vec3(.2126, .7152, .0722)

void mainImage(out vec4 c, vec2 p)
{
	c = vec4(vec3(dot(texture(iChannel0, p.xy / iResolution.xy).xyz,F)), 1);
}