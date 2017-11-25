; ModuleID = 'main'
; source_filename = "main"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%funcVal = type { void ()* }
%arrayType = type { %commonType, %commonType*, %commonType*, i64 }
%commonType = type { i8, i8, i8, i64, i32, %funcVal*, %funcVal*, i8*, { i8*, i64 }*, %uncommonType*, %commonType* }
%uncommonType = type { { i8*, i64 }*, { i8*, i64 }*, %methodSlice }
%methodSlice = type { %method*, i64, i64 }
%method = type { { i8*, i64 }*, { i8*, i64 }*, %commonType*, %commonType*, i8* }
%chanType = type { %commonType, %commonType*, i64 }
%structType = type { %commonType, %structFieldSlice }
%structFieldSlice = type { %structField*, i64, i64 }
%structField = type { { i8*, i64 }*, { i8*, i64 }*, %commonType*, { i8*, i64 }*, i64 }
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
@__go_td_AN3_int6e = linkonce_odr constant %arrayType { %commonType { i8 -111, i8 8, i8 8, i64 48, i32 50332931, %funcVal* @__go_type_hash_AN3_int6e_descriptor, %funcVal* @__go_type_hash_AN3_int6e_descriptor.4, i8* bitcast ([7 x i8*]* @"__go_td_AN3_int6e$gc" to i8*), { i8*, i64 }* @3, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int, %commonType* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AN3_inte, i32 0, i32 0), i64 6 }
@__go_td_CN3_intsre = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 1610653383, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN3_intsre$gc" to i8*), { i8*, i64 }* @5, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int, i64 3 }
@__go_td_S0_AN3_inte0_CN3_intsree = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 32, i32 -1744657600, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([8 x i8*]* @"__go_td_S0_AN3_inte0_CN3_intsree$gc" to i8*), { i8*, i64 }* @12, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS0_AN3_inte0_CN3_intsree, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([2 x %structField], [2 x %structField]* @13, i32 0, i32 0), i64 2, i64 2 } }
@__go_td_AIe3e = linkonce_odr constant %arrayType { %commonType { i8 17, i8 8, i8 8, i64 48, i32 30, %funcVal* @__go_type_hash_AIe3e_descriptor, %funcVal* @__go_type_hash_AIe3e_descriptor.2, i8* bitcast ([9 x i8*]* @"__go_td_AIe3e$gc" to i8*), { i8*, i64 }* @1, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0), %commonType* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AIee, i32 0, i32 0), i64 3 }
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @7, %uncommonType* @10, %commonType* null }
@__go_type_hash_AIe3e_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_AIe3e to void ()*) }
@__go_type_hash_AIe3e_descriptor.2 = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_hash_AIe3e.1 to void ()*) }
@0 = internal constant [15 x i8] c"[3]interface {}"
@1 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @0, i32 0, i32 0), i64 15 }
@__go_td_Ie = linkonce_odr constant %interfaceType { %commonType { i8 20, i8 8, i8 8, i64 16, i32 16, %funcVal* @__go_type_hash_empty_interface_descriptor, %funcVal* @__go_type_equal_empty_interface_descriptor, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), { i8*, i64 }* @21, %uncommonType* null, %commonType* null }, %imethodSlice zeroinitializer }
@__go_td_AIee = linkonce_odr constant %sliceType { %commonType { i8 23, i8 8, i8 8, i64 24, i32 30, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_AIee$gc" to i8*), { i8*, i64 }* @19, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0) }
@"__go_td_AIe3e$gc" = linkonce_odr constant [9 x i8*] [i8* inttoptr (i64 48 to i8*), i8* inttoptr (i64 3 to i8*), i8* null, i8* inttoptr (i64 3 to i8*), i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* inttoptr (i64 4 to i8*), i8* null]
@__go_type_hash_AN3_int6e_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_AN3_int6e to void ()*) }
@__go_type_hash_AN3_int6e_descriptor.4 = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_hash_AN3_int6e.3 to void ()*) }
@2 = internal constant [6 x i8] c"[6]int"
@3 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @2, i32 0, i32 0), i64 6 }
@__go_td_AN3_inte = linkonce_odr constant %sliceType { %commonType { i8 23, i8 8, i8 8, i64 24, i32 50332931, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_AN3_inte$gc" to i8*), { i8*, i64 }* @17, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int }
@"__go_td_AN3_int6e$gc" = linkonce_odr constant [7 x i8*] [i8* inttoptr (i64 48 to i8*), i8* inttoptr (i64 3 to i8*), i8* null, i8* inttoptr (i64 6 to i8*), i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 4 to i8*), i8* null]
@4 = internal constant [8 x i8] c"chan int"
@5 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @4, i32 0, i32 0), i64 8 }
@"__go_td_CN3_intsre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* null]
@6 = internal constant [3 x i8] c"int"
@7 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @6, i32 0, i32 0), i64 3 }
@8 = internal constant [3 x i8] c"int"
@9 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @8, i32 0, i32 0), i64 3 }
@10 = internal constant %uncommonType { { i8*, i64 }* @9, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]
@11 = internal constant [26 x i8] c"struct { []int; chan int }"
@12 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([26 x i8], [26 x i8]* @11, i32 0, i32 0), i64 26 }
@__go_td_pS0_AN3_inte0_CN3_intsree = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 -2144717815, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS0_AN3_inte0_CN3_intsree$gc" to i8*), { i8*, i64 }* @15, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S0_AN3_inte0_CN3_intsree, i32 0, i32 0) }
@13 = internal constant [2 x %structField] [%structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AN3_inte, i32 0, i32 0), { i8*, i64 }* null, i64 0 }, %structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0), { i8*, i64 }* null, i64 24 }]
@"__go_td_S0_AN3_inte0_CN3_intsree$gc" = linkonce_odr constant [8 x i8*] [i8* inttoptr (i64 32 to i8*), i8* inttoptr (i64 10 to i8*), i8* null, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), i8* inttoptr (i64 6 to i8*), i8* inttoptr (i64 24 to i8*), i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* null]
@14 = internal constant [27 x i8] c"*struct { []int; chan int }"
@15 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([27 x i8], [27 x i8]* @14, i32 0, i32 0), i64 27 }
@"__go_td_pS0_AN3_inte0_CN3_intsree$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([8 x i8*]* @"__go_td_S0_AN3_inte0_CN3_intsree$gc" to i8*), i8* null]
@16 = internal constant [5 x i8] c"[]int"
@17 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @16, i32 0, i32 0), i64 5 }
@"__go_td_AN3_inte$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 10 to i8*), i8* null, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), i8* null]
@18 = internal constant [14 x i8] c"[]interface {}"
@19 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @18, i32 0, i32 0), i64 14 }
@"__go_td_AIee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 10 to i8*), i8* null, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), i8* null]
@20 = internal constant [12 x i8] c"interface {}"
@21 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @20, i32 0, i32 0), i64 12 }
@"__go_td_Ie$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* null]

