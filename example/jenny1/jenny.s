; ModuleID = 'main'
; TODO(growly): Does commenting this out break anything?; source_filename = "main"
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
@__go_type_hash_identity_descriptor = external global %funcVal
@__go_type_equal_identity_descriptor = external global %funcVal
@__go_type_hash_error_descriptor = external global %funcVal
@__go_type_equal_error_descriptor = external global %funcVal
@"main..import$descriptor" = constant i8* bitcast (void (i8*)* @main..import to i8*)
@"init$guard" = internal global i1 false
@"main.main$descriptor" = constant i8* bitcast (void (i8*)* @main.main to i8*)
@__go_td_CN3_intsre = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 1610653383, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN3_intsre$gc" to i8*), { i8*, i64 }* @3, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int, i64 3 }
@__go_td_S1__Fe1__pCN3_intsree = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 16, i32 2601520, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([7 x i8*]* @"__go_td_S1__Fe1__pCN3_intsree$gc" to i8*), { i8*, i64 }* @10, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS1__Fe1__pCN3_intsree, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([2 x %structField], [2 x %structField]* @15, i32 0, i32 0), i64 2, i64 2 } }
@__go_td_S0_Fee = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 8, i32 44, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([4 x i8*]* @"__go_td_S0_Fee$gc" to i8*), { i8*, i64 }* @17, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS0_Fee, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([1 x %structField], [1 x %structField]* @18, i32 0, i32 0), i64 1, i64 1 } }
@__go_td_AIe1e = linkonce_odr constant %arrayType { %commonType { i8 17, i8 8, i8 8, i64 16, i32 30, %funcVal* @__go_type_hash_AIe1e_descriptor, %funcVal* @__go_type_hash_AIe1e_descriptor.2, i8* bitcast ([9 x i8*]* @"__go_td_AIe1e$gc" to i8*), { i8*, i64 }* @1, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0), %commonType* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AIee, i32 0, i32 0), i64 1 }
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @5, %uncommonType* @8, %commonType* null }
@__go_type_hash_AIe1e_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_AIe1e to void ()*) }
@__go_type_hash_AIe1e_descriptor.2 = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_hash_AIe1e.1 to void ()*) }
@0 = internal constant [15 x i8] c"[1]interface {}"
@1 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @0, i32 0, i32 0), i64 15 }
@__go_td_Ie = linkonce_odr constant %interfaceType { %commonType { i8 20, i8 8, i8 8, i64 16, i32 16, %funcVal* @__go_type_hash_empty_interface_descriptor, %funcVal* @__go_type_equal_empty_interface_descriptor, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), { i8*, i64 }* @30, %uncommonType* null, %commonType* null }, %imethodSlice zeroinitializer }
@__go_td_AIee = linkonce_odr constant %sliceType { %commonType { i8 23, i8 8, i8 8, i64 24, i32 30, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_AIee$gc" to i8*), { i8*, i64 }* @26, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0) }
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
@9 = internal constant [32 x i8] c"struct { _ func(); _ *chan int }"
@10 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([32 x i8], [32 x i8]* @9, i32 0, i32 0), i64 32 }
@__go_td_pS1__Fe1__pCN3_intsree = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 41624329, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS1__Fe1__pCN3_intsree$gc" to i8*), { i8*, i64 }* @22, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S1__Fe1__pCN3_intsree, i32 0, i32 0) }
@11 = internal constant [1 x i8] c"_"
@12 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @11, i32 0, i32 0), i64 1 }
@__go_td_Fe = linkonce_odr constant %funcType { %commonType { i8 19, i8 8, i8 8, i64 8, i32 8, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([4 x i8*]* @"__go_td_Fe$gc" to i8*), { i8*, i64 }* @28, %uncommonType* null, %commonType* null }, i8 0, %typeSlice zeroinitializer, %typeSlice zeroinitializer }
@13 = internal constant [1 x i8] c"_"
@14 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @13, i32 0, i32 0), i64 1 }
@__go_td_pCN3_intsre = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 650361, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pCN3_intsre$gc" to i8*), { i8*, i64 }* @20, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0) }
@15 = internal constant [2 x %structField] [%structField { { i8*, i64 }* @12, { i8*, i64 }* null, %commonType* getelementptr inbounds (%funcType, %funcType* @__go_td_Fe, i32 0, i32 0), { i8*, i64 }* null, i64 0 }, %structField { { i8*, i64 }* @14, { i8*, i64 }* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pCN3_intsre, i32 0, i32 0), { i8*, i64 }* null, i64 8 }]
@"__go_td_S1__Fe1__pCN3_intsree$gc" = linkonce_odr constant [7 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 2 to i8*), i8* null, i8* inttoptr (i64 1 to i8*), i8* inttoptr (i64 8 to i8*), i8* bitcast ([5 x i8*]* @"__go_td_CN3_intsre$gc" to i8*), i8* null]
@16 = internal constant [17 x i8] c"struct { func() }"
@17 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @16, i32 0, i32 0), i64 17 }
@__go_td_pS0_Fee = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 713, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS0_Fee$gc" to i8*), { i8*, i64 }* @24, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S0_Fee, i32 0, i32 0) }
@18 = internal constant [1 x %structField] [%structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%funcType, %funcType* @__go_td_Fe, i32 0, i32 0), { i8*, i64 }* null, i64 0 }]
@"__go_td_S0_Fee$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 2 to i8*), i8* null, i8* null]
@19 = internal constant [9 x i8] c"*chan int"
@20 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @19, i32 0, i32 0), i64 9 }
@"__go_td_pCN3_intsre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([5 x i8*]* @"__go_td_CN3_intsre$gc" to i8*), i8* null]
@21 = internal constant [33 x i8] c"*struct { _ func(); _ *chan int }"
@22 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([33 x i8], [33 x i8]* @21, i32 0, i32 0), i64 33 }
@"__go_td_pS1__Fe1__pCN3_intsree$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([7 x i8*]* @"__go_td_S1__Fe1__pCN3_intsree$gc" to i8*), i8* null]
@23 = internal constant [18 x i8] c"*struct { func() }"
@24 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @23, i32 0, i32 0), i64 18 }
@"__go_td_pS0_Fee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([4 x i8*]* @"__go_td_S0_Fee$gc" to i8*), i8* null]
@25 = internal constant [14 x i8] c"[]interface {}"
@26 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @25, i32 0, i32 0), i64 14 }
@"__go_td_AIee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 10 to i8*), i8* null, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), i8* null]
@27 = internal constant [6 x i8] c"func()"
@28 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @27, i32 0, i32 0), i64 6 }
@"__go_td_Fe$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 2 to i8*), i8* null, i8* null]
@29 = internal constant [12 x i8] c"interface {}"
@30 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @29, i32 0, i32 0), i64 12 }
@"__go_td_Ie$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* null]

