void FlyingEmbers_float(float2 uv, float velocity, float width, float feather, out float alpha)
{
    // [0, 1] -> [-1, 1]
    uv = uv * 2 - 1;
    
    uv.x *= velocity + width;
    uv.y *= width;

    float2 v = float2(2 * velocity, 0);
    float2 p = uv - float2(velocity, 0);
    float r = width;

    float a = dot(v, v);
    float b = dot(v, p);
    float c = dot(p, p) - r * r;
    float d = b * b - a * c;

    // edge fade
    float h = saturate(-b / a);
    float dist = length(p + h * v);
    alpha = smoothstep (0, feather * width, width - dist);
    
    if (d > 0.0)
    {
        d = sqrt(d);
    
        float t0 = max(0, (-b - d) / a);
        float t1 = min(1, (-b + d) / a);
    
        alpha *= saturate(2 * (t1 - t0));
    }
}