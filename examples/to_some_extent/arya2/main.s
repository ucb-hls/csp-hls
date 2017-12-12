; ModuleID = 'main'
; TODO(growly): Does commenting this out break anything?; source_filename = "main"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%funcVal = type { void ()* }
%structType = type { %commonType, %structFieldSlice }
%commonType = type { i8, i8, i8, i64, i32, %funcVal*, %funcVal*, i8*, { i8*, i64 }*, %uncommonType*, %commonType* }
%uncommonType = type { { i8*, i64 }*, { i8*, i64 }*, %methodSlice }
%methodSlice = type { %method*, i64, i64 }
%method = type { { i8*, i64 }*, { i8*, i64 }*, %commonType*, %commonType*, i8* }
%structFieldSlice = type { %structField*, i64, i64 }
%structField = type { { i8*, i64 }*, { i8*, i64 }*, %commonType*, { i8*, i64 }*, i64 }
%chanType = type { %commonType, %commonType*, i64 }
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
@__go_tdn_main.Bogus = constant %structType { %commonType { i8 -103, i8 8, i8 8, i64 8, i32 150998671, %funcVal* @__go_type_hash_S5_fieldN3_inte_descriptor, %funcVal* @__go_type_equal_S5_fieldN3_inte_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_main.Bogus$gc" to i8*), { i8*, i64 }* @13, %uncommonType* @18, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pN10_main.Bogus, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([1 x %structField], [1 x %structField]* @23, i32 0, i32 0), i64 1, i64 1 } }
@__go_td_CN10_main.Bogussre = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 536990215, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN10_main.Bogussre$gc" to i8*), { i8*, i64 }* @6, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_tdn_main.Bogus, i32 0, i32 0), i64 3 }
@__go_td_AIe3e = linkonce_odr constant %arrayType { %commonType { i8 17, i8 8, i8 8, i64 48, i32 30, %funcVal* @__go_type_hash_AIe3e_descriptor, %funcVal* @__go_type_hash_AIe3e_descriptor.2, i8* bitcast ([9 x i8*]* @"__go_td_AIe3e$gc" to i8*), { i8*, i64 }* @4, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0), %commonType* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AIee, i32 0, i32 0), i64 3 }
@__go_tdn_string = linkonce_odr constant %commonType { i8 24, i8 8, i8 8, i64 16, i32 100666096, %funcVal* @__go_type_hash_string_descriptor, %funcVal* @__go_type_equal_string_descriptor, i8* bitcast ([4 x i8*]* @"__go_tdn_string$gc" to i8*), { i8*, i64 }* @25, %uncommonType* @28, %commonType* null }
@0 = internal global [3 x i8] c"got"
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @8, %uncommonType* @11, %commonType* null }
@"main..import$descriptor" = constant i8* bitcast (void (i8*)* @main..import to i8*)
@"init$guard" = internal global i1 false
@"main.main$descriptor" = constant i8* bitcast (void (i8*)* @main.main to i8*)
@__go_td_S0_CN10_main.Bogussree = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 8, i32 -2147006424, %funcVal* @__go_type_hash_S0_CN10_main.Bogussree_descriptor, %funcVal* @__go_type_equal_S0_CN10_main.Bogussree_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_S0_CN10_main.Bogussree$gc" to i8*), { i8*, i64 }* @30, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS0_CN10_main.Bogussree, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([1 x %structField], [1 x %structField]* @31, i32 0, i32 0), i64 1, i64 1 } }
@1 = internal global [5 x i8] c"steve"
@2 = internal global [4 x i8] c"jane"
@__go_type_hash_AIe3e_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_AIe3e to void ()*) }
@__go_type_hash_AIe3e_descriptor.2 = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_hash_AIe3e.1 to void ()*) }
@3 = internal constant [15 x i8] c"[3]interface {}"
@4 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @3, i32 0, i32 0), i64 15 }
@__go_td_Ie = linkonce_odr constant %interfaceType { %commonType { i8 20, i8 8, i8 8, i64 16, i32 16, %funcVal* @__go_type_hash_empty_interface_descriptor, %funcVal* @__go_type_equal_empty_interface_descriptor, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), { i8*, i64 }* @39, %uncommonType* null, %commonType* null }, %imethodSlice zeroinitializer }
@__go_td_AIee = linkonce_odr constant %sliceType { %commonType { i8 23, i8 8, i8 8, i64 24, i32 30, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_AIee$gc" to i8*), { i8*, i64 }* @37, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0) }
@"__go_td_AIe3e$gc" = linkonce_odr constant [9 x i8*] [i8* inttoptr (i64 48 to i8*), i8* inttoptr (i64 3 to i8*), i8* null, i8* inttoptr (i64 3 to i8*), i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* inttoptr (i64 4 to i8*), i8* null]
@5 = internal constant [21 x i8] c"chan \09main\09main.Bogus"
@6 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @5, i32 0, i32 0), i64 21 }
@"__go_td_CN10_main.Bogussre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN10_main.Bogussre, i32 0, i32 0, i32 0), i8* null]
@7 = internal constant [3 x i8] c"int"
@8 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @7, i32 0, i32 0), i64 3 }
@9 = internal constant [3 x i8] c"int"
@10 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @9, i32 0, i32 0), i64 3 }
@11 = internal constant %uncommonType { { i8*, i64 }* @10, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]
@__go_type_hash_S5_fieldN3_inte_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_S5_fieldN3_inte to void ()*) }
@__go_type_equal_S5_fieldN3_inte_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_equal_S5_fieldN3_inte to void ()*) }
@12 = internal constant [16 x i8] c"\09main\09main.Bogus"
@13 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @12, i32 0, i32 0), i64 16 }
@14 = internal constant [5 x i8] c"Bogus"
@15 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i64 5 }
@16 = internal constant [4 x i8] c"main"
@17 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @16, i32 0, i32 0), i64 4 }
@18 = internal constant %uncommonType { { i8*, i64 }* @15, { i8*, i64 }* @17, %methodSlice zeroinitializer }
@__go_td_pN10_main.Bogus = constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 -1878988551, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pN10_main.Bogus$gc" to i8*), { i8*, i64 }* @33, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_tdn_main.Bogus, i32 0, i32 0) }
@19 = internal constant [5 x i8] c"field"
@20 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @19, i32 0, i32 0), i64 5 }
@21 = internal constant [4 x i8] c"main"
@22 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @21, i32 0, i32 0), i64 4 }
@23 = internal constant [1 x %structField] [%structField { { i8*, i64 }* @20, { i8*, i64 }* @22, %commonType* @__go_tdn_int, { i8*, i64 }* null, i64 0 }]
@"__go_tdn_main.Bogus$gc" = constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]
@24 = internal constant [6 x i8] c"string"
@25 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @24, i32 0, i32 0), i64 6 }
@26 = internal constant [6 x i8] c"string"
@27 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @26, i32 0, i32 0), i64 6 }
@28 = internal constant %uncommonType { { i8*, i64 }* @27, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_string$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 7 to i8*), i8* null, i8* null]
@__go_type_hash_S0_CN10_main.Bogussree_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_S0_CN10_main.Bogussree to void ()*) }
@__go_type_equal_S0_CN10_main.Bogussree_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_equal_S0_CN10_main.Bogussree to void ()*) }
@29 = internal constant [32 x i8] c"struct { chan \09main\09main.Bogus }"
@30 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([32 x i8], [32 x i8]* @29, i32 0, i32 0), i64 32 }
@__go_td_pS0_CN10_main.Bogussree = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 7635593, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS0_CN10_main.Bogussree$gc" to i8*), { i8*, i64 }* @35, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN10_main.Bogussree, i32 0, i32 0) }
@31 = internal constant [1 x %structField] [%structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN10_main.Bogussre, i32 0, i32 0), { i8*, i64 }* null, i64 0 }]
@"__go_td_S0_CN10_main.Bogussree$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN10_main.Bogussre, i32 0, i32 0, i32 0), i8* null]
@32 = internal constant [17 x i8] c"*\09main\09main.Bogus"
@33 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @32, i32 0, i32 0), i64 17 }
@"__go_td_pN10_main.Bogus$gc" = constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([2 x i8*]* @"__go_tdn_main.Bogus$gc" to i8*), i8* null]
@34 = internal constant [33 x i8] c"*struct { chan \09main\09main.Bogus }"
@35 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([33 x i8], [33 x i8]* @34, i32 0, i32 0), i64 33 }
@"__go_td_pS0_CN10_main.Bogussree$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([5 x i8*]* @"__go_td_S0_CN10_main.Bogussree$gc" to i8*), i8* null]
@36 = internal constant [14 x i8] c"[]interface {}"
@37 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @36, i32 0, i32 0), i64 14 }
@"__go_td_AIee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 10 to i8*), i8* null, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), i8* null]
@38 = internal constant [12 x i8] c"interface {}"
@39 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @38, i32 0, i32 0), i64 12 }
@"__go_td_Ie$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* null]

