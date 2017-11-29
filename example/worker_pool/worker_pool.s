; ModuleID = 'main'
;source_filename = "main"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%funcVal = type { void ()* }
%chanType = type { %commonType, %commonType*, i64 }
%commonType = type { i8, i8, i8, i64, i32, %funcVal*, %funcVal*, i8*, { i8*, i64 }*, %uncommonType*, %commonType* }
%uncommonType = type { { i8*, i64 }*, { i8*, i64 }*, %methodSlice }
%methodSlice = type { %method*, i64, i64 }
%method = type { { i8*, i64 }*, { i8*, i64 }*, %commonType*, %commonType*, i8* }
%structType = type { %commonType, %structFieldSlice }
%structFieldSlice = type { %structField*, i64, i64 }
%structField = type { { i8*, i64 }*, { i8*, i64 }*, %commonType*, { i8*, i64 }*, i64 }
%arrayType = type { %commonType, %commonType*, %commonType*, i64 }
%interfaceType = type { %commonType, %imethodSlice }
%imethodSlice = type { %imethod*, i64, i64 }
%imethod = type { { i8*, i64 }*, { i8*, i64 }*, %commonType* }
%sliceType = type { %commonType, %commonType* }
%ptrType = type { %commonType, %commonType* }

@__go_type_hash_empty_interface_descriptor = external global %funcVal
@__go_type_equal_empty_interface_descriptor = external global %funcVal
@__go_type_hash_string_descriptor = external global %funcVal
@__go_type_equal_string_descriptor = external global %funcVal
@__go_type_hash_identity_descriptor = external global %funcVal
@__go_type_equal_identity_descriptor = external global %funcVal
@__go_type_hash_error_descriptor = external global %funcVal
@__go_type_equal_error_descriptor = external global %funcVal
@"main..import$descriptor" = constant i8* bitcast (void (i8*)* @main..import to i8*)
@"init$guard" = internal global i1 false
@"main.main$descriptor" = constant i8* bitcast (void (i8*)* @main.main to i8*)
@__go_td_CN3_intsre = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 1610653383, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN3_intsre$gc" to i8*), { i8*, i64 }* @9, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int, i64 3 }
@__go_td_S0_N3_int0_CN3_intre0_CN3_intsee = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 24, i32 -1341669328, %funcVal* @__go_type_hash_S0_N3_int0_CN3_intre0_CN3_intsee_descriptor, %funcVal* @__go_type_equal_S0_N3_int0_CN3_intre0_CN3_intsee_descriptor, i8* bitcast ([8 x i8*]* @"__go_td_S0_N3_int0_CN3_intre0_CN3_intsee$gc" to i8*), { i8*, i64 }* @23, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS0_N3_int0_CN3_intre0_CN3_intsee, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([3 x %structField], [3 x %structField]* @24, i32 0, i32 0), i64 3, i64 3 } }
@__go_td_CN3_intre = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 1610653375, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN3_intre$gc" to i8*), { i8*, i64 }* @5, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int, i64 1 }
@__go_td_AIe4e = linkonce_odr constant %arrayType { %commonType { i8 17, i8 8, i8 8, i64 64, i32 30, %funcVal* @__go_type_hash_AIe4e_descriptor, %funcVal* @__go_type_hash_AIe4e_descriptor.2, i8* bitcast ([9 x i8*]* @"__go_td_AIe4e$gc" to i8*), { i8*, i64 }* @7, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0), %commonType* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AIee, i32 0, i32 0), i64 4 }
@0 = internal global [6 x i8] c"worker"
@__go_tdn_string = linkonce_odr constant %commonType { i8 24, i8 8, i8 8, i64 16, i32 100666096, %funcVal* @__go_type_hash_string_descriptor, %funcVal* @__go_type_equal_string_descriptor, i8* bitcast ([4 x i8*]* @"__go_tdn_string$gc" to i8*), { i8*, i64 }* @18, %uncommonType* @21, %commonType* null }
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @13, %uncommonType* @16, %commonType* null }
@1 = internal global [12 x i8] c"started  job"
@2 = internal global [6 x i8] c"worker"
@3 = internal global [12 x i8] c"finished job"
@__go_td_CN3_intse = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 1610653367, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN3_intse$gc" to i8*), { i8*, i64 }* @11, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int, i64 2 }
@4 = internal constant [10 x i8] c"<-chan int"
@5 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @4, i32 0, i32 0), i64 10 }
@"__go_td_CN3_intre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intre, i32 0, i32 0, i32 0), i8* null]
@__go_type_hash_AIe4e_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_AIe4e to void ()*) }
@__go_type_hash_AIe4e_descriptor.2 = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_hash_AIe4e.1 to void ()*) }
@6 = internal constant [15 x i8] c"[4]interface {}"
@7 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @6, i32 0, i32 0), i64 15 }
@__go_td_Ie = linkonce_odr constant %interfaceType { %commonType { i8 20, i8 8, i8 8, i64 16, i32 16, %funcVal* @__go_type_hash_empty_interface_descriptor, %funcVal* @__go_type_equal_empty_interface_descriptor, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), { i8*, i64 }* @30, %uncommonType* null, %commonType* null }, %imethodSlice zeroinitializer }
@__go_td_AIee = linkonce_odr constant %sliceType { %commonType { i8 23, i8 8, i8 8, i64 24, i32 30, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_AIee$gc" to i8*), { i8*, i64 }* @28, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0) }
@"__go_td_AIe4e$gc" = linkonce_odr constant [9 x i8*] [i8* inttoptr (i64 64 to i8*), i8* inttoptr (i64 3 to i8*), i8* null, i8* inttoptr (i64 4 to i8*), i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* inttoptr (i64 4 to i8*), i8* null]
@8 = internal constant [8 x i8] c"chan int"
@9 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @8, i32 0, i32 0), i64 8 }
@"__go_td_CN3_intsre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* null]
@10 = internal constant [10 x i8] c"chan<- int"
@11 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @10, i32 0, i32 0), i64 10 }
@"__go_td_CN3_intse$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intse, i32 0, i32 0, i32 0), i8* null]
@12 = internal constant [3 x i8] c"int"
@13 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @12, i32 0, i32 0), i64 3 }
@14 = internal constant [3 x i8] c"int"
@15 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @14, i32 0, i32 0), i64 3 }
@16 = internal constant %uncommonType { { i8*, i64 }* @15, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]
@17 = internal constant [6 x i8] c"string"
@18 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @17, i32 0, i32 0), i64 6 }
@19 = internal constant [6 x i8] c"string"
@20 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @19, i32 0, i32 0), i64 6 }
@21 = internal constant %uncommonType { { i8*, i64 }* @20, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_string$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 7 to i8*), i8* null, i8* null]
@__go_type_hash_S0_N3_int0_CN3_intre0_CN3_intsee_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_S0_N3_int0_CN3_intre0_CN3_intsee to void ()*) }
@__go_type_equal_S0_N3_int0_CN3_intre0_CN3_intsee_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_equal_S0_N3_int0_CN3_intre0_CN3_intsee to void ()*) }
@22 = internal constant [38 x i8] c"struct { int; <-chan int; chan<- int }"
@23 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([38 x i8], [38 x i8]* @22, i32 0, i32 0), i64 38 }
@__go_td_pS0_N3_int0_CN3_intre0_CN3_intsee = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 8127241, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS0_N3_int0_CN3_intre0_CN3_intsee$gc" to i8*), { i8*, i64 }* @26, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S0_N3_int0_CN3_intre0_CN3_intsee, i32 0, i32 0) }
@24 = internal constant [3 x %structField] [%structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* @__go_tdn_int, { i8*, i64 }* null, i64 0 }, %structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intre, i32 0, i32 0), { i8*, i64 }* null, i64 8 }, %structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intse, i32 0, i32 0), { i8*, i64 }* null, i64 16 }]
@"__go_td_S0_N3_int0_CN3_intre0_CN3_intsee$gc" = linkonce_odr constant [8 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 6 to i8*), i8* inttoptr (i64 8 to i8*), i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intre, i32 0, i32 0, i32 0), i8* inttoptr (i64 6 to i8*), i8* inttoptr (i64 16 to i8*), i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intse, i32 0, i32 0, i32 0), i8* null]
@25 = internal constant [39 x i8] c"*struct { int; <-chan int; chan<- int }"
@26 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([39 x i8], [39 x i8]* @25, i32 0, i32 0), i64 39 }
@"__go_td_pS0_N3_int0_CN3_intre0_CN3_intsee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([8 x i8*]* @"__go_td_S0_N3_int0_CN3_intre0_CN3_intsee$gc" to i8*), i8* null]
@27 = internal constant [14 x i8] c"[]interface {}"
@28 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @27, i32 0, i32 0), i64 14 }
@"__go_td_AIee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 10 to i8*), i8* null, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), i8* null]
@29 = internal constant [12 x i8] c"interface {}"
@30 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @29, i32 0, i32 0), i64 12 }
@"__go_td_Ie$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* null]

