declare i32 @llvm.r600.read.tidig.x()
declare i32 @llvm.r600.read.local.size.x()
declare i32 @llvm.r600.read.tgid.x()

define i32 @blockIdx_x() alwaysinline {
entry:
        %0 = call i32 @llvm.r600.read.tgid.x()
        ret i32 %0
}

define i32 @blockDim_x() alwaysinline {
entry:
        %0 = call i32 @llvm.r600.read.local.size.x()
        ret i32 %0
}

define i32 @threadIdx_x() alwaysinline {
entry:
        %0 = call i32 @llvm.r600.read.tidig.x()
        ret i32 %0
}
