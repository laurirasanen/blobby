const int MAX_SDF = 512;
uniform vec4 u_positions[MAX_SDF];

const int MAX_STEPS = 100;
const float MAX_DIST = 100.0;
const float SURF_DIST = 0.01;

const float SMOOTHNESS = 1.0;

// https://iquilezles.org/articles/distfunctions/
float sdf_sphere(vec3 p, vec3 sp, float r)
{
    return length(sp - p) - r;
}

float sdf_box(vec3 p, vec3 sp, vec3 b)
{
    vec3 q = abs(sp - p) - b;
    return length(max(q, 0.0)) + min(max(q.x, max(q.y, q.z)), 0.0);
}

float smooth_union(float d1, float d2, float k)
{
    float h = clamp(0.5 + 0.5 * (d2 - d1) / k, 0.0, 1.0);
    return mix(d2, d1, h) - k * h * (1.0 - h);
}

float smooth_subtraction(float d1, float d2, float k)
{
    float h = clamp(0.5 - 0.5 * (d2 + d1) / k, 0.0, 1.0);
    return mix(d2, -d1, h) + k * h * (1.0 - h);
}

float smooth_intersection(float d1, float d2, float k)
{
    float h = clamp(0.5 - 0.5 * (d2 - d1) / k, 0.0, 1.0);
    return mix(d2, d1, h) + k * h * (1.0 - h);
}

float get_dist(vec3 p)
{
    float field = MAX_DIST;

    for (int i = 0; i < int(u_globals[1]); i++)
    {
        // test wave
        vec3 pos = u_positions[i].xyz;
        pos.y += sin(mod(pos.x + pos.z, 16) * u_globals[0] * 0.5) * 0.3 +
            cos(pos.x * u_globals[0] * 0.1);

        float dist = sdf_sphere(
            p,
            pos,
            u_positions[i].w
        );
        field = smooth_union(
            field,
            dist,
            SMOOTHNESS
        );
    }

    return field;
}

vec3 get_normal(vec3 p)
{
    float d = get_dist(p);
    vec2 e = vec2(0.01, 0.0);
    vec3 norm = d - vec3(
        get_dist(p - e.xyy),
        get_dist(p - e.yxy),
        get_dist(p - e.yyx)
    );
    return normalize(norm);
}

float ray_march(vec3 origin, vec3 direction)
{
    float d = 0.0;
    for (int i = 0; i < MAX_STEPS; i++)
    {
        vec3 p = origin + direction * d;
        float sd = get_dist(p);
        d += sd;
        if (d > MAX_DIST || sd < SURF_DIST)
        {
            break;
        }
    }
    return d;
}