declare i8 @runtime.chanrecv2(i8* nest, i8*, i8*, i8*)

declare void @__go_builtin_close(i8* nest, i8*)

declare void @__go_go(i8* nest, i8*, i8*)

; Function Attrs: nounwind
declare i8* @__go_new(i8* nest, i8*, i64) #0

declare i8* @__go_new_channel(i8* nest, i8*, i64)

declare void @__go_receive(i8* nest, i8*, i8*, i8*)

declare void @__go_send_big(i8* nest, i8*, i8*, i8*)

declare i64 @__go_type_hash_empty_interface(i8*, i64)

declare i8 @__go_type_equal_empty_interface(i8*, i8*, i64)

declare i64 @__go_type_hash_identity(i8*, i64)

declare i8 @__go_type_equal_identity(i8*, i8*, i64)

define void @main..import(i8* nest) #1 {
prologue:
  %1 = load i1, i1* @"init$guard"
  br i1 %1, label %2, label %3

.0.entry:                                         ; preds = %3
  ret void

; <label>:2:                                      ; preds = %prologue
  ret void

; <label>:3:                                      ; preds = %prologue
  store i1 true, i1* @"init$guard"
  call void @fmt..import(i8* undef)
  call void @time..import(i8* undef)
  br label %.0.entry
}

