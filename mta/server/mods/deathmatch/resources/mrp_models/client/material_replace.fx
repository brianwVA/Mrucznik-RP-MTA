texture replacementTexture;
float4 materialColor = float4(1, 1, 1, 1);

sampler ReplacementSampler = sampler_state
{
    Texture = <replacementTexture>;
    MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
    AddressU = Wrap;
    AddressV = Wrap;
};

struct PixelInput
{
    float4 diffuse : COLOR0;
    float2 texCoord : TEXCOORD0;
};

float4 replaceMaterial(PixelInput input) : COLOR0
{
    return tex2D(ReplacementSampler, input.texCoord) * input.diffuse * materialColor;
}

technique ReplaceMaterial
{
    pass P0
    {
        PixelShader = compile ps_2_0 replaceMaterial();
    }
}
