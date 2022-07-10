; ModuleID = '/scratch/users/sx233/dataflow/vitis_hls_expr/mmm/mmm_example/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: noinline
define void @apatb_top_ir([256 x float]* %C, [256 x float]* %A, [256 x float]* %B) local_unnamed_addr #1 {
entry:
  %malloccall = tail call i8* @malloc(i64 262144)
  %C_copy = bitcast i8* %malloccall to [256 x [256 x float]]*
  %malloccall1 = call i8* @malloc(i64 262144)
  %A_copy3 = bitcast i8* %malloccall1 to [256 x [128 x i64]]*
  %malloccall2 = call i8* @malloc(i64 262144)
  %B_copy4 = bitcast i8* %malloccall2 to [128 x [256 x i64]]*
  %0 = bitcast [256 x float]* %C to [256 x [256 x float]]*
  %1 = bitcast [256 x float]* %A to [256 x [256 x float]]*
  %2 = bitcast [256 x float]* %B to [256 x [256 x float]]*
  call void @copy_in([256 x [256 x float]]* %0, [256 x [256 x float]]* %C_copy, [256 x [256 x float]]* %1, [256 x [128 x i64]]* %A_copy3, [256 x [256 x float]]* %2, [128 x [256 x i64]]* %B_copy4)
  %3 = getelementptr inbounds [256 x [256 x float]], [256 x [256 x float]]* %C_copy, i32 0, i32 0
  %4 = getelementptr [256 x [128 x i64]], [256 x [128 x i64]]* %A_copy3, i32 0, i32 0
  %5 = getelementptr [128 x [256 x i64]], [128 x [256 x i64]]* %B_copy4, i32 0, i32 0
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"([128 x i64]* %4, i32 0, i32 1, i32 0) ], !dbg !5
  call void @llvm.sideeffect() #0 [ "xlx_array_reshape"([256 x i64]* %5, i32 0, i32 1, i32 0) ], !dbg !265
  call void @apatb_top_hw([256 x float]* %3, [256 x [128 x i64]]* %A_copy3, [128 x [256 x i64]]* %B_copy4)
  call void @copy_out([256 x [256 x float]]* %0, [256 x [256 x float]]* %C_copy, [256 x [256 x float]]* %1, [256 x [128 x i64]]* %A_copy3, [256 x [256 x float]]* %2, [128 x [256 x i64]]* %B_copy4)
  tail call void @free(i8* %malloccall)
  call void @free(i8* %malloccall1)
  call void @free(i8* %malloccall2)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0a256a256f32([256 x [256 x float]]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [256 x [256 x float]]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") unnamed_addr #2 {
entry:
  %2 = icmp eq [256 x [256 x float]]* %0, null
  %3 = icmp eq [256 x [256 x float]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx10 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx39 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %dst.addr57 = getelementptr [256 x [256 x float]], [256 x [256 x float]]* %0, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %src.addr68 = getelementptr [256 x [256 x float]], [256 x [256 x float]]* %1, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %5 = load float, float* %src.addr68, align 4
  store float %5, float* %dst.addr57, align 4
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx39, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 256
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx10, 1
  %exitcond11 = icmp ne i64 %for.loop.idx.next, 256
  br i1 %exitcond11, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a256a256f32.7.8([256 x [128 x i64]]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [256 x [256 x float]]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %2 = icmp eq [256 x [128 x i64]]* %0, null
  %3 = icmp eq [256 x [256 x float]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx10 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx39 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %5 = urem i64 %for.loop.idx39, 2
  %6 = mul i64 32, %5
  %7 = udiv i64 %for.loop.idx39, 2
  %dst.addr571 = getelementptr [256 x [128 x i64]], [256 x [128 x i64]]* %0, i64 0, i64 %for.loop.idx10, i64 %7
  %src.addr68 = getelementptr [256 x [256 x float]], [256 x [256 x float]]* %1, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %8 = load float, float* %src.addr68, align 4
  %9 = bitcast float %8 to i32
  %10 = load i64, i64* %dst.addr571, align 8
  %11 = zext i32 %9 to i64
  %12 = shl i64 %11, %6
  %13 = add i64 %6, 32
  %14 = shl i64 1, %13
  %15 = icmp uge i64 %13, 64
  %16 = select i1 %15, i64 0, i64 %14
  %17 = shl i64 1, %6
  %18 = sub i64 %16, %17
  %19 = xor i64 %18, -1
  %20 = and i64 %10, %19
  %21 = or i64 %20, %12
  store i64 %21, i64* %dst.addr571, align 8
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx39, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 256
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx10, 1
  %exitcond11 = icmp ne i64 %for.loop.idx.next, 256
  br i1 %exitcond11, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a256a256f32.9.10([128 x [256 x i64]]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [256 x [256 x float]]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %2 = icmp eq [128 x [256 x i64]]* %0, null
  %3 = icmp eq [256 x [256 x float]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx10 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  %5 = urem i64 %for.loop.idx10, 2
  %6 = mul i64 32, %5
  %7 = udiv i64 %for.loop.idx10, 2
  %8 = add i64 %6, 32
  %9 = shl i64 1, %8
  %10 = icmp uge i64 %8, 64
  %11 = select i1 %10, i64 0, i64 %9
  %12 = shl i64 1, %6
  %13 = sub i64 %11, %12
  %14 = xor i64 %13, -1
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx39 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %dst.addr571 = getelementptr [128 x [256 x i64]], [128 x [256 x i64]]* %0, i64 0, i64 %7, i64 %for.loop.idx39
  %src.addr68 = getelementptr [256 x [256 x float]], [256 x [256 x float]]* %1, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %15 = load float, float* %src.addr68, align 4
  %16 = bitcast float %15 to i32
  %17 = load i64, i64* %dst.addr571, align 8
  %18 = zext i32 %16 to i64
  %19 = shl i64 %18, %6
  %20 = and i64 %17, %14
  %21 = or i64 %20, %19
  store i64 %21, i64* %dst.addr571, align 8
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx39, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 256
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx10, 1
  %exitcond11 = icmp ne i64 %for.loop.idx.next, 256
  br i1 %exitcond11, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_in([256 x [256 x float]]* readonly "orig.arg.no"="0", [256 x [256 x float]]* noalias "orig.arg.no"="1", [256 x [256 x float]]* readonly "orig.arg.no"="2", [256 x [128 x i64]]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3", [256 x [256 x float]]* readonly "orig.arg.no"="4", [128 x [256 x i64]]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5") #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0a256a256f32([256 x [256 x float]]* %1, [256 x [256 x float]]* %0)
  call void @onebyonecpy_hls.p0a256a256f32.7.8([256 x [128 x i64]]* %3, [256 x [256 x float]]* %2)
  call void @onebyonecpy_hls.p0a256a256f32.9.10([128 x [256 x i64]]* %5, [256 x [256 x float]]* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a256a256f32.23.24([256 x [256 x float]]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [256 x [128 x i64]]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %2 = icmp eq [256 x [256 x float]]* %0, null
  %3 = icmp eq [256 x [128 x i64]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx10 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx39 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %dst.addr57 = getelementptr [256 x [256 x float]], [256 x [256 x float]]* %0, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %5 = urem i64 %for.loop.idx39, 2
  %6 = mul i64 32, %5
  %7 = udiv i64 %for.loop.idx39, 2
  %src.addr681 = getelementptr [256 x [128 x i64]], [256 x [128 x i64]]* %1, i64 0, i64 %for.loop.idx10, i64 %7
  %8 = load i64, i64* %src.addr681, align 8
  %9 = add i64 %6, 32
  %10 = shl i64 1, %9
  %11 = icmp uge i64 %9, 64
  %12 = select i1 %11, i64 0, i64 %10
  %13 = shl i64 1, %6
  %14 = sub i64 %12, %13
  %15 = and i64 %8, %14
  %16 = lshr i64 %15, %6
  %17 = trunc i64 %16 to i32
  %18 = bitcast i32 %17 to float
  store float %18, float* %dst.addr57, align 4
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx39, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 256
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx10, 1
  %exitcond11 = icmp ne i64 %for.loop.idx.next, 256
  br i1 %exitcond11, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a256a256f32.25.26([256 x [256 x float]]* noalias "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="0", [128 x [256 x i64]]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="1") #2 {
entry:
  %2 = icmp eq [256 x [256 x float]]* %0, null
  %3 = icmp eq [128 x [256 x i64]]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.split, %copy
  %for.loop.idx10 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.split ]
  %5 = urem i64 %for.loop.idx10, 2
  %6 = mul i64 32, %5
  %7 = udiv i64 %for.loop.idx10, 2
  %8 = add i64 %6, 32
  %9 = shl i64 1, %8
  %10 = icmp uge i64 %8, 64
  %11 = select i1 %10, i64 0, i64 %9
  %12 = shl i64 1, %6
  %13 = sub i64 %11, %12
  br label %for.loop2

for.loop2:                                        ; preds = %for.loop2, %for.loop
  %for.loop.idx39 = phi i64 [ 0, %for.loop ], [ %for.loop.idx3.next, %for.loop2 ]
  %dst.addr57 = getelementptr [256 x [256 x float]], [256 x [256 x float]]* %0, i64 0, i64 %for.loop.idx10, i64 %for.loop.idx39
  %src.addr681 = getelementptr [128 x [256 x i64]], [128 x [256 x i64]]* %1, i64 0, i64 %7, i64 %for.loop.idx39
  %14 = load i64, i64* %src.addr681, align 8
  %15 = and i64 %14, %13
  %16 = lshr i64 %15, %6
  %17 = trunc i64 %16 to i32
  %18 = bitcast i32 %17 to float
  store float %18, float* %dst.addr57, align 4
  %for.loop.idx3.next = add nuw nsw i64 %for.loop.idx39, 1
  %exitcond = icmp ne i64 %for.loop.idx3.next, 256
  br i1 %exitcond, label %for.loop2, label %for.loop.split

for.loop.split:                                   ; preds = %for.loop2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx10, 1
  %exitcond11 = icmp ne i64 %for.loop.idx.next, 256
  br i1 %exitcond11, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_out([256 x [256 x float]]* "orig.arg.no"="0", [256 x [256 x float]]* noalias readonly "orig.arg.no"="1", [256 x [256 x float]]* "orig.arg.no"="2", [256 x [128 x i64]]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="3", [256 x [256 x float]]* "orig.arg.no"="4", [128 x [256 x i64]]* noalias readonly "fpga.caller.interfaces"="layout_transformed" "orig.arg.no"="5") #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a256a256f32([256 x [256 x float]]* %0, [256 x [256 x float]]* %1)
  call void @onebyonecpy_hls.p0a256a256f32.23.24([256 x [256 x float]]* %2, [256 x [128 x i64]]* %3)
  call void @onebyonecpy_hls.p0a256a256f32.25.26([256 x [256 x float]]* %4, [128 x [256 x i64]]* %5)
  ret void
}

declare void @apatb_top_hw([256 x float]*, [256 x [128 x i64]]*, [128 x [256 x i64]]*)

define void @top_hw_stub_wrapper([256 x float]*, [256 x [128 x i64]]*, [128 x [256 x i64]]*) #5 {
entry:
  %malloccall = tail call i8* @malloc(i64 262144)
  %3 = bitcast i8* %malloccall to [256 x [256 x float]]*
  %malloccall1 = tail call i8* @malloc(i64 262144)
  %4 = bitcast i8* %malloccall1 to [256 x [256 x float]]*
  %5 = bitcast [256 x float]* %0 to [256 x [256 x float]]*
  call void @copy_out([256 x [256 x float]]* null, [256 x [256 x float]]* %5, [256 x [256 x float]]* %3, [256 x [128 x i64]]* %1, [256 x [256 x float]]* %4, [128 x [256 x i64]]* %2)
  %6 = bitcast [256 x [256 x float]]* %5 to [256 x float]*
  %7 = bitcast [256 x [256 x float]]* %3 to [256 x float]*
  %8 = bitcast [256 x [256 x float]]* %4 to [256 x float]*
  call void @top_hw_stub([256 x float]* %6, [256 x float]* %7, [256 x float]* %8)
  call void @copy_in([256 x [256 x float]]* null, [256 x [256 x float]]* %5, [256 x [256 x float]]* %3, [256 x [128 x i64]]* %1, [256 x [256 x float]]* %4, [128 x [256 x i64]]* %2)
  ret void
}

declare void @top_hw_stub([256 x float]*, [256 x float]*, [256 x float]*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = !DILocation(line: 105, column: 9, scope: !6)
!6 = distinct !DISubprogram(name: "top", scope: !7, file: !7, line: 104, type: !8, isLocal: false, isDefinition: true, scopeLine: 104, flags: DIFlagPrototyped, isOptimized: false, unit: !15, variables: !4)
!7 = !DIFile(filename: "mmm.cpp", directory: "/scratch/users/sx233/dataflow/vitis_hls_expr/mmm")
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10, !10}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 8192, elements: !13)
!12 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!13 = !{!14}
!14 = !DISubrange(count: 256)
!15 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !16, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !17, imports: !22)
!16 = !DIFile(filename: "/scratch/users/sx233/dataflow/vitis_hls_expr/mmm/mmm_example/solution1/.autopilot/db/mmm.pp.0.cpp", directory: "/scratch/users/sx233/dataflow/vitis_hls_expr/mmm")
!17 = !{!18}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression(DW_OP_constu, 2, DW_OP_stack_value))
!19 = distinct !DIGlobalVariable(name: "UNROLL", scope: !15, file: !7, line: 23, type: !20, isLocal: true, isDefinition: true)
!20 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !{!23, !29, !36, !40, !44, !49, !51, !59, !63, !67, !81, !85, !89, !93, !97, !102, !106, !110, !114, !118, !126, !130, !134, !136, !140, !144, !149, !155, !159, !163, !165, !173, !177, !185, !187, !191, !195, !199, !203, !208, !212, !217, !218, !219, !220, !222, !223, !224, !225, !226, !227, !228, !230, !231, !232, !233, !234, !235, !236, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264}
!23 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !25, file: !28, line: 124)
!24 = !DINamespace(name: "std", scope: null)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !26, line: 101, baseType: !27)
!26 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/scratch/users/sx233/dataflow/vitis_hls_expr/mmm")
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !26, line: 97, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!28 = !DIFile(filename: "/opt/xilinx/vitis-2021.2/Vitis_HLS/2021.2/tps/lnx64/gcc-6.2.0/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../include/c++/6.2.0/cstdlib", directory: "/scratch/users/sx233/dataflow/vitis_hls_expr/mmm")
!29 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !30, file: !28, line: 125)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !26, line: 109, baseType: !31)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !26, line: 105, size: 128, flags: DIFlagTypePassByValue, elements: !32, identifier: "_ZTS6ldiv_t")
!32 = !{!33, !35}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !31, file: !26, line: 107, baseType: !34, size: 64)
!34 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !31, file: !26, line: 108, baseType: !34, size: 64, offset: 64)
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !37, file: !28, line: 127)
!37 = !DISubprogram(name: "abort", scope: !26, file: !26, line: 514, type: !38, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!38 = !DISubroutineType(types: !39)
!39 = !{null}
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !41, file: !28, line: 128)
!41 = !DISubprogram(name: "abs", scope: !26, file: !26, line: 770, type: !42, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!42 = !DISubroutineType(types: !43)
!43 = !{!21, !21}
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !45, file: !28, line: 129)
!45 = !DISubprogram(name: "atexit", scope: !26, file: !26, line: 518, type: !46, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!46 = !DISubroutineType(types: !47)
!47 = !{!21, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !50, file: !28, line: 132)
!50 = !DISubprogram(name: "at_quick_exit", scope: !26, file: !26, line: 523, type: !46, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !52, file: !28, line: 135)
!52 = !DISubprogram(name: "atof", scope: !26, file: !26, line: 144, type: !53, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !56}
!55 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !60, file: !28, line: 136)
!60 = !DISubprogram(name: "atoi", scope: !26, file: !26, line: 147, type: !61, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!61 = !DISubroutineType(types: !62)
!62 = !{!21, !56}
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !64, file: !28, line: 137)
!64 = !DISubprogram(name: "atol", scope: !26, file: !26, line: 150, type: !65, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DISubroutineType(types: !66)
!66 = !{!34, !56}
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !68, file: !28, line: 138)
!68 = !DISubprogram(name: "bsearch", scope: !26, file: !26, line: 754, type: !69, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !72, !72, !74, !74, !77}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !75, line: 62, baseType: !76)
!75 = !DIFile(filename: "/opt/xilinx/vitis-2021.2/Vitis_HLS/2021.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h", directory: "/scratch/users/sx233/dataflow/vitis_hls_expr/mmm")
!76 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !26, line: 741, baseType: !78)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DISubroutineType(types: !80)
!80 = !{!21, !72, !72}
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !82, file: !28, line: 139)
!82 = !DISubprogram(name: "calloc", scope: !26, file: !26, line: 467, type: !83, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!83 = !DISubroutineType(types: !84)
!84 = !{!71, !74, !74}
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !86, file: !28, line: 140)
!86 = !DISubprogram(name: "div", scope: !26, file: !26, line: 784, type: !87, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!87 = !DISubroutineType(types: !88)
!88 = !{!25, !21, !21}
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !90, file: !28, line: 141)
!90 = !DISubprogram(name: "exit", scope: !26, file: !26, line: 542, type: !91, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!91 = !DISubroutineType(types: !92)
!92 = !{null, !21}
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !94, file: !28, line: 142)
!94 = !DISubprogram(name: "free", scope: !26, file: !26, line: 482, type: !95, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!95 = !DISubroutineType(types: !96)
!96 = !{null, !71}
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !98, file: !28, line: 143)
!98 = !DISubprogram(name: "getenv", scope: !26, file: !26, line: 563, type: !99, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!99 = !DISubroutineType(types: !100)
!100 = !{!101, !56}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !103, file: !28, line: 144)
!103 = !DISubprogram(name: "labs", scope: !26, file: !26, line: 771, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!104 = !DISubroutineType(types: !105)
!105 = !{!34, !34}
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !107, file: !28, line: 145)
!107 = !DISubprogram(name: "ldiv", scope: !26, file: !26, line: 786, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DISubroutineType(types: !109)
!109 = !{!30, !34, !34}
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !111, file: !28, line: 146)
!111 = !DISubprogram(name: "malloc", scope: !26, file: !26, line: 465, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DISubroutineType(types: !113)
!113 = !{!71, !74}
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !115, file: !28, line: 148)
!115 = !DISubprogram(name: "mblen", scope: !26, file: !26, line: 859, type: !116, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DISubroutineType(types: !117)
!117 = !{!21, !56, !74}
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !119, file: !28, line: 149)
!119 = !DISubprogram(name: "mbstowcs", scope: !26, file: !26, line: 870, type: !120, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DISubroutineType(types: !121)
!121 = !{!74, !122, !125, !74}
!122 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !123)
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!125 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !56)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !127, file: !28, line: 150)
!127 = !DISubprogram(name: "mbtowc", scope: !26, file: !26, line: 862, type: !128, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DISubroutineType(types: !129)
!129 = !{!21, !122, !125, !74}
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !131, file: !28, line: 152)
!131 = !DISubprogram(name: "qsort", scope: !26, file: !26, line: 760, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!132 = !DISubroutineType(types: !133)
!133 = !{null, !71, !74, !74, !77}
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !135, file: !28, line: 155)
!135 = !DISubprogram(name: "quick_exit", scope: !26, file: !26, line: 548, type: !91, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !137, file: !28, line: 158)
!137 = !DISubprogram(name: "rand", scope: !26, file: !26, line: 374, type: !138, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!138 = !DISubroutineType(types: !139)
!139 = !{!21}
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !141, file: !28, line: 159)
!141 = !DISubprogram(name: "realloc", scope: !26, file: !26, line: 479, type: !142, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DISubroutineType(types: !143)
!143 = !{!71, !71, !74}
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !145, file: !28, line: 160)
!145 = !DISubprogram(name: "srand", scope: !26, file: !26, line: 376, type: !146, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!146 = !DISubroutineType(types: !147)
!147 = !{null, !148}
!148 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !150, file: !28, line: 161)
!150 = !DISubprogram(name: "strtod", scope: !26, file: !26, line: 164, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DISubroutineType(types: !152)
!152 = !{!55, !125, !153}
!153 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !154)
!154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !156, file: !28, line: 162)
!156 = !DISubprogram(name: "strtol", scope: !26, file: !26, line: 183, type: !157, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DISubroutineType(types: !158)
!158 = !{!34, !125, !153, !21}
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !160, file: !28, line: 163)
!160 = !DISubprogram(name: "strtoul", scope: !26, file: !26, line: 187, type: !161, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DISubroutineType(types: !162)
!162 = !{!76, !125, !153, !21}
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !164, file: !28, line: 164)
!164 = !DISubprogram(name: "system", scope: !26, file: !26, line: 716, type: !61, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !166, file: !28, line: 166)
!166 = !DISubprogram(name: "wcstombs", scope: !26, file: !26, line: 873, type: !167, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DISubroutineType(types: !168)
!168 = !{!74, !169, !170, !74}
!169 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !101)
!170 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !171)
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64)
!172 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !124)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !174, file: !28, line: 167)
!174 = !DISubprogram(name: "wctomb", scope: !26, file: !26, line: 866, type: !175, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DISubroutineType(types: !176)
!176 = !{!21, !101, !124}
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !179, file: !28, line: 220)
!178 = !DINamespace(name: "__gnu_cxx", scope: null)
!179 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !26, line: 121, baseType: !180)
!180 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !26, line: 117, size: 128, flags: DIFlagTypePassByValue, elements: !181, identifier: "_ZTS7lldiv_t")
!181 = !{!182, !184}
!182 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !180, file: !26, line: 119, baseType: !183, size: 64)
!183 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !180, file: !26, line: 120, baseType: !183, size: 64, offset: 64)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !186, file: !28, line: 226)
!186 = !DISubprogram(name: "_Exit", scope: !26, file: !26, line: 556, type: !91, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !188, file: !28, line: 230)
!188 = !DISubprogram(name: "llabs", scope: !26, file: !26, line: 775, type: !189, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!183, !183}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !192, file: !28, line: 236)
!192 = !DISubprogram(name: "lldiv", scope: !26, file: !26, line: 792, type: !193, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DISubroutineType(types: !194)
!194 = !{!179, !183, !183}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !196, file: !28, line: 247)
!196 = !DISubprogram(name: "atoll", scope: !26, file: !26, line: 157, type: !197, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DISubroutineType(types: !198)
!198 = !{!183, !56}
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !200, file: !28, line: 248)
!200 = !DISubprogram(name: "strtoll", scope: !26, file: !26, line: 209, type: !201, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DISubroutineType(types: !202)
!202 = !{!183, !125, !153, !21}
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !204, file: !28, line: 249)
!204 = !DISubprogram(name: "strtoull", scope: !26, file: !26, line: 214, type: !205, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DISubroutineType(types: !206)
!206 = !{!207, !125, !153, !21}
!207 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !209, file: !28, line: 251)
!209 = !DISubprogram(name: "strtof", scope: !26, file: !26, line: 172, type: !210, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DISubroutineType(types: !211)
!211 = !{!12, !125, !153}
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !178, entity: !213, file: !28, line: 252)
!213 = !DISubprogram(name: "strtold", scope: !26, file: !26, line: 175, type: !214, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DISubroutineType(types: !215)
!215 = !{!216, !125, !153}
!216 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !179, file: !28, line: 260)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !186, file: !28, line: 262)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !188, file: !28, line: 264)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !221, file: !28, line: 265)
!221 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !178, file: !28, line: 233, type: !193, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !192, file: !28, line: 266)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !196, file: !28, line: 268)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !209, file: !28, line: 269)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !200, file: !28, line: 270)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !204, file: !28, line: 271)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !213, file: !28, line: 272)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !37, file: !229, line: 38)
!229 = !DIFile(filename: "/opt/xilinx/vitis-2021.2/Vitis_HLS/2021.2/tps/lnx64/gcc-6.2.0/lib/gcc/x86_64-pc-linux-gnu/6.2.0/../../../../include/c++/6.2.0/stdlib.h", directory: "/scratch/users/sx233/dataflow/vitis_hls_expr/mmm")
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !45, file: !229, line: 39)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !90, file: !229, line: 40)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !50, file: !229, line: 43)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !135, file: !229, line: 46)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !25, file: !229, line: 51)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !30, file: !229, line: 52)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !237, file: !229, line: 54)
!237 = !DISubprogram(name: "abs", linkageName: "_ZSt3absn", scope: !24, file: !28, line: 185, type: !238, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DISubroutineType(types: !239)
!239 = !{!240, !240}
!240 = !DIBasicType(name: "__int128", size: 128, encoding: DW_ATE_signed)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !52, file: !229, line: 55)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !60, file: !229, line: 56)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !64, file: !229, line: 57)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !68, file: !229, line: 58)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !82, file: !229, line: 59)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !221, file: !229, line: 60)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !94, file: !229, line: 61)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !98, file: !229, line: 62)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !103, file: !229, line: 63)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !107, file: !229, line: 64)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !111, file: !229, line: 65)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !115, file: !229, line: 67)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !119, file: !229, line: 68)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !127, file: !229, line: 69)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !131, file: !229, line: 71)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !137, file: !229, line: 72)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !141, file: !229, line: 73)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !145, file: !229, line: 74)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !150, file: !229, line: 75)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !156, file: !229, line: 76)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !160, file: !229, line: 77)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !164, file: !229, line: 78)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !166, file: !229, line: 80)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !174, file: !229, line: 81)
!265 = !DILocation(line: 104, column: 168, scope: !6)