declare void @fmt..import(i8*)

declare void @time..import(i8*)

define void @main.main(i8* nest) #1 {
prologue:
  %1 = alloca i64
  %2 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %3 = call i8* @__go_new_channel(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 100)
  %4 = call i8* @__go_new_channel(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 100)
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %5 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_N3_int0_CN3_intre0_CN3_intsee, i32 0, i32 0, i32 0), i64 24)
  %6 = bitcast i8* %5 to { i64, i8*, i8* }*
  %7 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %6, i32 0, i32 0
  store i64 %w, i64* %7
  %8 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %6, i32 0, i32 1
  store i8* %3, i8** %8
  %9 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %6, i32 0, i32 2
  store i8* %4, i8** %9
  %10 = bitcast { i64, i8*, i8* }* %6 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @31 to i8*), i8* %10)
  %11 = add i64 %w, 1
  br label %.3.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.3.for.loop:                                      ; preds = %.1.for.body, %.0.entry
  %w = phi i64 [ 1, %.0.entry ], [ %11, %.1.for.body ]
  %12 = icmp sle i64 %w, 3
  %13 = zext i1 %12 to i8
  %14 = trunc i8 %13 to i1
  br i1 %14, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  store i64 %j, i64* %1
  %15 = bitcast i64* %1 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %3, i8* %15)
  %16 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  call void @__go_builtin_close(i8* nest undef, i8* %3)
  br label %.9.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.2.for.done
  %j = phi i64 [ 1, %.2.for.done ], [ %16, %.4.for.body ]
  %17 = icmp sle i64 %j, 5
  %18 = zext i1 %17 to i8
  %19 = trunc i8 %18 to i1
  br i1 %19, label %.4.for.body, label %.5.for.done

.7.for.body:                                      ; preds = %.9.for.loop
  %20 = bitcast i64* %2 to i8*
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %4, i8* %20)
  %21 = load i64, i64* %2
  %22 = add i64 %a, 1
  br label %.9.for.loop

.8.for.done:                                      ; preds = %.9.for.loop
  ret void

.9.for.loop:                                      ; preds = %.7.for.body, %.5.for.done
  %a = phi i64 [ 1, %.5.for.done ], [ %22, %.7.for.body ]
  %23 = icmp sle i64 %a, 5
  %24 = zext i1 %23 to i8
  %25 = trunc i8 %24 to i1
  br i1 %25, label %.7.for.body, label %.8.for.done
}

