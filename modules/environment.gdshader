shader_type spatial;

render_mode depth_prepass_alpha, cull_disabled;

uniform bool CURVATURE_ACTIVE;
uniform sampler2D BASE_TEX;
uniform vec4 color;

varying vec4 world_vertex; // Declare a variável aqui para que ela seja acessível em ambas as funções

void vertex() {
	float CURVATURE_DISTANCE = 40.0;
	float CURVATURE = 2.4;
	float SPRITE_POS_X = 0.0;
	float SPRITE_POS_Y = 0.06;
    if (CURVATURE_ACTIVE == true) {
		
        vec4 vertex_world = (MODEL_MATRIX * vec4(VERTEX, 1.0)); // Declare a variável dentro da função vertex()
        float dist = length(VIEW_MATRIX [3].xyz - vertex_world.xyz) / CURVATURE_DISTANCE;
        VERTEX.x += pow(dist, CURVATURE) * SPRITE_POS_X;
        VERTEX.y += pow(dist, CURVATURE) * (SPRITE_POS_Y);
		//VERTEX.y -= (SPRITE_POS_Y * CURVATURE_DISTANCE / CURVATURE) - (SPRITE_POS_Y * CURVATURE);
 // Inverta a direção da curvatura aqui (adicionando em vez de subtrair)
    }
    
    // Defina a variável varying world_vertex para que ela possa ser usada em fragment()
    world_vertex = (MODEL_MATRIX * vec4(VERTEX, 1.0));
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
    ALPHA  = tex.a;
}
// you can find the base of this shader in reddit
// https://www.reddit.com/r/godot/comments/t14wss/3d_world_bend_effect/
// If you improve this please show me