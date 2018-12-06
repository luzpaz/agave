#pragma once

#include "Defines.h"

class CDenoiseParams
{
public:
	bool		m_Enabled;
	float		m_Noise;
	float		m_LerpC;
	int		m_WindowRadius;
	float		m_WindowArea;
	float		m_InvWindowArea;
	float		m_WeightThreshold;
	float		m_LerpThreshold;

public:
    HO CDenoiseParams(void)
    {
        /*
        m_Enabled			= true;
        m_Noise				= 1.0f / (0.32f * 0.32f);
        m_LerpC				= 0.2f;
        m_WindowRadius		= 2.0f;
        m_WindowArea		= (2.0f * m_WindowRadius + 1.0f) * (2.0f * m_WindowRadius + 1.0f);
        m_InvWindowArea		= 1.0f / m_WindowArea;
        m_WeightThreshold	= 0.02f;
        m_LerpThreshold		= 0.79f;
        */


        m_Enabled			= true;
        m_Noise				= 0.05f;//0.32f * 0.32f;// / (0.1f * 0.1f);
        m_LerpC				= 0.01f;
        m_WindowRadius		= 6;
        m_WindowArea		= (2.0f * m_WindowRadius + 1.0f) * (2.0f * m_WindowRadius + 1.0f);
        m_InvWindowArea		= 1.0f / m_WindowArea;
        m_WeightThreshold	= 0.1f;
        m_LerpThreshold		= 0.0f;
        /**/
    }

	HO CDenoiseParams& operator=(const CDenoiseParams& Other)
	{
		m_Enabled			= Other.m_Enabled;
		m_Noise				= Other.m_Noise;
		m_LerpC				= Other.m_LerpC;
		m_WindowRadius		= Other.m_WindowRadius;
		m_WindowArea		= Other.m_WindowArea;
		m_InvWindowArea		= Other.m_InvWindowArea;
		m_WeightThreshold	= Other.m_WeightThreshold;
		m_LerpThreshold		= Other.m_LerpThreshold;

		return *this;
	}

	HO void SetWindowRadius(const int& WindowRadius)
	{
		m_WindowRadius		= WindowRadius;
		m_WindowArea		= (2.0f * m_WindowRadius + 1.0f) * (2.0f * m_WindowRadius + 1.0f);
		m_InvWindowArea		= 1.0f / m_WindowArea;
	}
};

struct CRenderSettings {
	float				m_DensityScale;
	int					m_ShadingType;
	float				m_StepSizeFactor;
	float				m_StepSizeFactorShadow;
	float				m_GradientDelta;
	float				m_GradientFactor;
    bool                m_ShowLightsBackground;

	CRenderSettings() :
		m_DensityScale(50.0f),
		m_ShadingType(2),
		m_StepSizeFactor(1.0f),
		m_StepSizeFactorShadow(1.0f),
		m_GradientDelta(4.0f),
		m_GradientFactor(50.0f),
        m_ShowLightsBackground(false)
	{
	}
};
