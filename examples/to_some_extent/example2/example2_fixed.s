; ModuleID = 'main'
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
@__go_type_hash_identity_descriptor = external global %funcVal
@__go_type_equal_identity_descriptor = external global %funcVal
@__go_type_hash_error_descriptor = external global %funcVal
@__go_type_equal_error_descriptor = external global %funcVal
@"main..import$descriptor" = constant i8* bitcast (void (i8*)* @main..import to i8*)
@"init$guard" = internal global i1 false
@"main.main$descriptor" = constant i8* bitcast (void (i8*)* @main.main to i8*)
@__go_td_CN3_intsre = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 1610653383, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN3_intsre$gc" to i8*), { i8*, i64 }* @3, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int, i64 3 }
@__go_td_S0_CN3_intsre0_CN3_intsree = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 16, i32 -2146995872, %funcVal* @__go_type_hash_S0_CN3_intsre0_CN3_intsree_descriptor, %funcVal* @__go_type_equal_S0_CN3_intsre0_CN3_intsree_descriptor, i8* bitcast ([8 x i8*]* @"__go_td_S0_CN3_intsre0_CN3_intsree$gc" to i8*), { i8*, i64 }* @10, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS0_CN3_intsre0_CN3_intsree, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([2 x %structField], [2 x %structField]* @11, i32 0, i32 0), i64 2, i64 2 } }
@__go_td_AIe1e = linkonce_odr constant %arrayType { %commonType { i8 17, i8 8, i8 8, i64 16, i32 30, %funcVal* @__go_type_hash_AIe1e_descriptor, %funcVal* @__go_type_hash_AIe1e_descriptor.2, i8* bitcast ([9 x i8*]* @"__go_td_AIe1e$gc" to i8*), { i8*, i64 }* @1, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0), %commonType* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AIee, i32 0, i32 0), i64 1 }
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @5, %uncommonType* @8, %commonType* null }
@__go_type_hash_AIe1e_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_AIe1e to void ()*) }
@__go_type_hash_AIe1e_descriptor.2 = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_hash_AIe1e.1 to void ()*) }
@0 = internal constant [15 x i8] c"[1]interface {}"
@1 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @0, i32 0, i32 0), i64 15 }
@__go_td_Ie = linkonce_odr constant %interfaceType { %commonType { i8 20, i8 8, i8 8, i64 16, i32 16, %funcVal* @__go_type_hash_empty_interface_descriptor, %funcVal* @__go_type_equal_empty_interface_descriptor, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), { i8*, i64 }* @17, %uncommonType* null, %commonType* null }, %imethodSlice zeroinitializer }
@__go_td_AIee = linkonce_odr constant %sliceType { %commonType { i8 23, i8 8, i8 8, i64 24, i32 30, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_AIee$gc" to i8*), { i8*, i64 }* @15, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0) }
@"__go_td_AIe1e$gc" = linkonce_odr constant [9 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 3 to i8*), i8* null, i8* inttoptr (i64 1 to i8*), i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* inttoptr (i64 4 to i8*), i8* null]
@2 = internal constant [8 x i8] c"chan int"
@3 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @2, i32 0, i32 0), i64 8 }
@"__go_td_CN3_intsre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* null]
@4 = internal constant [3 x i8] c"int"
@5 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @4, i32 0, i32 0), i64 3 }
@6 = internal constant [3 x i8] c"int"
@7 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @6, i32 0, i32 0), i64 3 }
@8 = internal constant %uncommonType { { i8*, i64 }* @7, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]
@__go_type_hash_S0_CN3_intsre0_CN3_intsree_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_S0_CN3_intsre0_CN3_intsree to void ()*) }
@__go_type_equal_S0_CN3_intsre0_CN3_intsree_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_equal_S0_CN3_intsre0_CN3_intsree to void ()*) }
@9 = internal constant [29 x i8] c"struct { chan int; chan int }"
@10 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([29 x i8], [29 x i8]* @9, i32 0, i32 0), i64 29 }
@__go_td_pS0_CN3_intsre0_CN3_intsree = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 7804425, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS0_CN3_intsre0_CN3_intsree$gc" to i8*), { i8*, i64 }* @13, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsre0_CN3_intsree, i32 0, i32 0) }
@11 = internal constant [2 x %structField] [%structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0), { i8*, i64 }* null, i64 0 }, %structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0), { i8*, i64 }* null, i64 8 }]
@"__go_td_S0_CN3_intsre0_CN3_intsree$gc" = linkonce_odr constant [8 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* inttoptr (i64 6 to i8*), i8* inttoptr (i64 8 to i8*), i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* null]
@12 = internal constant [30 x i8] c"*struct { chan int; chan int }"
@13 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([30 x i8], [30 x i8]* @12, i32 0, i32 0), i64 30 }
@"__go_td_pS0_CN3_intsre0_CN3_intsree$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([8 x i8*]* @"__go_td_S0_CN3_intsre0_CN3_intsree$gc" to i8*), i8* null]
@14 = internal constant [14 x i8] c"[]interface {}"
@15 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @14, i32 0, i32 0), i64 14 }
@"__go_td_AIee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 10 to i8*), i8* null, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), i8* null]
@16 = internal constant [12 x i8] c"interface {}"
@17 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @16, i32 0, i32 0), i64 12 }
@"__go_td_Ie$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* null]

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
  br label %.0.entry
}