declare void @__go_go(i8* nest, i8*, i8*)

; Function Attrs: nounwind
declare i8* @__go_new(i8* nest, i8*, i64) #0

declare i8* @fifo_malloc(i8 zeroext, i64)

declare void @__go_receive(i8* nest, i8*, i8*, i8*)

declare i64 @fifo_read(i8*)

declare void @fifo_write(i8*, i64)

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

declare i64 @__go_type_hash_empty_interface(i8*, i64)

declare i8 @__go_type_equal_empty_interface(i8*, i8*, i64)

declare i64 @__go_type_hash_identity(i8*, i64)

declare i8 @__go_type_equal_identity(i8*, i8*, i64)

define internal void @main.consumer(i8* nest, i8*, i64, i8*) #2 {
prologue:
  %4 = alloca { i64 }
  %5 = alloca { i64 }
  %6 = alloca { i8*, i64, i64 }
  %7 = alloca { i64, { i8*, i8* } }
  %8 = alloca { i8*, i64 }
  %9 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %8, i32 0, i32 0
  store i8* %1, i8** %9
  %10 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %8, i32 0, i32 1
  store i64 %2, i64* %10
  %11 = load { i8*, i64 }, { i8*, i64 }* %8
  %b = alloca { i64 }
  %12 = bitcast { i64 }* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* %12, i8 0, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i1 false)
  %13 = bitcast { i64 }* %b to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i1 false)
  %14 = call i64 @fifo_read(i8* %3)
  %15 = bitcast { i64 }* %5 to i8*
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN10_main.Bogussre, i32 0, i32 0, i32 0), i8* %3, i8* %15)
  %16 = load { i64 }, { i64 }* %5
  %17 = bitcast i8* %13 to { i64 }*
  store { i64 } %16, { i64 }* %17
  %18 = bitcast i8* %13 to { i64 }*
  %t2 = getelementptr inbounds { i64 }, { i64 }* %18, i32 0, i32 0
  %19 = bitcast i64* %t2 to i8*
  %20 = bitcast i8* %19 to i64*
  %21 = load i64, i64* %20
  %22 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe3e, i32 0, i32 0, i32 0), i64 48)
  %varargs = bitcast i8* %22 to [3 x { i8*, i8* }]*
  %23 = bitcast [3 x { i8*, i8* }]* %varargs to i8*
  %24 = bitcast i8* %23 to { i8*, i8* }*
  %25 = getelementptr { i8*, i8* }, { i8*, i8* }* %24, i64 0
  %26 = bitcast { i8*, i8* }* %25 to i8*
  %27 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %28 = bitcast i8* %27 to { i8*, i64 }*
  store { i8*, i64 } %11, { i8*, i64 }* %28
  %29 = bitcast { i8*, i64 }* %28 to i8*
  %30 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %29, 1
  %31 = bitcast i8* %26 to { i8*, i8* }*
  store { i8*, i8* } %30, { i8*, i8* }* %31
  %32 = bitcast i8* %23 to { i8*, i8* }*
  %33 = getelementptr { i8*, i8* }, { i8*, i8* }* %32, i64 1
  %34 = bitcast { i8*, i8* }* %33 to i8*
  %35 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %36 = bitcast i8* %35 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0), i64 3 }, { i8*, i64 }* %36
  %37 = bitcast { i8*, i64 }* %36 to i8*
  %38 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %37, 1
  %39 = bitcast i8* %34 to { i8*, i8* }*
  store { i8*, i8* } %38, { i8*, i8* }* %39
  %40 = bitcast i8* %23 to { i8*, i8* }*
  %41 = getelementptr { i8*, i8* }, { i8*, i8* }* %40, i64 2
  %42 = bitcast { i8*, i8* }* %41 to i8*
  %43 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %44 = bitcast i8* %43 to i64*
  store i64 %21, i64* %44
  %45 = bitcast i64* %44 to i8*
  %46 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %45, 1
  %47 = bitcast i8* %42 to { i8*, i8* }*
  store { i8*, i8* } %46, { i8*, i8* }* %47
  %48 = getelementptr inbounds i8, i8* %23, i64 0
  %49 = insertvalue { i8*, i64, i64 } undef, i8* %48, 0
  %50 = insertvalue { i8*, i64, i64 } %49, i64 3, 1
  %51 = insertvalue { i8*, i64, i64 } %50, i64 3, 2
  store { i8*, i64, i64 } %51, { i8*, i64, i64 }* %6
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %7, i8* nest undef, { i8*, i64, i64 }* byval %6)
  %52 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %7, i32 0, i32 0
  %53 = load i64, i64* %52
  %54 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %7, i32 0, i32 1
  %55 = load { i8*, i8* }, { i8*, i8* }* %54
  ret void
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

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
  call void @time..import(i8* undef)
  br label %.0.entry
}

