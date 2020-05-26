shader_type canvas_item;

uniform float time_factor = 1.0;
uniform vec2 amplitude = vec2(10.0, 5.0);

void vertex() {
	VERTEX.x += sin(TIME * time_factor + VERTEX.x + VERTEX.y) * amplitude.x;
	VERTEX.y += sin(TIME * time_factor + VERTEX.x + VERTEX.y) * amplitude.y;
}