uniform float uBigWavesElevation;
uniform float uBigWavesSpeed;
uniform vec2 uBigWavesFrequency;
uniform float uTime;

void main()
{

    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    float position = 
        sin(modelPosition.x * uBigWavesFrequency.x + uTime * uBigWavesSpeed) * 
        sin(modelPosition.z * uBigWavesFrequency.y + uTime * uBigWavesSpeed) * 
        uBigWavesElevation;
        
    modelPosition.y += position;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    gl_Position = projectedPosition;
}