declare void @fmt..import(i8*)

declare void @time..import(i8*)

define void @main.main(i8* nest) #2 {
prologue:
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %1 = call i8* @fifo_malloc(i8 zeroext 8, i64 0)
  %2 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN10_main.Bogussree, i32 0, i32 0, i32 0), i64 8)
  %3 = bitcast i8* %2 to { i8* }*
  %4 = getelementptr inbounds { i8* }, { i8* }* %3, i32 0, i32 0
  store i8* %1, i8** %4
  %5 = bitcast { i8* }* %3 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @40 to i8*), i8* %5)
  %6 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN10_main.Bogussree, i32 0, i32 0, i32 0), i64 8)
  %7 = bitcast i8* %6 to { i8* }*
  %8 = getelementptr inbounds { i8* }, { i8* }* %7, i32 0, i32 0
  store i8* %1, i8** %8
  %9 = bitcast { i8* }* %7 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @41 to i8*), i8* %9)
  %10 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN10_main.Bogussree, i32 0, i32 0, i32 0), i64 8)
  %11 = bitcast i8* %10 to { i8* }*
  %12 = getelementptr inbounds { i8* }, { i8* }* %11, i32 0, i32 0
  store i8* %1, i8** %12
  %13 = bitcast { i8* }* %11 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @42 to i8*), i8* %13)
  call void @time.Sleep(i8* nest undef, i64 50000000)
  ret void
}