declare void @fmt..import(i8*)

define void @main.main(i8* nest) #1 {
prologue:
  %1 = alloca i64
  %2 = alloca i64
  %3 = alloca i64
  %4 = alloca { i8*, i64, i64 }
  %5 = alloca { i64, { i8*, i8* } }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %6 = call i8* @__go_new_channel(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 10)
  %7 = call i8* @__go_new_channel(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 10)
  %8 = call i8* @__go_new_channel(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 10)
  %9 = call i8* @__go_new_channel(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 10)
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %10 = mul i64 %i, %i
  store i64 %10, i64* %1
  %11 = bitcast i64* %1 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %6, i8* %11)
  %12 = add i64 %i, 1
  br label %.3.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.3.for.loop:                                      ; preds = %.1.for.body, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %12, %.1.for.body ]
  %13 = icmp slt i64 %i, 5
  %14 = zext i1 %13 to i8
  %15 = trunc i8 %14 to i1
  br i1 %15, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %16 = mul i64 %i1, %i1
  store i64 %16, i64* %2
  %17 = bitcast i64* %2 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %9, i8* %17)
  %18 = add i64 %i1, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %19 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsre0_CN3_intsree, i32 0, i32 0, i32 0), i64 16)
  %20 = bitcast i8* %19 to { i8*, i8* }*
  %21 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %20, i32 0, i32 0
  store i8* %6, i8** %21
  %22 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %20, i32 0, i32 1
  store i8* %7, i8** %22
  %23 = bitcast { i8*, i8* }* %20 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @18 to i8*), i8* %23)
  %24 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsre0_CN3_intsree, i32 0, i32 0, i32 0), i64 16)
  %25 = bitcast i8* %24 to { i8*, i8* }*
  %26 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %25, i32 0, i32 0
  store i8* %9, i8** %26
  %27 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %25, i32 0, i32 1
  store i8* %7, i8** %27
  %28 = bitcast { i8*, i8* }* %25 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @19 to i8*), i8* %28)
  %29 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsre0_CN3_intsree, i32 0, i32 0, i32 0), i64 16)
  %30 = bitcast i8* %29 to { i8*, i8* }*
  %31 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %30, i32 0, i32 0
  store i8* %7, i8** %31
  %32 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %30, i32 0, i32 1
  store i8* %8, i8** %32
  %33 = bitcast { i8*, i8* }* %30 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @20 to i8*), i8* %33)
  br label %.9.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.2.for.done
  %i1 = phi i64 [ 5, %.2.for.done ], [ %18, %.4.for.body ]
  %34 = icmp slt i64 %i1, 10
  %35 = zext i1 %34 to i8
  %36 = trunc i8 %35 to i1
  br i1 %36, label %.4.for.body, label %.5.for.done

