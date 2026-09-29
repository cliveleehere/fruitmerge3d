shader_type spatial;

render_mode unshaded, blend_mix, cull_disabled;

uniform vec4 line_color : source_color = vec4(0.2, 0.8, 1.0, 1.0);
uniform float dash_count = 10.0;
uniform float dash_length = .5;
uniform float speed = .1;

void fragment() {
    float y = UV.y;

    // Move the pattern downward
    y -= TIME * speed;

    // Repeat the pattern
    float pattern = fract(y * dash_count);

    // Keep only part of each repeating section
    float dash = step(pattern, dash_length);

    ALBEDO = line_color.rgb;
    ALPHA = dash * line_color.a;
}