define internal void @31(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { i64, i8*, i8* }*
  %2 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %1, i32 0, i32 0
  %3 = load i64, i64* %2
  %4 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %1, i32 0, i32 1
  %5 = load i8*, i8** %4
  %6 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %1, i32 0, i32 2
  %7 = load i8*, i8** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.worker(i8* nest undef, i64 %3, i8* %5, i8* %7)
  ret void
}

define internal void @main.worker(i8* nest, i64, i8*, i8*) #1 {
prologue:
  %4 = alloca i64
  %5 = alloca { i8*, i64, i64 }
  %6 = alloca { i64, { i8*, i8* } }
  %7 = alloca { i8*, i64, i64 }
  %8 = alloca { i64, { i8*, i8* } }
  %9 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.1.rangechan.loop

.1.rangechan.loop:                                ; preds = %.2.rangechan.body, %.0.entry
  %10 = bitcast i64* %4 to i8*
  %11 = call i8 @runtime.chanrecv2(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intre, i32 0, i32 0, i32 0), i8* %2, i8* %10)
  %12 = load i64, i64* %4
  %13 = trunc i8 %11 to i1
  br i1 %13, label %.2.rangechan.body, label %.3.rangechan.done

.2.rangechan.body:                                ; preds = %.1.rangechan.loop
  %14 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe4e, i32 0, i32 0, i32 0), i64 64)
  %varargs = bitcast i8* %14 to [4 x { i8*, i8* }]*
  %15 = bitcast [4 x { i8*, i8* }]* %varargs to i8*
  %16 = bitcast i8* %15 to { i8*, i8* }*
  %17 = getelementptr { i8*, i8* }, { i8*, i8* }* %16, i64 0
  %18 = bitcast { i8*, i8* }* %17 to i8*
  %19 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %20 = bitcast i8* %19 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @0, i32 0, i32 0), i64 6 }, { i8*, i64 }* %20
  %21 = bitcast { i8*, i64 }* %20 to i8*
  %22 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %21, 1
  %23 = bitcast i8* %18 to { i8*, i8* }*
  store { i8*, i8* } %22, { i8*, i8* }* %23
  %24 = bitcast i8* %15 to { i8*, i8* }*
  %25 = getelementptr { i8*, i8* }, { i8*, i8* }* %24, i64 1
  %26 = bitcast { i8*, i8* }* %25 to i8*
  %27 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %28 = bitcast i8* %27 to i64*
  store i64 %1, i64* %28
  %29 = bitcast i64* %28 to i8*
  %30 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %29, 1
  %31 = bitcast i8* %26 to { i8*, i8* }*
  store { i8*, i8* } %30, { i8*, i8* }* %31
  %32 = bitcast i8* %15 to { i8*, i8* }*
  %33 = getelementptr { i8*, i8* }, { i8*, i8* }* %32, i64 2
  %34 = bitcast { i8*, i8* }* %33 to i8*
  %35 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %36 = bitcast i8* %35 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @1, i32 0, i32 0), i64 12 }, { i8*, i64 }* %36
  %37 = bitcast { i8*, i64 }* %36 to i8*
  %38 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %37, 1
  %39 = bitcast i8* %34 to { i8*, i8* }*
  store { i8*, i8* } %38, { i8*, i8* }* %39
  %40 = bitcast i8* %15 to { i8*, i8* }*
  %41 = getelementptr { i8*, i8* }, { i8*, i8* }* %40, i64 3
  %42 = bitcast { i8*, i8* }* %41 to i8*
  %43 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %44 = bitcast i8* %43 to i64*
  store i64 %12, i64* %44
  %45 = bitcast i64* %44 to i8*
  %46 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %45, 1
  %47 = bitcast i8* %42 to { i8*, i8* }*
  store { i8*, i8* } %46, { i8*, i8* }* %47
  %48 = getelementptr inbounds i8, i8* %15, i64 0
  %49 = insertvalue { i8*, i64, i64 } undef, i8* %48, 0
  %50 = insertvalue { i8*, i64, i64 } %49, i64 4, 1
  %51 = insertvalue { i8*, i64, i64 } %50, i64 4, 2
  store { i8*, i64, i64 } %51, { i8*, i64, i64 }* %5
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %6, i8* nest undef, { i8*, i64, i64 }* byval %5)
  %52 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %6, i32 0, i32 0
  %53 = load i64, i64* %52
  %54 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %6, i32 0, i32 1
  %55 = load { i8*, i8* }, { i8*, i8* }* %54
  call void @time.Sleep(i8* nest undef, i64 1000000000)
  %56 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe4e, i32 0, i32 0, i32 0), i64 64)
  %varargs1 = bitcast i8* %56 to [4 x { i8*, i8* }]*
  %57 = bitcast [4 x { i8*, i8* }]* %varargs1 to i8*
  %58 = bitcast i8* %57 to { i8*, i8* }*
  %59 = getelementptr { i8*, i8* }, { i8*, i8* }* %58, i64 0
  %60 = bitcast { i8*, i8* }* %59 to i8*
  %61 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %62 = bitcast i8* %61 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @2, i32 0, i32 0), i64 6 }, { i8*, i64 }* %62
  %63 = bitcast { i8*, i64 }* %62 to i8*
  %64 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %63, 1
  %65 = bitcast i8* %60 to { i8*, i8* }*
  store { i8*, i8* } %64, { i8*, i8* }* %65
  %66 = bitcast i8* %57 to { i8*, i8* }*
  %67 = getelementptr { i8*, i8* }, { i8*, i8* }* %66, i64 1
  %68 = bitcast { i8*, i8* }* %67 to i8*
  %69 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %70 = bitcast i8* %69 to i64*
  store i64 %1, i64* %70
  %71 = bitcast i64* %70 to i8*
  %72 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %71, 1
  %73 = bitcast i8* %68 to { i8*, i8* }*
  store { i8*, i8* } %72, { i8*, i8* }* %73
  %74 = bitcast i8* %57 to { i8*, i8* }*
  %75 = getelementptr { i8*, i8* }, { i8*, i8* }* %74, i64 2
  %76 = bitcast { i8*, i8* }* %75 to i8*
  %77 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %78 = bitcast i8* %77 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @3, i32 0, i32 0), i64 12 }, { i8*, i64 }* %78
  %79 = bitcast { i8*, i64 }* %78 to i8*
  %80 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %79, 1
  %81 = bitcast i8* %76 to { i8*, i8* }*
  store { i8*, i8* } %80, { i8*, i8* }* %81
  %82 = bitcast i8* %57 to { i8*, i8* }*
  %83 = getelementptr { i8*, i8* }, { i8*, i8* }* %82, i64 3
  %84 = bitcast { i8*, i8* }* %83 to i8*
  %85 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %86 = bitcast i8* %85 to i64*
  store i64 %12, i64* %86
  %87 = bitcast i64* %86 to i8*
  %88 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %87, 1
  %89 = bitcast i8* %84 to { i8*, i8* }*
  store { i8*, i8* } %88, { i8*, i8* }* %89
  %90 = getelementptr inbounds i8, i8* %57, i64 0
  %91 = insertvalue { i8*, i64, i64 } undef, i8* %90, 0
  %92 = insertvalue { i8*, i64, i64 } %91, i64 4, 1
  %93 = insertvalue { i8*, i64, i64 } %92, i64 4, 2
  store { i8*, i64, i64 } %93, { i8*, i64, i64 }* %7
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %8, i8* nest undef, { i8*, i64, i64 }* byval %7)
  %94 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %8, i32 0, i32 0
  %95 = load i64, i64* %94
  %96 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %8, i32 0, i32 1
  %97 = load { i8*, i8* }, { i8*, i8* }* %96
  %98 = mul i64 %12, 2
  store i64 %98, i64* %9
  %99 = bitcast i64* %9 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intse, i32 0, i32 0, i32 0), i8* %3, i8* %99)
  br label %.1.rangechan.loop

