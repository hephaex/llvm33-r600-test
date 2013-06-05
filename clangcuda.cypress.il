@blockIdx_x:
	.section	.AMDGPU.config
.long	166100
.long	257
.long	165900
.long	0
	.text
; BB#0:                                 ; %entry
	CF_END
	PAD

@blockDim_x:
	.section	.AMDGPU.config
.long	166100
.long	257
.long	165900
.long	0
	.text
; BB#0:                                 ; %entry
	CF_END
	PAD

@threadIdx_x:
	.section	.AMDGPU.config
.long	166100
.long	257
.long	165900
.long	0
	.text
; BB#0:                                 ; %entry
	CF_END
	PAD

@_Z6kernelPU3AS1fPKU3AS1fS2_:
	.section	.AMDGPU.config
.long	166100
.long	262
.long	165900
.long	0
	.text
; BB#0:
	ALU 3, @22, KC0[], KC1[]
	TEX 2 @10
	ALU 7, @26, KC0[], KC1[]
	TEX 0 @16
	ALU 0, @34, KC0[], KC1[]
	TEX 1 @18
	ALU 0, @35, KC0[], KC1[]
	RAT_WRITE_CACHELESS_32_eg T1.X, T0.X, 1
	CF_END
	PAD
	Fetch clause starting at 10:
	VTX_READ_32 T3.X, T3.X, 40
	VTX_READ_32 T4.X, T4.X, 36
	VTX_READ_32 T5.X, T5.X, 24
	Fetch clause starting at 16:
	VTX_READ_32 T2.X, T2.X, 44
	Fetch clause starting at 18:
	VTX_READ_32 T1.X, T1.X, 0
	VTX_READ_32 T2.X, T2.X, 0
	ALU clause starting at 22:
	  MOV              * T4.X, 0.0,  
	  MOV              * T3.X, PV.x,  
	  MOV              * T2.X, T4.X,  
	  MOV              * T5.X, T4.X,  
	ALU clause starting at 26:
	  MULLO_INT        * T1.X, T5.X, T1.X,  
	  ADD_INT          * T0.X, T1.X, T0.X,  
	  LSHL             * T5.X, PV.x, literal.x,  
	2(2.802597e-45), 0(0.000000e+00)
	  ADD_INT          * T0.X, T4.X, PV.x,  
	  LSHR             * T0.X, PV.x, literal.x,  
	2(2.802597e-45), 0(0.000000e+00)
	  ADD_INT          * T1.X, T3.X, T5.X,  
	ALU clause starting at 34:
	  ADD_INT          * T2.X, T2.X, T5.X,  
	ALU clause starting at 35:
	  ADD              * T1.X, T1.X, T2.X,  