declare void @__go_go(i8* nest, i8*, i8*)

; Function Attrs: nounwind
declare i8* @__go_new(i8* nest, i8*, i64) #0

declare i8* @__go_new_channel(i8* nest, i8*, i64)

declare void @__go_receive(i8* nest, i8*, i8*, i8*)

; Function Attrs: noreturn
declare void @__go_runtime_error(i8* nest, i32) #1

declare void @__go_send_big(i8* nest, i8*, i8*, i8*)

declare i64 @__go_type_hash_empty_interface(i8*, i64)

declare i8 @__go_type_equal_empty_interface(i8*, i8*, i64)

declare i64 @__go_type_hash_identity(i8*, i64)

declare i8 @__go_type_equal_identity(i8*, i8*, i64)

define void @main..import(i8* nest) #2 {
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

define void @main.main(i8* nest) #2 {
prologue:
  %1 = alloca i64
  %2 = alloca i64
  %3 = alloca { i8*, i64, i64 }
  %4 = alloca { i64, { i8*, i8* } }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %5 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AN3_int6e, i32 0, i32 0, i32 0), i64 48)
  %slicelit = bitcast i8* %5 to [6 x i64]*
  %6 = bitcast [6 x i64]* %slicelit to i8*
  %7 = bitcast i8* %6 to i64*
  %8 = getelementptr i64, i64* %7, i64 0
  %9 = bitcast i64* %8 to i8*
  %10 = bitcast i8* %9 to i64*
  store i64 7, i64* %10
  %11 = bitcast i8* %6 to i64*
  %12 = getelementptr i64, i64* %11, i64 1
  %13 = bitcast i64* %12 to i8*
  %14 = bitcast i8* %13 to i64*
  store i64 2, i64* %14
  %15 = bitcast i8* %6 to i64*
  %16 = getelementptr i64, i64* %15, i64 2
  %17 = bitcast i64* %16 to i8*
  %18 = bitcast i8* %17 to i64*
  store i64 8, i64* %18
  %19 = bitcast i8* %6 to i64*
  %20 = getelementptr i64, i64* %19, i64 3
  %21 = bitcast i64* %20 to i8*
  %22 = bitcast i8* %21 to i64*
  store i64 -9, i64* %22
  %23 = bitcast i8* %6 to i64*
  %24 = getelementptr i64, i64* %23, i64 4
  %25 = bitcast i64* %24 to i8*
  %26 = bitcast i8* %25 to i64*
  store i64 4, i64* %26
  %27 = bitcast i8* %6 to i64*
  %28 = getelementptr i64, i64* %27, i64 5
  %29 = bitcast i64* %28 to i8*
  %30 = bitcast i8* %29 to i64*
  store i64 0, i64* %30
  %31 = getelementptr inbounds i8, i8* %6, i64 0
  %32 = insertvalue { i8*, i64, i64 } undef, i8* %31, 0
  %33 = insertvalue { i8*, i64, i64 } %32, i64 6, 1
  %34 = insertvalue { i8*, i64, i64 } %33, i64 6, 2
  %35 = call i8* @__go_new_channel(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 0)
  %36 = extractvalue { i8*, i64, i64 } %34, 1
  %37 = sdiv i64 %36, 2
  %38 = extractvalue { i8*, i64, i64 } %34, 0
  %39 = extractvalue { i8*, i64, i64 } %34, 1
  %40 = extractvalue { i8*, i64, i64 } %34, 2
  %41 = icmp slt i64 %37, 0
  %42 = icmp slt i64 %40, %37
  %43 = icmp slt i64 %40, %40
  %44 = or i1 false, %41
  %45 = or i1 %44, %42
  %46 = or i1 %45, %43
  br i1 %46, label %47, label %48, !prof !0

