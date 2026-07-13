texture replacementTexture;

sampler ReplacementSampler = sampler_state
{
    Texture = <replacementTexture>;
    MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
    AddressU = Wrap;
    AddressV = Wrap;
};

technique ReplaceMaterial
{
    pass P0
    {
        Texture[0] = <replacementTexture>;
    }
}