.3.rangechan.done:                                ; preds = %.1.rangechan.loop
  ret void
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

declare void @time.Sleep(i8* nest, i64)

define linkonce_odr i64 @__go_type_hash_AIe4e(i8*, i64) {
entry:
  %2 = bitcast i8* %0 to { i8*, i8* }*
  br label %loop

loop:                                             ; preds = %loop, %entry
  %3 = phi i64 [ 0, %entry ], [ %10, %loop ]
  %4 = phi i64 [ 0, %entry ], [ %9, %loop ]
  %5 = getelementptr { i8*, i8* }, { i8*, i8* }* %2, i64 %3
  %6 = bitcast { i8*, i8* }* %5 to i8*
  %7 = call i64 @__go_type_hash_empty_interface(i8* %6, i64 16)
  %8 = mul i64 %4, 33
  %9 = add i64 %8, %7
  %10 = add i64 %3, 1
  %11 = icmp eq i64 %10, 4
  br i1 %11, label %exit, label %loop

exit:                                             ; preds = %loop
  ret i64 %9
}

define linkonce_odr i8 @__go_type_hash_AIe4e.1(i8*, i8*, i64) {
entry:
  %3 = bitcast i8* %0 to { i8*, i8* }*
  %4 = bitcast i8* %1 to { i8*, i8* }*
  br label %loop

loop:                                             ; preds = %cont, %entry
  %5 = phi i64 [ 0, %entry ], [ %12, %cont ]
  %6 = getelementptr { i8*, i8* }, { i8*, i8* }* %3, i64 %5
  %7 = bitcast { i8*, i8* }* %6 to i8*
  %8 = getelementptr { i8*, i8* }, { i8*, i8* }* %4, i64 %5
  %9 = bitcast { i8*, i8* }* %8 to i8*
  %10 = call i8 @__go_type_equal_empty_interface(i8* %7, i8* %9, i64 16)
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %retzero, label %cont

exit:                                             ; preds = %cont
  ret i8 1

retzero:                                          ; preds = %loop
  ret i8 0

cont:                                             ; preds = %loop
  %12 = add i64 %5, 1
  %13 = icmp eq i64 %12, 4
  br i1 %13, label %exit, label %loop
}