.7.for.body:                                      ; preds = %.9.for.loop
  %37 = bitcast i64* %3 to i8*
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %8, i8* %37)
  %38 = load i64, i64* %3
  %39 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe1e, i32 0, i32 0, i32 0), i64 16)
  %varargs = bitcast i8* %39 to [1 x { i8*, i8* }]*
  %40 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %41 = bitcast i8* %40 to { i8*, i8* }*
  %42 = getelementptr { i8*, i8* }, { i8*, i8* }* %41, i64 0
  %43 = bitcast { i8*, i8* }* %42 to i8*
  %44 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %45 = bitcast i8* %44 to i64*
  store i64 %38, i64* %45
  %46 = bitcast i64* %45 to i8*
  %47 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %46, 1
  %48 = bitcast i8* %43 to { i8*, i8* }*
  store { i8*, i8* } %47, { i8*, i8* }* %48
  %49 = getelementptr inbounds i8, i8* %40, i64 0
  %50 = insertvalue { i8*, i64, i64 } undef, i8* %49, 0
  %51 = insertvalue { i8*, i64, i64 } %50, i64 1, 1
  %52 = insertvalue { i8*, i64, i64 } %51, i64 1, 2
  store { i8*, i64, i64 } %52, { i8*, i64, i64 }* %4
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %5, i8* nest undef, { i8*, i64, i64 }* byval %4)
  %53 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %5, i32 0, i32 0
  %54 = load i64, i64* %53
  %55 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %5, i32 0, i32 1
  %56 = load { i8*, i8* }, { i8*, i8* }* %55
  %57 = add i64 %i2, 1
  br label %.9.for.loop

.8.for.done:                                      ; preds = %.9.for.loop
  ret void

.9.for.loop:                                      ; preds = %.7.for.body, %.5.for.done
  %i2 = phi i64 [ 0, %.5.for.done ], [ %57, %.7.for.body ]
  %58 = icmp slt i64 %i2, 10
  %59 = zext i1 %58 to i8
  %60 = trunc i8 %59 to i1
  br i1 %60, label %.7.for.body, label %.8.for.done
}

define internal void @18(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { i8*, i8* }*
  %2 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  %4 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %1, i32 0, i32 1
  %5 = load i8*, i8** %4
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.process1(i8* nest undef, i8* %3, i8* %5)
  ret void
}

define internal void @main.process1(i8* nest, i8*, i8*) #1 {
prologue:
  %3 = alloca i64
  %4 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %5 = bitcast i64* %3 to i8*
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %1, i8* %5)
  %6 = load i64, i64* %3
  %7 = mul i64 %6, 2
  %8 = add i64 %7, 1
  store i64 %8, i64* %4
  %9 = bitcast i64* %4 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %2, i8* %9)
  %10 = add i64 %i, 1
  br label %.3.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.1.for.body, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %10, %.1.for.body ]
  %11 = icmp slt i64 %i, 5
  %12 = zext i1 %11 to i8
  %13 = trunc i8 %12 to i1
  br i1 %13, label %.1.for.body, label %.2.for.done
}

define internal void @19(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { i8*, i8* }*
  %2 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  %4 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %1, i32 0, i32 1
  %5 = load i8*, i8** %4
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.process2(i8* nest undef, i8* %3, i8* %5)
  ret void
}

