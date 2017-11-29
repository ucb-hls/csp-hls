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
%funcType = type { %commonType, i8, %typeSlice, %typeSlice }
%typeSlice = type { %commonType**, i64, i64 }

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
@__go_td_CN6_stringsre = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 -1073652185, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN6_stringsre$gc" to i8*), { i8*, i64 }* @8, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_string, i64 3 }
@__go_td_S1__Fe1__pCN6_stringsree = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 16, i32 5737008, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([7 x i8*]* @"__go_td_S1__Fe1__pCN6_stringsree$gc" to i8*), { i8*, i64 }* @15, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS1__Fe1__pCN6_stringsree, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([2 x %structField], [2 x %structField]* @20, i32 0, i32 0), i64 2, i64 2 } }
@__go_td_S0_Fee = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 8, i32 44, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([4 x i8*]* @"__go_td_S0_Fee$gc" to i8*), { i8*, i64 }* @22, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS0_Fee, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([1 x %structField], [1 x %structField]* @23, i32 0, i32 0), i64 1, i64 1 } }
@__go_td_AIe2e = linkonce_odr constant %arrayType { %commonType { i8 17, i8 8, i8 8, i64 32, i32 30, %funcVal* @__go_type_hash_AIe2e_descriptor, %funcVal* @__go_type_hash_AIe2e_descriptor.2, i8* bitcast ([9 x i8*]* @"__go_td_AIe2e$gc" to i8*), { i8*, i64 }* @6, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0), %commonType* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AIee, i32 0, i32 0), i64 2 }
@0 = internal global [8 x i8] c"received"
@__go_tdn_string = linkonce_odr constant %commonType { i8 24, i8 8, i8 8, i64 16, i32 100666096, %funcVal* @__go_type_hash_string_descriptor, %funcVal* @__go_type_equal_string_descriptor, i8* bitcast ([4 x i8*]* @"__go_tdn_string$gc" to i8*), { i8*, i64 }* @10, %uncommonType* @13, %commonType* null }
@1 = internal global [8 x i8] c"received"
@2 = internal global [31 x i8] c"blocking select matched no case"
@3 = internal global [3 x i8] c"one"
@4 = internal global [3 x i8] c"two"
@__go_type_hash_AIe2e_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_AIe2e to void ()*) }
@__go_type_hash_AIe2e_descriptor.2 = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_hash_AIe2e.1 to void ()*) }
@5 = internal constant [15 x i8] c"[2]interface {}"
@6 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @5, i32 0, i32 0), i64 15 }
@__go_td_Ie = linkonce_odr constant %interfaceType { %commonType { i8 20, i8 8, i8 8, i64 16, i32 16, %funcVal* @__go_type_hash_empty_interface_descriptor, %funcVal* @__go_type_equal_empty_interface_descriptor, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), { i8*, i64 }* @35, %uncommonType* null, %commonType* null }, %imethodSlice zeroinitializer }
@__go_td_AIee = linkonce_odr constant %sliceType { %commonType { i8 23, i8 8, i8 8, i64 24, i32 30, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_AIee$gc" to i8*), { i8*, i64 }* @31, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0) }
@"__go_td_AIe2e$gc" = linkonce_odr constant [9 x i8*] [i8* inttoptr (i64 32 to i8*), i8* inttoptr (i64 3 to i8*), i8* null, i8* inttoptr (i64 2 to i8*), i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* inttoptr (i64 4 to i8*), i8* null]
@7 = internal constant [11 x i8] c"chan string"
@8 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @7, i32 0, i32 0), i64 11 }
@"__go_td_CN6_stringsre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN6_stringsre, i32 0, i32 0, i32 0), i8* null]
@9 = internal constant [6 x i8] c"string"
@10 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @9, i32 0, i32 0), i64 6 }
@11 = internal constant [6 x i8] c"string"
@12 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @11, i32 0, i32 0), i64 6 }
@13 = internal constant %uncommonType { { i8*, i64 }* @12, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_string$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 7 to i8*), i8* null, i8* null]
@14 = internal constant [35 x i8] c"struct { _ func(); _ *chan string }"
@15 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([35 x i8], [35 x i8]* @14, i32 0, i32 0), i64 35 }
@__go_td_pS1__Fe1__pCN6_stringsree = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 91792137, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS1__Fe1__pCN6_stringsree$gc" to i8*), { i8*, i64 }* @27, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S1__Fe1__pCN6_stringsree, i32 0, i32 0) }
@16 = internal constant [1 x i8] c"_"
@17 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @16, i32 0, i32 0), i64 1 }
@__go_td_Fe = linkonce_odr constant %funcType { %commonType { i8 19, i8 8, i8 8, i64 8, i32 8, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([4 x i8*]* @"__go_td_Fe$gc" to i8*), { i8*, i64 }* @33, %uncommonType* null, %commonType* null }, i8 0, %typeSlice zeroinitializer, %typeSlice zeroinitializer }
@18 = internal constant [1 x i8] c"_"
@19 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @18, i32 0, i32 0), i64 1 }
@__go_td_pCN6_stringsre = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 1434233, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pCN6_stringsre$gc" to i8*), { i8*, i64 }* @25, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN6_stringsre, i32 0, i32 0) }
@20 = internal constant [2 x %structField] [%structField { { i8*, i64 }* @17, { i8*, i64 }* null, %commonType* getelementptr inbounds (%funcType, %funcType* @__go_td_Fe, i32 0, i32 0), { i8*, i64 }* null, i64 0 }, %structField { { i8*, i64 }* @19, { i8*, i64 }* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pCN6_stringsre, i32 0, i32 0), { i8*, i64 }* null, i64 8 }]
@"__go_td_S1__Fe1__pCN6_stringsree$gc" = linkonce_odr constant [7 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 2 to i8*), i8* null, i8* inttoptr (i64 1 to i8*), i8* inttoptr (i64 8 to i8*), i8* bitcast ([5 x i8*]* @"__go_td_CN6_stringsre$gc" to i8*), i8* null]
@21 = internal constant [17 x i8] c"struct { func() }"
@22 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @21, i32 0, i32 0), i64 17 }
@__go_td_pS0_Fee = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 713, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS0_Fee$gc" to i8*), { i8*, i64 }* @29, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S0_Fee, i32 0, i32 0) }
@23 = internal constant [1 x %structField] [%structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%funcType, %funcType* @__go_td_Fe, i32 0, i32 0), { i8*, i64 }* null, i64 0 }]
@"__go_td_S0_Fee$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 2 to i8*), i8* null, i8* null]
@24 = internal constant [12 x i8] c"*chan string"
@25 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @24, i32 0, i32 0), i64 12 }
@"__go_td_pCN6_stringsre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([5 x i8*]* @"__go_td_CN6_stringsre$gc" to i8*), i8* null]
@26 = internal constant [36 x i8] c"*struct { _ func(); _ *chan string }"
@27 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([36 x i8], [36 x i8]* @26, i32 0, i32 0), i64 36 }
@"__go_td_pS1__Fe1__pCN6_stringsree$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([7 x i8*]* @"__go_td_S1__Fe1__pCN6_stringsree$gc" to i8*), i8* null]
@28 = internal constant [18 x i8] c"*struct { func() }"
@29 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @28, i32 0, i32 0), i64 18 }
@"__go_td_pS0_Fee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([4 x i8*]* @"__go_td_S0_Fee$gc" to i8*), i8* null]
@30 = internal constant [14 x i8] c"[]interface {}"
@31 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @30, i32 0, i32 0), i64 14 }
@"__go_td_AIee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 10 to i8*), i8* null, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), i8* null]
@32 = internal constant [6 x i8] c"func()"
@33 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @32, i32 0, i32 0), i64 6 }
@"__go_td_Fe$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 2 to i8*), i8* null, i8* null]
@34 = internal constant [12 x i8] c"interface {}"
@35 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @34, i32 0, i32 0), i64 12 }
@"__go_td_Ie$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* null]

