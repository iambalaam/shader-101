Shader "Debug/NormalShader"
{
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vertexShader
            #pragma fragment fragmentShader

            #include "UnityCG.cginc"

            struct VertexData
            {
                float4 vertex : POSITION;
                float3 normal: NORMAL;
            };

            struct v2f
            {
                float3 normal: NORMAL;
                float4 vertex : SV_POSITION;
            };

            float4 _MainTex_ST;

            v2f vertexShader (VertexData v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.normal = mul(unity_ObjectToWorld, v.normal);
                return o;
            }

            fixed4 fragmentShader (v2f i) : SV_Target
            {
                return float4(i.normal,1);
            }
            ENDCG
        }
    }
}
