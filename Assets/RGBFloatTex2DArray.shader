Shader "Unlit/Tex2DArrayTest"
{
    Properties
    {
        _Textures  ("Textures",   2DArray    ) = "" {}
        _ArrayIndex("ArrayIndex", Range(0, 2)) = 0 
    }

    SubShader
    {
        Tags
        {
            "RenderType" = "Opaque"
        }

        Pass
        {
            CGPROGRAM

            #pragma vertex   vert
            #pragma fragment frag

            // This is not required, use for notice in an unsupported environment.
            #pragma require 2darray

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            UNITY_DECLARE_TEX2DARRAY(_Textures);

            int _ArrayIndex;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv     = v.uv;
                return o;
            }
            
            fixed4 frag (v2f i) : SV_Target
            {
                // z will be rounded.
                fixed4 color  = UNITY_SAMPLE_TEX2DARRAY(_Textures, float3(i.uv.xy, _ArrayIndex));
                return color;
            }

            ENDCG
        }
    }
}