declare void @__go_go(i8* nest, i8*, i8*)

; Function Attrs: nounwind
declare i8* @__go_new(i8* nest, i8*, i64) #0

declare i8* @__go_new_channel(i8* nest, i8*, i64)

declare i8* @runtime.newselect(i8* nest, i32)

; Function Attrs: noreturn
declare void @__go_panic(i8* nest, i8*, i8*) #1

; Function Attrs: noreturn
declare void @__go_runtime_error(i8* nest, i32) #1

declare i64 @runtime.selectgo(i8* nest, i8*)

declare void @runtime.selectrecv2(i8* nest, i8*, i8*, i8*, i8*, i32)

declare void @__go_send_big(i8* nest, i8*, i8*, i8*)

declare i64 @__go_type_hash_empty_interface(i8*, i64)

declare i8 @__go_type_equal_empty_interface(i8*, i8*, i64)

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
  call void @time..import(i8* undef)
  call void @fmt..import(i8* undef)
  br label %.0.entry
}

declare void @time..import(i8*)

declare void @fmt..import(i8*)

define void @main.main(i8* nest) #2 {
prologue:
  %1 = alloca { i8*, i64 }
  %2 = alloca { i8*, i64 }
  %3 = alloca i8
  %4 = alloca { i8*, i64 }*
  %5 = alloca { i8*, i64 }*
  %6 = alloca { i8*, i64, i64 }
  %7 = alloca { i64, { i8*, i8* } }
  %8 = alloca { i8*, i64, i64 }
  %9 = alloca { i64, { i8*, i8* } }
  %10 = alloca { i8*, i8* }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %11 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN6_stringsre, i32 0, i32 0, i32 0), i64 8)
  %c1 = bitcast i8* %11 to i8**
  %12 = bitcast i8** %c1 to i8*
  %13 = call i8* @__go_new_channel(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN6_stringsre, i32 0, i32 0, i32 0), i64 0)
  %14 = bitcast i8* %12 to i8**
  store i8* %13, i8** %14
  %15 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN6_stringsre, i32 0, i32 0, i32 0), i64 8)
  %c2 = bitcast i8* %15 to i8**
  %16 = bitcast i8** %c2 to i8*
  %17 = call i8* @__go_new_channel(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN6_stringsre, i32 0, i32 0, i32 0), i64 0)
  %18 = bitcast i8* %16 to i8**
  store i8* %17, i8** %18
  %19 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S1__Fe1__pCN6_stringsree, i32 0, i32 0, i32 0), i64 16)
  %20 = bitcast i8* %19 to { i8*, i8* }*
  %21 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %20, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$1" to i8*), i8** %21
  %22 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %20, i32 0, i32 1
  store i8* %12, i8** %22
  %23 = bitcast { i8*, i8* }* %20 to i8*
  %24 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_Fee, i32 0, i32 0, i32 0), i64 8)
  %25 = bitcast i8* %24 to { i8* }*
  %26 = getelementptr inbounds { i8* }, { i8* }* %25, i32 0, i32 0
  store i8* %23, i8** %26
  %27 = bitcast { i8* }* %25 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @36 to i8*), i8* %27)
  %28 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S1__Fe1__pCN6_stringsree, i32 0, i32 0, i32 0), i64 16)
  %29 = bitcast i8* %28 to { i8*, i8* }*
  %30 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %29, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$2" to i8*), i8** %30
  %31 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %29, i32 0, i32 1
  store i8* %16, i8** %31
  %32 = bitcast { i8*, i8* }* %29 to i8*
  %33 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_Fee, i32 0, i32 0, i32 0), i64 8)
  %34 = bitcast i8* %33 to { i8* }*
  %35 = getelementptr inbounds { i8* }, { i8* }* %34, i32 0, i32 0
  store i8* %32, i8** %35
  %36 = bitcast { i8* }* %34 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @37 to i8*), i8* %36)
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %37 = bitcast i8* %12 to i8**
  %38 = load i8*, i8** %37
  %39 = bitcast i8* %16 to i8**
  %40 = load i8*, i8** %39
  %41 = call i8* @runtime.newselect(i8* nest undef, i32 2)
  %42 = bitcast { i8*, i64 }** %4 to i8**
  store { i8*, i64 }* %1, { i8*, i64 }** %4
  %43 = load i8*, i8** %42
  call void @runtime.selectrecv2(i8* nest undef, i8* %41, i8* %38, i8* %43, i8* %3, i32 0)
  %44 = bitcast { i8*, i64 }** %5 to i8**
  store { i8*, i64 }* %2, { i8*, i64 }** %5
  %45 = load i8*, i8** %44
  call void @runtime.selectrecv2(i8* nest undef, i8* %41, i8* %40, i8* %45, i8* %3, i32 1)
  %46 = call i64 @runtime.selectgo(i8* nest undef, i8* %41)
  %47 = load i8, i8* %3
  %48 = load { i8*, i64 }, { i8*, i64 }* %1
  %49 = load { i8*, i64 }, { i8*, i64 }* %2
  %50 = icmp eq i64 %46, 0
  %51 = zext i1 %50 to i8
  switch i64 %46, label %.8.select.next [
    i64 0, label %.5.select.body
    i64 1, label %.7.select.body
  ]

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.4.select.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %55, %.4.select.done ]
  %msg1 = phi { i8*, i64 } [ zeroinitializer, %.0.entry ], [ %msg11, %.4.select.done ]
  %msg2 = phi { i8*, i64 } [ zeroinitializer, %.0.entry ], [ %msg22, %.4.select.done ]
  %52 = icmp slt i64 %i, 2
  %53 = zext i1 %52 to i8
  %54 = trunc i8 %53 to i1
  br i1 %54, label %.1.for.body, label %.2.for.done

