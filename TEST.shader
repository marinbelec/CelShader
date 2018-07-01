﻿// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Cel/Test"
{
	Properties
	{
		_Color ("Main colour", Color) = (1,1,1,1)
		_MainTex ("Main texture", 2D) = "white" {}
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
			float2 texcoord : TEXCOORD0;
		};

		struct v2f
		{
			float4 pos : SV_POSITION;
			float2 texcoord : TEXCOORD0;
		};

		fixed4 _Color;
		sampler2D _MainTex;

		v2f vert (appdata IN)
		{
			v2f OUT;
			OUT.pos = UnityObjectToClipPos(IN.vertex);
			OUT.texcoord = IN.texcoord;
			return OUT;
		}

		fixed4 frag (v2f IN) : COLOR
		{
			fixed4 texColor = tex2D	(_MainTex, IN.texcoord);
			return texColor;
			// return _Color;
		}

		ENDCG
		}
	}
}