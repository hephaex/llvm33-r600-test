; ModuleID = 'clangcuda_intrin.r600.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32, i32, i32 }

; Function Attrs: nounwind readnone
declare i32 @llvm.r600.read.tidig.x() #0

; Function Attrs: nounwind readnone
declare i32 @llvm.r600.read.local.size.x() #0

; Function Attrs: nounwind readnone
declare i32 @llvm.r600.read.tgid.x() #0

; Function Attrs: alwaysinline
define i32 @blockIdx_x() #1 {
entry:
  %0 = call i32 @llvm.r600.read.tgid.x()
  ret i32 %0
}

; Function Attrs: alwaysinline
define i32 @blockDim_x() #1 {
entry:
  %0 = call i32 @llvm.r600.read.local.size.x()
  ret i32 %0
}

; Function Attrs: alwaysinline
define i32 @threadIdx_x() #1 {
entry:
  %0 = call i32 @llvm.r600.read.tidig.x()
  ret i32 %0
}

; Function Attrs: uwtable
define void @_Z6kernelPU3AS1fPKU3AS1fS2_(float addrspace(1)* noalias %c, float addrspace(1)* noalias %a, float addrspace(1)* noalias %b) #2 {
  %1 = alloca float addrspace(1)*, align 8
  %2 = alloca float addrspace(1)*, align 8
  %3 = alloca float addrspace(1)*, align 8
  %blockIdx = alloca %struct.anon, align 4
  %blockDim = alloca %struct.anon, align 4
  %threadIdx = alloca %struct.anon, align 4
  %i = alloca i32, align 4
  store float addrspace(1)* %c, float addrspace(1)** %1, align 8
  store float addrspace(1)* %a, float addrspace(1)** %2, align 8
  store float addrspace(1)* %b, float addrspace(1)** %3, align 8
  %4 = call i32 @blockIdx_x()
  %5 = getelementptr inbounds %struct.anon* %blockIdx, i32 0, i32 0
  store i32 %4, i32* %5, align 4
  %6 = call i32 @blockDim_x()
  %7 = getelementptr inbounds %struct.anon* %blockDim, i32 0, i32 0
  store i32 %6, i32* %7, align 4
  %8 = call i32 @threadIdx_x()
  %9 = getelementptr inbounds %struct.anon* %threadIdx, i32 0, i32 0
  store i32 %8, i32* %9, align 4
  %10 = getelementptr inbounds %struct.anon* %blockIdx, i32 0, i32 0
  %11 = load i32* %10, align 4
  %12 = getelementptr inbounds %struct.anon* %blockDim, i32 0, i32 0
  %13 = load i32* %12, align 4
  %14 = mul nsw i32 %11, %13
  %15 = getelementptr inbounds %struct.anon* %threadIdx, i32 0, i32 0
  %16 = load i32* %15, align 4
  %17 = add nsw i32 %14, %16
  store i32 %17, i32* %i, align 4
  %18 = load i32* %i, align 4
  %19 = sext i32 %18 to i64
  %20 = load float addrspace(1)** %2, align 8
  %21 = getelementptr inbounds float addrspace(1)* %20, i64 %19
  %22 = load float addrspace(1)* %21, align 4
  %23 = load i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = load float addrspace(1)** %3, align 8
  %26 = getelementptr inbounds float addrspace(1)* %25, i64 %24
  %27 = load float addrspace(1)* %26, align 4
  %28 = fadd float %22, %27
  %29 = load i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = load float addrspace(1)** %1, align 8
  %32 = getelementptr inbounds float addrspace(1)* %31, i64 %30
  store float %28, float addrspace(1)* %32, align 4
  ret void
}

attributes #0 = { nounwind readnone }
attributes #1 = { alwaysinline }
attributes #2 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