.4.select.done:                                   ; preds = %.7.select.body, %.5.select.body
  %msg11 = phi { i8*, i64 } [ %48, %.5.select.body ], [ %msg1, %.7.select.body ]
  %msg22 = phi { i8*, i64 } [ %msg2, %.5.select.body ], [ %49, %.7.select.body ]
  %55 = add i64 %i, 1
  br label %.3.for.loop

.5.select.body:                                   ; preds = %.1.for.body
  %56 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe2e, i32 0, i32 0, i32 0), i64 32)
  %varargs = bitcast i8* %56 to [2 x { i8*, i8* }]*
  %57 = bitcast [2 x { i8*, i8* }]* %varargs to i8*
  %58 = bitcast i8* %57 to { i8*, i8* }*
  %59 = getelementptr { i8*, i8* }, { i8*, i8* }* %58, i64 0
  %60 = bitcast { i8*, i8* }* %59 to i8*
  %61 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %62 = bitcast i8* %61 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @0, i32 0, i32 0), i64 8 }, { i8*, i64 }* %62
  %63 = bitcast { i8*, i64 }* %62 to i8*
  %64 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %63, 1
  %65 = bitcast i8* %60 to { i8*, i8* }*
  store { i8*, i8* } %64, { i8*, i8* }* %65
  %66 = bitcast i8* %57 to { i8*, i8* }*
  %67 = getelementptr { i8*, i8* }, { i8*, i8* }* %66, i64 1
  %68 = bitcast { i8*, i8* }* %67 to i8*
  %69 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %70 = bitcast i8* %69 to { i8*, i64 }*
  store { i8*, i64 } %48, { i8*, i64 }* %70
  %71 = bitcast { i8*, i64 }* %70 to i8*
  %72 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %71, 1
  %73 = bitcast i8* %68 to { i8*, i8* }*
  store { i8*, i8* } %72, { i8*, i8* }* %73
  %74 = getelementptr inbounds i8, i8* %57, i64 0
  %75 = insertvalue { i8*, i64, i64 } undef, i8* %74, 0
  %76 = insertvalue { i8*, i64, i64 } %75, i64 2, 1
  %77 = insertvalue { i8*, i64, i64 } %76, i64 2, 2
  store { i8*, i64, i64 } %77, { i8*, i64, i64 }* %6
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %7, i8* nest undef, { i8*, i64, i64 }* byval %6)
  %78 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %7, i32 0, i32 0
  %79 = load i64, i64* %78
  %80 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %7, i32 0, i32 1
  %81 = load { i8*, i8* }, { i8*, i8* }* %80
  br label %.4.select.done