define internal void @40(i8*) #2 {
prologue:
  %1 = bitcast i8* %0 to { i8* }*
  %2 = getelementptr inbounds { i8* }, { i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  %4 = alloca { i8*, i64 }
  br label %entry

entry:                                            ; preds = %prologue
  store { i8*, i64 } { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @1, i32 0, i32 0), i64 5 }, { i8*, i64 }* %4
  %5 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %4, i32 0, i32 0
  %6 = load i8*, i8** %5
  %7 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %4, i32 0, i32 1
  %8 = load i64, i64* %7
  call void @main.consumer(i8* nest undef, i8* %6, i64 %8, i8* %3)
  ret void
}

define internal void @41(i8*) #2 {
prologue:
  %1 = bitcast i8* %0 to { i8* }*
  %2 = getelementptr inbounds { i8* }, { i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  %4 = alloca { i8*, i64 }
  br label %entry

entry:                                            ; preds = %prologue
  store { i8*, i64 } { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @2, i32 0, i32 0), i64 4 }, { i8*, i64 }* %4
  %5 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %4, i32 0, i32 0
  %6 = load i8*, i8** %5
  %7 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %4, i32 0, i32 1
  %8 = load i64, i64* %7
  call void @main.consumer(i8* nest undef, i8* %6, i64 %8, i8* %3)
  ret void
}