define linkonce_odr i64 @__go_type_hash_S0_N3_int0_CN3_intre0_CN3_intsee(i8*, i64) {
entry:
  %2 = bitcast i8* %0 to { i64, i8*, i8* }*
  %3 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %2, i32 0, i32 0
  %4 = bitcast i64* %3 to i8*
  %5 = call i64 @__go_type_hash_identity(i8* %4, i64 8)
  %6 = add i64 0, %5
  %7 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %2, i32 0, i32 1
  %8 = bitcast i8** %7 to i8*
  %9 = call i64 @__go_type_hash_identity(i8* %8, i64 8)
  %10 = mul i64 %6, 33
  %11 = add i64 %10, %9
  %12 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %2, i32 0, i32 2
  %13 = bitcast i8** %12 to i8*
  %14 = call i64 @__go_type_hash_identity(i8* %13, i64 8)
  %15 = mul i64 %11, 33
  %16 = add i64 %15, %14
  ret i64 %16
}

define linkonce_odr i8 @__go_type_equal_S0_N3_int0_CN3_intre0_CN3_intsee(i8*, i8*, i64) {
entry:
  %3 = bitcast i8* %0 to { i64, i8*, i8* }*
  %4 = bitcast i8* %1 to { i64, i8*, i8* }*
  %5 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %3, i32 0, i32 0
  %6 = bitcast i64* %5 to i8*
  %7 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %4, i32 0, i32 0
  %8 = bitcast i64* %7 to i8*
  %9 = call i8 @__go_type_equal_identity(i8* %6, i8* %8, i64 8)
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %retzero, label %cont

retzero:                                          ; preds = %cont1, %cont, %entry
  ret i8 0

cont:                                             ; preds = %entry
  %11 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %3, i32 0, i32 1
  %12 = bitcast i8** %11 to i8*
  %13 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %4, i32 0, i32 1
  %14 = bitcast i8** %13 to i8*
  %15 = call i8 @__go_type_equal_identity(i8* %12, i8* %14, i64 8)
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %retzero, label %cont1

cont1:                                            ; preds = %cont
  %17 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %3, i32 0, i32 2
  %18 = bitcast i8** %17 to i8*
  %19 = getelementptr inbounds { i64, i8*, i8* }, { i64, i8*, i8* }* %4, i32 0, i32 2
  %20 = bitcast i8** %19 to i8*
  %21 = call i8 @__go_type_equal_identity(i8* %18, i8* %20, i64 8)
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %retzero, label %cont2

cont2:                                            ; preds = %cont1
  ret i8 1
}

define void @__go_init_main(i8*) #1 {
entry:
  call void @main..import(i8* undef)
  ret void
}

attributes #0 = { nounwind }
attributes #1 = { "disable-tail-calls"="true" "split-stack" }