.7.select.body:                                   ; preds = %.1.for.body
  %82 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe2e, i32 0, i32 0, i32 0), i64 32)
  %varargs3 = bitcast i8* %82 to [2 x { i8*, i8* }]*
  %83 = bitcast [2 x { i8*, i8* }]* %varargs3 to i8*
  %84 = bitcast i8* %83 to { i8*, i8* }*
  %85 = getelementptr { i8*, i8* }, { i8*, i8* }* %84, i64 0
  %86 = bitcast { i8*, i8* }* %85 to i8*
  %87 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %88 = bitcast i8* %87 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @1, i32 0, i32 0), i64 8 }, { i8*, i64 }* %88
  %89 = bitcast { i8*, i64 }* %88 to i8*
  %90 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %89, 1
  %91 = bitcast i8* %86 to { i8*, i8* }*
  store { i8*, i8* } %90, { i8*, i8* }* %91
  %92 = bitcast i8* %83 to { i8*, i8* }*
  %93 = getelementptr { i8*, i8* }, { i8*, i8* }* %92, i64 1
  %94 = bitcast { i8*, i8* }* %93 to i8*
  %95 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %96 = bitcast i8* %95 to { i8*, i64 }*
  store { i8*, i64 } %49, { i8*, i64 }* %96
  %97 = bitcast { i8*, i64 }* %96 to i8*
  %98 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %97, 1
  %99 = bitcast i8* %94 to { i8*, i8* }*
  store { i8*, i8* } %98, { i8*, i8* }* %99
  %100 = getelementptr inbounds i8, i8* %83, i64 0
  %101 = insertvalue { i8*, i64, i64 } undef, i8* %100, 0
  %102 = insertvalue { i8*, i64, i64 } %101, i64 2, 1
  %103 = insertvalue { i8*, i64, i64 } %102, i64 2, 2
  store { i8*, i64, i64 } %103, { i8*, i64, i64 }* %8
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %9, i8* nest undef, { i8*, i64, i64 }* byval %8)
  %104 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %9, i32 0, i32 0
  %105 = load i64, i64* %104
  %106 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %9, i32 0, i32 1
  %107 = load { i8*, i8* }, { i8*, i8* }* %106
  br label %.4.select.done