declare void @__go_go(i8* nest, i8*, i8*)

; Function Attrs: nounwind
declare i8* @__go_new(i8* nest, i8*, i64) #0

declare i8* @fifo_malloc(i8 zeroext, i64)

declare i64 @fifo_read(i8*)

; Function Attrs: noreturn
declare void @__go_runtime_error(i8* nest, i32) #1

declare void @fifo_write(i8*, i64)

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
  call void @fmt..import(i8* undef)
  br label %.0.entry
}

declare void @fmt..import(i8*)

define void @main.main(i8* nest) #2 {
prologue:
  %1 = alloca i64
  %2 = alloca { i8*, i64, i64 }
  %3 = alloca { i64, { i8*, i8* } }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %4 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 8)
  %messages = bitcast i8* %4 to i8**
  %5 = bitcast i8** %messages to i8*
  %6 = call i8* @fifo_malloc(i8 zeroext 8, i64 0)
  %7 = bitcast i8* %5 to i8**
  store i8* %6, i8** %7
  %8 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S1__Fe1__pCN3_intsree, i32 0, i32 0, i32 0), i64 16)
  %9 = bitcast i8* %8 to { i8*, i8* }*
  %10 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %9, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$1" to i8*), i8** %10
  %11 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %9, i32 0, i32 1
  store i8* %5, i8** %11
  %12 = bitcast { i8*, i8* }* %9 to i8*
  %13 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_Fee, i32 0, i32 0, i32 0), i64 8)
  %14 = bitcast i8* %13 to { i8* }*
  %15 = getelementptr inbounds { i8* }, { i8* }* %14, i32 0, i32 0
  store i8* %12, i8** %15
  %16 = bitcast { i8* }* %14 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @31 to i8*), i8* %16)
  %17 = bitcast i8* %5 to i8**
  %18 = load i8*, i8** %17
  %19 = call i64 @fifo_read(i8* %18)
  store i64 %19, i64* %1
  %20 = load i64, i64* %1
  %21 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe1e, i32 0, i32 0, i32 0), i64 16)
  %varargs = bitcast i8* %21 to [1 x { i8*, i8* }]*
  %22 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %23 = bitcast i8* %22 to { i8*, i8* }*
  %24 = getelementptr { i8*, i8* }, { i8*, i8* }* %23, i64 0
  %25 = bitcast { i8*, i8* }* %24 to i8*
  %26 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %27 = bitcast i8* %26 to i64*
  store i64 %20, i64* %27
  %28 = bitcast i64* %27 to i8*
  %29 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %28, 1
  %30 = bitcast i8* %25 to { i8*, i8* }*
  store { i8*, i8* } %29, { i8*, i8* }* %30
  %31 = getelementptr inbounds i8, i8* %22, i64 0
  %32 = insertvalue { i8*, i64, i64 } undef, i8* %31, 0
  %33 = insertvalue { i8*, i64, i64 } %32, i64 1, 1
  %34 = insertvalue { i8*, i64, i64 } %33, i64 1, 2
  store { i8*, i64, i64 } %34, { i8*, i64, i64 }* %2
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %3, i8* nest undef, { i8*, i64, i64 }* byval %2)
  %35 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %3, i32 0, i32 0
  %36 = load i64, i64* %35
  %37 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %3, i32 0, i32 1
  %38 = load { i8*, i8* }, { i8*, i8* }* %37
  ret void
}

define internal void @"main.main:main.main$1"(i8* nest) #2 {
prologue:
  %1 = alloca i64
  %2 = alloca i8*
  %3 = bitcast i8* %0 to { i8*, i8* }*
  %4 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %3, i32 0, i32 1
  %5 = load i8*, i8** %4
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %6 = icmp eq i8* %5, null
  br i1 %6, label %7, label %8, !prof !0

; <label>:7:                                      ; preds = %.0.entry
  call void @__go_runtime_error(i8* nest undef, i32 6)
  unreachable

; <label>:8:                                      ; preds = %.0.entry
  %9 = bitcast i8* %5 to i8**
  %10 = load i8*, i8** %9
  store i64 7, i64* %1
  %11 = bitcast i64* %1 to i8*
  %12 = bitcast i8** %2 to i64*
  store i8* %11, i8** %2
  %13 = load i64, i64* %12
  call void @fifo_write(i8* %10, i64 %13)
  ret void
}

define internal void @31(i8*) #2 {
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

define void @__go_init_main(i8*) #2 {
entry:
  call void @main..import(i8* undef)
  ret void
}

attributes #0 = { nounwind }
attributes #1 = { noreturn }
attributes #2 = { "disable-tail-calls"="true" "split-stack" }

!0 = !{!"branch_weights", i32 1, i32 1000}