; <label>:47:                                     ; preds = %48, %.0.entry
  call void @__go_runtime_error(i8* nest undef, i32 3)
  unreachable

; <label>:48:                                     ; preds = %.0.entry
  %49 = sub i64 %37, 0
  %50 = sub i64 %40, 0
  %51 = getelementptr inbounds i8, i8* %38, i64 0
  %52 = insertvalue { i8*, i64, i64 } undef, i8* %51, 0
  %53 = insertvalue { i8*, i64, i64 } %52, i64 %49, 1
  %54 = insertvalue { i8*, i64, i64 } %53, i64 %50, 2
  %55 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_AN3_inte0_CN3_intsree, i32 0, i32 0, i32 0), i64 32)
  %56 = bitcast i8* %55 to { { i8*, i64, i64 }, i8* }*
  %57 = getelementptr inbounds { { i8*, i64, i64 }, i8* }, { { i8*, i64, i64 }, i8* }* %56, i32 0, i32 0
  store { i8*, i64, i64 } %54, { i8*, i64, i64 }* %57
  %58 = getelementptr inbounds { { i8*, i64, i64 }, i8* }, { { i8*, i64, i64 }, i8* }* %56, i32 0, i32 1
  store i8* %35, i8** %58
  %59 = bitcast { { i8*, i64, i64 }, i8* }* %56 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @22 to i8*), i8* %59)
  %60 = extractvalue { i8*, i64, i64 } %34, 1
  %61 = sdiv i64 %60, 2
  %62 = extractvalue { i8*, i64, i64 } %34, 0
  %63 = extractvalue { i8*, i64, i64 } %34, 1
  %64 = extractvalue { i8*, i64, i64 } %34, 2
  %65 = icmp slt i64 %61, 0
  %66 = icmp slt i64 %63, %61
  %67 = icmp slt i64 %64, %63
  %68 = icmp slt i64 %64, %64
  %69 = or i1 %65, %66
  %70 = or i1 %69, %67
  %71 = or i1 %70, %68
  br i1 %71, label %47, label %72, !prof !0