define internal void @main.process2(i8* nest, i8*, i8*) #1 {
prologue:
  %3 = alloca i64
  %4 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %5 = bitcast i64* %3 to i8*
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %1, i8* %5)
  %6 = load i64, i64* %3
  %7 = mul i64 %6, 2
  %8 = add i64 %7, 1
  store i64 %8, i64* %4
  %9 = bitcast i64* %4 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %2, i8* %9)
  %10 = add i64 %i, 1
  br label %.3.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.1.for.body, %.0.entry
  %i = phi i64 [ 5, %.0.entry ], [ %10, %.1.for.body ]
  %11 = icmp slt i64 %i, 10
  %12 = zext i1 %11 to i8
  %13 = trunc i8 %12 to i1
  br i1 %13, label %.1.for.body, label %.2.for.done
}

define internal void @20(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { i8*, i8* }*
  %2 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  %4 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %1, i32 0, i32 1
  %5 = load i8*, i8** %4
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.process3(i8* nest undef, i8* %3, i8* %5)
  ret void
}

define internal void @main.process3(i8* nest, i8*, i8*) #1 {
prologue:
  %3 = alloca i64
  %4 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %5 = bitcast i64* %3 to i8*
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %1, i8* %5)
  %6 = load i64, i64* %3
  %7 = sub i64 %6, 1
  %8 = sdiv i64 %7, 2
  store i64 %8, i64* %4
  %9 = bitcast i64* %4 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %2, i8* %9)
  %10 = add i64 %i, 1
  br label %.3.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.1.for.body, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %10, %.1.for.body ]
  %11 = icmp slt i64 %i, 10
  %12 = zext i1 %11 to i8
  %13 = trunc i8 %12 to i1
  br i1 %13, label %.1.for.body, label %.2.for.done
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

define linkonce_odr i64 @__go_type_hash_AIe1e(i8*, i64) {
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
  %11 = icmp eq i64 %10, 1
  br i1 %11, label %exit, label %loop

exit:                                             ; preds = %loop
  ret i64 %9
}

define linkonce_odr i8 @__go_type_hash_AIe1e.1(i8*, i8*, i64) {
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
  %13 = icmp eq i64 %12, 1
  br i1 %13, label %exit, label %loop
}

define linkonce_odr i64 @__go_type_hash_S0_CN3_intsre0_CN3_intsree(i8*, i64) {
entry:
  %2 = bitcast i8* %0 to { i8*, i8* }*
  %3 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %2, i32 0, i32 0
  %4 = bitcast i8** %3 to i8*
  %5 = call i64 @__go_type_hash_identity(i8* %4, i64 8)
  %6 = add i64 0, %5
  %7 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %2, i32 0, i32 1
  %8 = bitcast i8** %7 to i8*
  %9 = call i64 @__go_type_hash_identity(i8* %8, i64 8)
  %10 = mul i64 %6, 33
  %11 = add i64 %10, %9
  ret i64 %11
}

define linkonce_odr i8 @__go_type_equal_S0_CN3_intsre0_CN3_intsree(i8*, i8*, i64) {
entry:
  %3 = bitcast i8* %0 to { i8*, i8* }*
  %4 = bitcast i8* %1 to { i8*, i8* }*
  %5 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %3, i32 0, i32 0
  %6 = bitcast i8** %5 to i8*
  %7 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %4, i32 0, i32 0
  %8 = bitcast i8** %7 to i8*
  %9 = call i8 @__go_type_equal_identity(i8* %6, i8* %8, i64 8)
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %retzero, label %cont

retzero:                                          ; preds = %cont, %entry
  ret i8 0

cont:                                             ; preds = %entry
  %11 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %3, i32 0, i32 1
  %12 = bitcast i8** %11 to i8*
  %13 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %4, i32 0, i32 1
  %14 = bitcast i8** %13 to i8*
  %15 = call i8 @__go_type_equal_identity(i8* %12, i8* %14, i64 8)
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %retzero, label %cont1

cont1:                                            ; preds = %cont
  ret i8 1
}

define void @__go_init_main(i8*) #1 {
entry:
  call void @main..import(i8* undef)
  ret void
}

attributes #0 = { nounwind }
attributes #1 = { "disable-tail-calls"="true" "split-stack" }