define internal void @42(i8*) #2 {
prologue:
  %1 = bitcast i8* %0 to { i8* }*
  %2 = getelementptr inbounds { i8* }, { i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.producer(i8* nest undef, i8* %3)
  ret void
}

define internal void @main.producer(i8* nest, i8*) #2 {
prologue:
  %2 = alloca { i64 }
  %3 = alloca i8*
  %b = alloca { i64 }
  %4 = bitcast { i64 }* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i1 false)
  %5 = bitcast { i64 }* %b to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.1.for.body

.1.for.body:                                      ; preds = %.1.for.body, %.0.entry
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i32 1, i1 false)
  %6 = bitcast i8* %5 to { i64 }*
  %t1 = getelementptr inbounds { i64 }, { i64 }* %6, i32 0, i32 0
  %7 = bitcast i64* %t1 to i8*
  %8 = bitcast i8* %7 to i64*
  store i64 2, i64* %8
  %9 = bitcast i8* %5 to { i64 }*
  %10 = load { i64 }, { i64 }* %9
  store { i64 } %10, { i64 }* %2
  %11 = bitcast { i64 }* %2 to i8*
  %12 = bitcast i8** %3 to i64*
  store i8* %11, i8** %3
  %13 = load i64, i64* %12
  call void @fifo_write(i8* %1, i64 %13)
  br label %.1.for.body
}

declare void @time.Sleep(i8* nest, i64)

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

define linkonce_odr i64 @__go_type_hash_S5_fieldN3_inte(i8*, i64) {
entry:
  %2 = bitcast i8* %0 to { i64 }*
  %3 = getelementptr inbounds { i64 }, { i64 }* %2, i32 0, i32 0
  %4 = bitcast i64* %3 to i8*
  %5 = call i64 @__go_type_hash_identity(i8* %4, i64 8)
  %6 = add i64 0, %5
  ret i64 %6
}

define linkonce_odr i8 @__go_type_equal_S5_fieldN3_inte(i8*, i8*, i64) {
entry:
  %3 = bitcast i8* %0 to { i64 }*
  %4 = bitcast i8* %1 to { i64 }*
  %5 = getelementptr inbounds { i64 }, { i64 }* %3, i32 0, i32 0
  %6 = bitcast i64* %5 to i8*
  %7 = getelementptr inbounds { i64 }, { i64 }* %4, i32 0, i32 0
  %8 = bitcast i64* %7 to i8*
  %9 = call i8 @__go_type_equal_identity(i8* %6, i8* %8, i64 8)
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %retzero, label %cont

retzero:                                          ; preds = %entry
  ret i8 0

cont:                                             ; preds = %entry
  ret i8 1
}

define linkonce_odr i64 @__go_type_hash_S0_CN10_main.Bogussree(i8*, i64) {
entry:
  %2 = bitcast i8* %0 to { i8* }*
  %3 = getelementptr inbounds { i8* }, { i8* }* %2, i32 0, i32 0
  %4 = bitcast i8** %3 to i8*
  %5 = call i64 @__go_type_hash_identity(i8* %4, i64 8)
  %6 = add i64 0, %5
  ret i64 %6
}

define linkonce_odr i8 @__go_type_equal_S0_CN10_main.Bogussree(i8*, i8*, i64) {
entry:
  %3 = bitcast i8* %0 to { i8* }*
  %4 = bitcast i8* %1 to { i8* }*
  %5 = getelementptr inbounds { i8* }, { i8* }* %3, i32 0, i32 0
  %6 = bitcast i8** %5 to i8*
  %7 = getelementptr inbounds { i8* }, { i8* }* %4, i32 0, i32 0
  %8 = bitcast i8** %7 to i8*
  %9 = call i8 @__go_type_equal_identity(i8* %6, i8* %8, i64 8)
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %retzero, label %cont

retzero:                                          ; preds = %entry
  ret i8 0

cont:                                             ; preds = %entry
  ret i8 1
}

define void @__go_init_main(i8*) #2 {
entry:
  call void @main..import(i8* undef)
  ret void
}

attributes #0 = { nounwind }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "disable-tail-calls"="true" "split-stack" }