; <label>:72:                                     ; preds = %48
  %73 = sub i64 %63, %61
  %74 = sub i64 %64, %61
  %75 = mul i64 %61, 8
  %76 = getelementptr inbounds i8, i8* %62, i64 %75
  %77 = insertvalue { i8*, i64, i64 } undef, i8* %76, 0
  %78 = insertvalue { i8*, i64, i64 } %77, i64 %73, 1
  %79 = insertvalue { i8*, i64, i64 } %78, i64 %74, 2
  %80 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_AN3_inte0_CN3_intsree, i32 0, i32 0, i32 0), i64 32)
  %81 = bitcast i8* %80 to { { i8*, i64, i64 }, i8* }*
  %82 = getelementptr inbounds { { i8*, i64, i64 }, i8* }, { { i8*, i64, i64 }, i8* }* %81, i32 0, i32 0
  store { i8*, i64, i64 } %79, { i8*, i64, i64 }* %82
  %83 = getelementptr inbounds { { i8*, i64, i64 }, i8* }, { { i8*, i64, i64 }, i8* }* %81, i32 0, i32 1
  store i8* %35, i8** %83
  %84 = bitcast { { i8*, i64, i64 }, i8* }* %81 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @23 to i8*), i8* %84)
  %85 = bitcast i64* %1 to i8*
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %35, i8* %85)
  %86 = load i64, i64* %1
  %87 = bitcast i64* %2 to i8*
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %35, i8* %87)
  %88 = load i64, i64* %2
  %89 = add i64 %86, %88
  %90 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe3e, i32 0, i32 0, i32 0), i64 48)
  %varargs = bitcast i8* %90 to [3 x { i8*, i8* }]*
  %91 = bitcast [3 x { i8*, i8* }]* %varargs to i8*
  %92 = bitcast i8* %91 to { i8*, i8* }*
  %93 = getelementptr { i8*, i8* }, { i8*, i8* }* %92, i64 0
  %94 = bitcast { i8*, i8* }* %93 to i8*
  %95 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %96 = bitcast i8* %95 to i64*
  store i64 %86, i64* %96
  %97 = bitcast i64* %96 to i8*
  %98 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %97, 1
  %99 = bitcast i8* %94 to { i8*, i8* }*
  store { i8*, i8* } %98, { i8*, i8* }* %99
  %100 = bitcast i8* %91 to { i8*, i8* }*
  %101 = getelementptr { i8*, i8* }, { i8*, i8* }* %100, i64 1
  %102 = bitcast { i8*, i8* }* %101 to i8*
  %103 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %104 = bitcast i8* %103 to i64*
  store i64 %88, i64* %104
  %105 = bitcast i64* %104 to i8*
  %106 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %105, 1
  %107 = bitcast i8* %102 to { i8*, i8* }*
  store { i8*, i8* } %106, { i8*, i8* }* %107
  %108 = bitcast i8* %91 to { i8*, i8* }*
  %109 = getelementptr { i8*, i8* }, { i8*, i8* }* %108, i64 2
  %110 = bitcast { i8*, i8* }* %109 to i8*
  %111 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %112 = bitcast i8* %111 to i64*
  store i64 %89, i64* %112
  %113 = bitcast i64* %112 to i8*
  %114 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %113, 1
  %115 = bitcast i8* %110 to { i8*, i8* }*
  store { i8*, i8* } %114, { i8*, i8* }* %115
  %116 = getelementptr inbounds i8, i8* %91, i64 0
  %117 = insertvalue { i8*, i64, i64 } undef, i8* %116, 0
  %118 = insertvalue { i8*, i64, i64 } %117, i64 3, 1
  %119 = insertvalue { i8*, i64, i64 } %118, i64 3, 2
  store { i8*, i64, i64 } %119, { i8*, i64, i64 }* %3
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %4, i8* nest undef, { i8*, i64, i64 }* byval %3)
  %120 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %4, i32 0, i32 0
  %121 = load i64, i64* %120
  %122 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %4, i32 0, i32 1
  %123 = load { i8*, i8* }, { i8*, i8* }* %122
  ret void
}

