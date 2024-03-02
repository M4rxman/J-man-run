shader_type spatial;

render_mode depth_prepass_alpha, cull_disabled;

uniform bool CURVATURE_ACTIVE;
uniform sampler2D BASE_TEX;
varying vec4 world_vertex;
uniform vec4 color;

void vertex() {
    float CURVATURE_DISTANCE = 70.0;
    float CURVATURE = 2.6;
    float SPRITE_POS_X = 0.0;
    float SPRITE_POS_Y = 0.7;

    if (CURVATURE_ACTIVE == true) {
        vec4 vertex_world = (MODEL_MATRIX * vec4(VERTEX, 1.0));
        float dist = length(VIEW_MATRIX[3].xyz - vertex_world.xyz) / CURVATURE_DISTANCE;
        
        // Deform the vertex positions
        VERTEX.x += pow(dist, CURVATURE) * SPRITE_POS_X;
        VERTEX.y += pow(dist, CURVATURE) * SPRITE_POS_Y;
        VERTEX.z -= pow(dist, CURVATURE) / SPRITE_POS_Y;
    }
}

void fragment() {
    vec4 tex = texture(BASE_TEX, UV);
    
    if (tex.a < 0.3) {
        discard;
    }
    
    // Use a variável varying world_vertex aqui para calcular a iluminação
    vec3 normal = normalize(world_vertex.xyz - (MODEL_MATRIX * vec4(0.0, 0.0, 0.0, 1.0)).xyz); // Normal calculada após a deformação
    
    float diffuse = max(0.8, dot(normal, normalize(VIEW_MATRIX[3].xyz - world_vertex.xyz)));
    
    ALBEDO = tex.rgb * color.rgb * diffuse;
    ALPHA  = tex.a;;
}