.8.select.next:                                   ; preds = %.1.for.body
  %108 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %109 = bitcast i8* %108 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([31 x i8], [31 x i8]* @2, i32 0, i32 0), i64 31 }, { i8*, i64 }* %109
  %110 = bitcast { i8*, i64 }* %109 to i8*
  %111 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %110, 1
  store { i8*, i8* } %111, { i8*, i8* }* %10
  %112 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %10, i32 0, i32 0
  %113 = load i8*, i8** %112
  %114 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %10, i32 0, i32 1
  %115 = load i8*, i8** %114
  call void @__go_panic(i8* nest undef, i8* %113, i8* %115)
  unreachable
}

define internal void @"main.main:main.main$1"(i8* nest) #2 {
prologue:
  %1 = alloca { i8*, i64 }
  %2 = bitcast i8* %0 to { i8*, i8* }*
  %3 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %2, i32 0, i32 1
  %4 = load i8*, i8** %3
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @time.Sleep(i8* nest undef, i64 1000000000)
  %5 = icmp eq i8* %4, null
  br i1 %5, label %6, label %7, !prof !0

; <label>:6:                                      ; preds = %.0.entry
  call void @__go_runtime_error(i8* nest undef, i32 6)
  unreachable

; <label>:7:                                      ; preds = %.0.entry
  %8 = bitcast i8* %4 to i8**
  %9 = load i8*, i8** %8
  store { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @3, i32 0, i32 0), i64 3 }, { i8*, i64 }* %1
  %10 = bitcast { i8*, i64 }* %1 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN6_stringsre, i32 0, i32 0, i32 0), i8* %9, i8* %10)
  ret void
}

define internal void @36(i8*) #2 {
prologue:
  %1 = bitcast i8* %0 to { i8* }*
  %2 = getelementptr inbounds { i8* }, { i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  br label %entry

entry:                                            ; preds = %prologue
  %4 = bitcast i8* %3 to i8**
  %5 = load i8*, i8** %4
  %6 = bitcast i8* %5 to void (i8*)*
  call void %6(i8* nest %3)
  ret void
}

define internal void @"main.main:main.main$2"(i8* nest) #2 {
prologue:
  %1 = alloca { i8*, i64 }
  %2 = bitcast i8* %0 to { i8*, i8* }*
  %3 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %2, i32 0, i32 1
  %4 = load i8*, i8** %3
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @time.Sleep(i8* nest undef, i64 2000000000)
  %5 = icmp eq i8* %4, null
  br i1 %5, label %6, label %7, !prof !0

; <label>:6:                                      ; preds = %.0.entry
  call void @__go_runtime_error(i8* nest undef, i32 6)
  unreachable

; <label>:7:                                      ; preds = %.0.entry
  %8 = bitcast i8* %4 to i8**
  %9 = load i8*, i8** %8
  store { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @4, i32 0, i32 0), i64 3 }, { i8*, i64 }* %1
  %10 = bitcast { i8*, i64 }* %1 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN6_stringsre, i32 0, i32 0, i32 0), i8* %9, i8* %10)
  ret void
}

define internal void @37(i8*) #2 {
prologue:
  %1 = bitcast i8* %0 to { i8* }*
  %2 = getelementptr inbounds { i8* }, { i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  br label %entry

entry:                                            ; preds = %prologue
  %4 = bitcast i8* %3 to i8**
  %5 = load i8*, i8** %4
  %6 = bitcast i8* %5 to void (i8*)*
  call void %6(i8* nest %3)
  ret void
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

declare void @time.Sleep(i8* nest, i64)

define linkonce_odr i64 @__go_type_hash_AIe2e(i8*, i64) {
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
  %11 = icmp eq i64 %10, 2
  br i1 %11, label %exit, label %loop

exit:                                             ; preds = %loop
  ret i64 %9
}

define linkonce_odr i8 @__go_type_hash_AIe2e.1(i8*, i8*, i64) {
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
  %13 = icmp eq i64 %12, 2
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