define internal void @22(i8*) #2 {
prologue:
  %1 = bitcast i8* %0 to { { i8*, i64, i64 }, i8* }*
  %2 = getelementptr inbounds { { i8*, i64, i64 }, i8* }, { { i8*, i64, i64 }, i8* }* %1, i32 0, i32 0
  %3 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %2
  %4 = getelementptr inbounds { { i8*, i64, i64 }, i8* }, { { i8*, i64, i64 }, i8* }* %1, i32 0, i32 1
  %5 = load i8*, i8** %4
  %6 = alloca { i8*, i64, i64 }
  br label %entry

entry:                                            ; preds = %prologue
  store { i8*, i64, i64 } %3, { i8*, i64, i64 }* %6
  call void @main.sum(i8* nest undef, { i8*, i64, i64 }* byval %6, i8* %5)
  ret void
}

define internal void @main.sum(i8* nest, { i8*, i64, i64 }* byval, i8*) #2 {
prologue:
  %3 = alloca i64
  %4 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %1
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %5 = extractvalue { i8*, i64, i64 } %4, 1
  br label %.1.rangeindex.loop

.1.rangeindex.loop:                               ; preds = %18, %.0.entry
  %sum = phi i64 [ 0, %.0.entry ], [ %24, %18 ]
  %6 = phi i64 [ -1, %.0.entry ], [ %7, %18 ]
  %7 = add i64 %6, 1
  %8 = icmp slt i64 %7, %5
  %9 = zext i1 %8 to i8
  %10 = trunc i8 %9 to i1
  br i1 %10, label %.2.rangeindex.body, label %.3.rangeindex.done

.2.rangeindex.body:                               ; preds = %.1.rangeindex.loop
  %11 = extractvalue { i8*, i64, i64 } %4, 0
  %12 = extractvalue { i8*, i64, i64 } %4, 1
  %13 = icmp slt i64 %7, 0
  %14 = icmp sle i64 %12, %7
  %15 = or i1 %13, %14
  br i1 %15, label %17, label %18, !prof !0

.3.rangeindex.done:                               ; preds = %.1.rangeindex.loop
  store i64 %sum, i64* %3
  %16 = bitcast i64* %3 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %2, i8* %16)
  ret void

; <label>:17:                                     ; preds = %.2.rangeindex.body
  call void @__go_runtime_error(i8* nest undef, i32 0)
  unreachable

