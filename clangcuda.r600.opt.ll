; ModuleID = 'clangcuda.r600.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind readnone
declare i32 @llvm.r600.read.tidig.x() #0

; Function Attrs: nounwind readnone
declare i32 @llvm.r600.read.local.size.x() #0

; Function Attrs: nounwind readnone
declare i32 @llvm.r600.read.tgid.x() #0

; Function Attrs: alwaysinline nounwind readnone
define i32 @blockIdx_x() #1 {
entry:
  %0 = tail call i32 @llvm.r600.read.tgid.x()
  ret i32 %0
}

; Function Attrs: alwaysinline nounwind readnone
define i32 @blockDim_x() #1 {
entry:
  %0 = tail call i32 @llvm.r600.read.local.size.x()
  ret i32 %0
}

; Function Attrs: alwaysinline nounwind readnone
define i32 @threadIdx_x() #1 {
entry:
  %0 = tail call i32 @llvm.r600.read.tidig.x()
  ret i32 %0
}

; Function Attrs: nounwind uwtable
define void @_Z6kernelPU3AS1fPKU3AS1fS2_(float addrspace(1)* noalias nocapture %c, float addrspace(1)* noalias nocapture %a, float addrspace(1)* noalias nocapture %b) #2 {
  %1 = tail call i32 @llvm.r600.read.tgid.x() #3
  %2 = tail call i32 @llvm.r600.read.local.size.x() #3
  %3 = tail call i32 @llvm.r600.read.tidig.x() #3
  %4 = mul nsw i32 %2, %1
  %5 = add nsw i32 %4, %3
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds float addrspace(1)* %a, i64 %6
  %8 = load float addrspace(1)* %7, align 4
  %9 = getelementptr inbounds float addrspace(1)* %b, i64 %6
  %10 = load float addrspace(1)* %9, align 4
  %11 = fadd float %8, %10
  %12 = getelementptr inbounds float addrspace(1)* %c, i64 %6
  store float %11, float addrspace(1)* %12, align 4
  ret void
}

attributes #0 = { nounwind readnone }
attributes #1 = { alwaysinline nounwind readnone }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf"="true" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
