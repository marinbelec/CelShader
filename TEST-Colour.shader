// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader ".Test/Colour"
{
	Properties
	{
		_Color ("Main colour", Color) = (1,1,1,1)
	}
	SubShader
	{
		Pass
		{
		CGPROGRAM
		#pragma vertex vert
		#pragma fragment frag

		struct appdata
		{
			float4 vertex : POSITION;
		};

		struct v2f
		{
			float4 pos : SV_POSITION;
		};

		fixed4 _Color;

		v2f vert (appdata IN)
		{
			v2f OUT;
			OUT.pos = UnityObjectToClipPos(IN.vertex);
			return OUT;
		}

		fixed4 frag (v2f IN) : COLOR
		{
			return fixed4(_Color);
		}

		ENDCG
		}
	}
}