; <label>:18:                                     ; preds = %.2.rangeindex.body
  %19 = bitcast i8* %11 to i64*
  %20 = getelementptr i64, i64* %19, i64 %7
  %21 = bitcast i64* %20 to i8*
  %22 = bitcast i8* %21 to i64*
  %23 = load i64, i64* %22
  %24 = add i64 %sum, %23
  br label %.1.rangeindex.loop
}

define internal void @23(i8*) #2 {
prologue:
  %1 = bitcast i8* %0 to { { i8*, i64, i64 }, i8* }*
  %2 = getelementptr inbounds { { i8*, i64, i64 }, i8* }, { { i8*, i64, i64 }, i8* }* %1, i32 0, i32 0
  %3 = load { i8*, i64, i64 }, { i8*, i64, i64 }* %2
  %4 = getelementptr inbounds { { i8*, i64, i64 }, i8* }, { { i8*, i64, i64 }, i8* }* %1, i32 0, i32 1
  %5 = load i8*, i8** %4
  %6 = alloca { i8*, i64, i64 }
  br label %entry

entry:                                            ; preds = %prologue
  store { i8*, i64, i64 } %3, { i8*, i64, i64 }* %6
  call void @main.sum(i8* nest undef, { i8*, i64, i64 }* byval %6, i8* %5)
  ret void
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

define linkonce_odr i64 @__go_type_hash_AIe3e(i8*, i64) {
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
  %11 = icmp eq i64 %10, 3
  br i1 %11, label %exit, label %loop

exit:                                             ; preds = %loop
  ret i64 %9
}

define linkonce_odr i8 @__go_type_hash_AIe3e.1(i8*, i8*, i64) {
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
  %13 = icmp eq i64 %12, 3
  br i1 %13, label %exit, label %loop
}

define linkonce_odr i64 @__go_type_hash_AN3_int6e(i8*, i64) {
entry:
  %2 = bitcast i8* %0 to i64*
  br label %loop

loop:                                             ; preds = %loop, %entry
  %3 = phi i64 [ 0, %entry ], [ %10, %loop ]
  %4 = phi i64 [ 0, %entry ], [ %9, %loop ]
  %5 = getelementptr i64, i64* %2, i64 %3
  %6 = bitcast i64* %5 to i8*
  %7 = call i64 @__go_type_hash_identity(i8* %6, i64 8)
  %8 = mul i64 %4, 33
  %9 = add i64 %8, %7
  %10 = add i64 %3, 1
  %11 = icmp eq i64 %10, 6
  br i1 %11, label %exit, label %loop

exit:                                             ; preds = %loop
  ret i64 %9
}

define linkonce_odr i8 @__go_type_hash_AN3_int6e.3(i8*, i8*, i64) {
entry:
  %3 = bitcast i8* %0 to i64*
  %4 = bitcast i8* %1 to i64*
  br label %loop

loop:                                             ; preds = %cont, %entry
  %5 = phi i64 [ 0, %entry ], [ %12, %cont ]
  %6 = getelementptr i64, i64* %3, i64 %5
  %7 = bitcast i64* %6 to i8*
  %8 = getelementptr i64, i64* %4, i64 %5
  %9 = bitcast i64* %8 to i8*
  %10 = call i8 @__go_type_equal_identity(i8* %7, i8* %9, i64 8)
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %retzero, label %cont

exit:                                             ; preds = %cont
  ret i8 1

retzero:                                          ; preds = %loop
  ret i8 0

cont:                                             ; preds = %loop
  %12 = add i64 %5, 1
  %13 = icmp eq i64 %12, 6
  br i1 %13, label %exit, label %loop
}

define void @__go_init_main(i8*) #2 {
entry:
  call void @main..import(i8* undef)
  ret void
}

attributes #0 = { nounwind }
attributes #1 = { noreturn }
attributes #2 = { "disable-tail-calls"="true" "split-stack" }

!0 = !{!"branch_weights", i32 1, i32 1000}
