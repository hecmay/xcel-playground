; ModuleID = 'test.cl'
source_filename = "test.cl"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: convergent nounwind uwtable
define dso_local spir_kernel void @test(float addrspace(1)* nocapture readonly %in, float addrspace(1)* nocapture %out) local_unnamed_addr #0 !kernel_arg_addr_space !3 !kernel_arg_access_qual !4 !kernel_arg_type !5 !kernel_arg_base_type !5 !kernel_arg_type_qual !6 {
entry:
  %call = tail call i32 @get_global_id(i32 0) #3
  %idxprom = sext i32 %call to i64
  %arrayidx = getelementptr inbounds float, float addrspace(1)* %in, i64 %idxprom
  %0 = load float, float addrspace(1)* %arrayidx, align 4, !tbaa !7
  %1 = tail call float @llvm.fmuladd.f32(float %0, float 0x400921FA00000000, float %0)
  %arrayidx4 = getelementptr inbounds float, float addrspace(1)* %out, i64 %idxprom
  store float %1, float addrspace(1)* %arrayidx4, align 4, !tbaa !7
  ret void
}

; Function Attrs: convergent
declare dso_local i32 @get_global_id(i32) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable
declare float @llvm.fmuladd.f32(float, float, float) #2

attributes #0 = { convergent nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "uniform-work-group-size"="true" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { convergent "correctly-rounded-divide-sqrt-fp-math"="false" "denorms-are-zero"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { convergent nounwind }

!llvm.module.flags = !{!0}
!opencl.ocl.version = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, i32 0}
!2 = !{!"clang version 9.0.0 (/work/shared/common/llvm-project-9.0.0/clang 0399d5a9682b3cef71c653373e38890c63c4c365)"}
!3 = !{i32 0, i32 0}
!4 = !{!"none", !"none"}
!5 = !{!"float*", !"float*"}
!6 = !{!"", !""}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
