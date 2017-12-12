; ModuleID = 'main'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%funcVal = type { void ()* }
%commonType = type { i8, i8, i8, i64, i32, %funcVal*, %funcVal*, i8*, { i8*, i64 }*, %uncommonType*, %commonType* }
%uncommonType = type { { i8*, i64 }*, { i8*, i64 }*, %methodSlice }
%methodSlice = type { %method*, i64, i64 }
%method = type { { i8*, i64 }*, { i8*, i64 }*, %commonType*, %commonType*, i8* }
%arrayType = type { %commonType, %commonType*, %commonType*, i64 }
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
@__go_type_hash_string_descriptor = external global %funcVal
@__go_type_equal_string_descriptor = external global %funcVal
@__go_type_hash_identity_descriptor = external global %funcVal
@__go_type_equal_identity_descriptor = external global %funcVal
@__go_type_hash_error_descriptor = external global %funcVal
@__go_type_equal_error_descriptor = external global %funcVal
@0 = internal global [31 x i8] c"blocking select matched no case"
@__go_tdn_string = linkonce_odr constant %commonType { i8 24, i8 8, i8 8, i64 16, i32 100666096, %funcVal* @__go_type_hash_string_descriptor, %funcVal* @__go_type_equal_string_descriptor, i8* bitcast ([4 x i8*]* @"__go_tdn_string$gc" to i8*), { i8*, i64 }* @18, %uncommonType* @21, %commonType* null }
@__go_td_AIe1e = linkonce_odr constant %arrayType { %commonType { i8 17, i8 8, i8 8, i64 16, i32 30, %funcVal* @__go_type_hash_AIe1e_descriptor, %funcVal* @__go_type_hash_AIe1e_descriptor.2, i8* bitcast ([9 x i8*]* @"__go_td_AIe1e$gc" to i8*), { i8*, i64 }* @7, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0), %commonType* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AIee, i32 0, i32 0), i64 1 }
@1 = internal global [4 x i8] c"quit"
@2 = internal global [31 x i8] c"blocking select matched no case"
@"main..import$descriptor" = constant i8* bitcast (void (i8*)* @main..import to i8*)
@"init$guard" = internal global i1 false
@"main.main$descriptor" = constant i8* bitcast (void (i8*)* @main.main to i8*)
@__go_td_CN4_boolsre = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 -2147431481, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN4_boolsre$gc" to i8*), { i8*, i64 }* @9, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_bool, i64 3 }

@__go_td_CN3_intsre = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 1610653383, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN3_intsre$gc" to i8*), { i8*, i64 }* @11, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int, i64 3 }

@__go_td_S0_CN3_intsre0_CN4_boolsree = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 16, i32 533856, %funcVal* @__go_type_hash_S0_CN3_intsre0_CN4_boolsree_descriptor, %funcVal* @__go_type_equal_S0_CN3_intsre0_CN4_boolsree_descriptor, i8* bitcast ([8 x i8*]* @"__go_td_S0_CN3_intsre0_CN4_boolsree$gc" to i8*), { i8*, i64 }* @23, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS0_CN3_intsre0_CN4_boolsree, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([2 x %structField], [2 x %structField]* @24, i32 0, i32 0), i64 2, i64 2 } }

@__go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 24, i32 1184208, %funcVal* @__go_type_hash_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree_descriptor, %funcVal* @__go_type_equal_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree_descriptor, i8* bitcast ([11 x i8*]* @"__go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree$gc" to i8*), { i8*, i64 }* @26, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS0_CN3_intsre0_CN3_intsre0_CN4_boolsree, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([3 x %structField], [3 x %structField]* @27, i32 0, i32 0), i64 3, i64 3 } }

@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @13, %uncommonType* @16, %commonType* null }

@3 = internal global [13 x i8] c"producer quit"
@4 = internal global [17 x i8] c"producer produced"
@5 = internal global [31 x i8] c"blocking select matched no case"
@__go_type_hash_AIe1e_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_AIe1e to void ()*) }
@__go_type_hash_AIe1e_descriptor.2 = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_hash_AIe1e.1 to void ()*) }
@6 = internal constant [15 x i8] c"[1]interface {}"
@7 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @6, i32 0, i32 0), i64 15 }
@__go_td_Ie = linkonce_odr constant %interfaceType { %commonType { i8 20, i8 8, i8 8, i64 16, i32 16, %funcVal* @__go_type_hash_empty_interface_descriptor, %funcVal* @__go_type_equal_empty_interface_descriptor, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), { i8*, i64 }* @40, %uncommonType* null, %commonType* null }, %imethodSlice zeroinitializer }
@__go_td_AIee = linkonce_odr constant %sliceType { %commonType { i8 23, i8 8, i8 8, i64 24, i32 30, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_AIee$gc" to i8*), { i8*, i64 }* @33, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0) }
@"__go_td_AIe1e$gc" = linkonce_odr constant [9 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 3 to i8*), i8* null, i8* inttoptr (i64 1 to i8*), i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* inttoptr (i64 4 to i8*), i8* null]
@8 = internal constant [9 x i8] c"chan bool"
@9 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @8, i32 0, i32 0), i64 9 }
@__go_tdn_bool = linkonce_odr constant %commonType { i8 -127, i8 1, i8 1, i64 1, i32 67110493, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_bool$gc" to i8*), { i8*, i64 }* @35, %uncommonType* @38, %commonType* null }
@"__go_td_CN4_boolsre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN4_boolsre, i32 0, i32 0, i32 0), i8* null]
@10 = internal constant [8 x i8] c"chan int"
@11 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @10, i32 0, i32 0), i64 8 }
@"__go_td_CN3_intsre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* null]
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
@__go_type_hash_S0_CN3_intsre0_CN4_boolsree_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_S0_CN3_intsre0_CN4_boolsree to void ()*) }
@__go_type_equal_S0_CN3_intsre0_CN4_boolsree_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_equal_S0_CN3_intsre0_CN4_boolsree to void ()*) }
@22 = internal constant [30 x i8] c"struct { chan int; chan bool }"
@23 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([30 x i8], [30 x i8]* @22, i32 0, i32 0), i64 30 }
@__go_td_pS0_CN3_intsre0_CN4_boolsree = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 8541705, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS0_CN3_intsre0_CN4_boolsree$gc" to i8*), { i8*, i64 }* @29, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsre0_CN4_boolsree, i32 0, i32 0) }
@24 = internal constant [2 x %structField] [%structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0), { i8*, i64 }* null, i64 0 }, %structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN4_boolsre, i32 0, i32 0), { i8*, i64 }* null, i64 8 }]
@"__go_td_S0_CN3_intsre0_CN4_boolsree$gc" = linkonce_odr constant [8 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* inttoptr (i64 6 to i8*), i8* inttoptr (i64 8 to i8*), i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN4_boolsre, i32 0, i32 0, i32 0), i8* null]
@__go_type_hash_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree to void ()*) }
@__go_type_equal_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_equal_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree to void ()*) }
@25 = internal constant [40 x i8] c"struct { chan int; chan int; chan bool }"
@26 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([40 x i8], [40 x i8]* @25, i32 0, i32 0), i64 40 }
@__go_td_pS0_CN3_intsre0_CN3_intsre0_CN4_boolsree = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 18947337, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS0_CN3_intsre0_CN3_intsre0_CN4_boolsree$gc" to i8*), { i8*, i64 }* @31, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree, i32 0, i32 0) }
@27 = internal constant [3 x %structField] [%structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0), { i8*, i64 }* null, i64 0 }, %structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0), { i8*, i64 }* null, i64 8 }, %structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN4_boolsre, i32 0, i32 0), { i8*, i64 }* null, i64 16 }]
@"__go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree$gc" = linkonce_odr constant [11 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* inttoptr (i64 6 to i8*), i8* inttoptr (i64 8 to i8*), i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* inttoptr (i64 6 to i8*), i8* inttoptr (i64 16 to i8*), i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN4_boolsre, i32 0, i32 0, i32 0), i8* null]
@28 = internal constant [31 x i8] c"*struct { chan int; chan bool }"
@29 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([31 x i8], [31 x i8]* @28, i32 0, i32 0), i64 31 }
@"__go_td_pS0_CN3_intsre0_CN4_boolsree$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([8 x i8*]* @"__go_td_S0_CN3_intsre0_CN4_boolsree$gc" to i8*), i8* null]
@30 = internal constant [41 x i8] c"*struct { chan int; chan int; chan bool }"
@31 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([41 x i8], [41 x i8]* @30, i32 0, i32 0), i64 41 }
@"__go_td_pS0_CN3_intsre0_CN3_intsre0_CN4_boolsree$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([11 x i8*]* @"__go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree$gc" to i8*), i8* null]
@32 = internal constant [14 x i8] c"[]interface {}"
@33 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @32, i32 0, i32 0), i64 14 }
@"__go_td_AIee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 10 to i8*), i8* null, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), i8* null]
@34 = internal constant [4 x i8] c"bool"
@35 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @34, i32 0, i32 0), i64 4 }
@36 = internal constant [4 x i8] c"bool"
@37 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @36, i32 0, i32 0), i64 4 }
@38 = internal constant %uncommonType { { i8*, i64 }* @37, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_bool$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 1 to i8*), i8* null]
@39 = internal constant [12 x i8] c"interface {}"
@40 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @39, i32 0, i32 0), i64 12 }
@"__go_td_Ie$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* null]

declare void @__go_go(i8* nest, i8*, i8*)

; Function Attrs: nounwind
declare i8* @__go_new(i8* nest, i8*, i64) #0

declare i8* @fifo_malloc(i8* nest, i8*, i64)

declare i8* @runtime.newselect(i8* nest, i32)

; Function Attrs: noreturn
declare void @__go_panic(i8* nest, i8*, i8*) #1

declare void @__go_receive(i8* nest, i8*, i8*, i8*)

declare void @runtime.selectdefault(i8* nest, i8*, i32)

declare i64 @runtime.selectgo(i8* nest, i8*)

declare void @runtime.selectrecv2(i8* nest, i8*, i8*, i8*, i8*, i32)

declare void @runtime.selectsend(i8* nest, i8*, i8*, i8*, i32)

declare void @fifo_write(i8* nest, i8*, i8*, i8*)

declare i64 @__go_type_hash_empty_interface(i8*, i64)

declare i8 @__go_type_equal_empty_interface(i8*, i8*, i64)

declare i64 @__go_type_hash_identity(i8*, i64)

declare i8 @__go_type_equal_identity(i8*, i8*, i64)

define internal void @main.consumer_1(i8* nest, i8*, i8*, i8*) #2 {
prologue:
  %4 = alloca i64
  %5 = alloca i8
  %6 = alloca i64*
  %7 = alloca i64
  %8 = alloca i64*
  %9 = alloca { i8*, i8* }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.1.for.body

.1.for.body:                                      ; preds = %.3.select.body, %.1.for.body, %.0.entry
  %10 = call i8* @runtime.newselect(i8* nest undef, i32 2)
  call void @runtime.selectrecv2(i8* nest undef, i8* %10, i8* %3, i8* null, i8* %5, i32 0)
  %11 = bitcast i64** %6 to i8**
  store i64* %4, i64** %6
  %12 = load i8*, i8** %11
  call void @runtime.selectrecv2(i8* nest undef, i8* %10, i8* %1, i8* %12, i8* %5, i32 1)
  %13 = call i64 @runtime.selectgo(i8* nest undef, i8* %10)
  %14 = load i8, i8* %5
  %15 = load i8, i8* null
  %16 = load i64, i64* %4
  %17 = icmp eq i64 %13, 0
  %18 = zext i1 %17 to i8
  switch i64 %13, label %.4.select.next [
    i64 0, label %.1.for.body
    i64 1, label %.3.select.body
  ]

.3.select.body:                                   ; preds = %.1.for.body
  %19 = call i8* @runtime.newselect(i8* nest undef, i32 2)
  store i64 %16, i64* %7
  call void @runtime.selectdefault(i8* nest undef, i8* %19, i32 -1)
  %20 = bitcast i64** %8 to i8**
  store i64* %7, i64** %8
  %21 = load i8*, i8** %20
  call void @runtime.selectsend(i8* nest undef, i8* %19, i8* %2, i8* %21, i32 0)
  %22 = call i64 @runtime.selectgo(i8* nest undef, i8* %19)
  %23 = icmp eq i64 %22, 0
  %24 = zext i1 %23 to i8
  br label %.1.for.body

.4.select.next:                                   ; preds = %.1.for.body
  %25 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %26 = bitcast i8* %25 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i64 31 }, { i8*, i64 }* %26
  %27 = bitcast { i8*, i64 }* %26 to i8*
  %28 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %27, 1
  store { i8*, i8* } %28, { i8*, i8* }* %9
  %29 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %9, i32 0, i32 0
  %30 = load i8*, i8** %29
  %31 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %9, i32 0, i32 1
  %32 = load i8*, i8** %31
  call void @__go_panic(i8* nest undef, i8* %30, i8* %32)
  unreachable
}

define internal void @main.consumer_2(i8* nest, i8*, i8*, i8*) #2 {
prologue:
  %4 = alloca i64
  %5 = alloca i8
  %6 = alloca i64*
  %7 = alloca { i8*, i64, i64 }
  %8 = alloca { i64, { i8*, i8* } }
  %9 = alloca i64
  %10 = alloca i64*
  %11 = alloca { i8*, i8* }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.1.for.body

.1.for.body:                                      ; preds = %.4.select.body, %.2.select.body, %.0.entry
  %12 = call i8* @runtime.newselect(i8* nest undef, i32 2)
  call void @runtime.selectrecv2(i8* nest undef, i8* %12, i8* %3, i8* null, i8* %5, i32 0)
  %13 = bitcast i64** %6 to i8**
  store i64* %4, i64** %6
  %14 = load i8*, i8** %13
  call void @runtime.selectrecv2(i8* nest undef, i8* %12, i8* %1, i8* %14, i8* %5, i32 1)
  %15 = call i64 @runtime.selectgo(i8* nest undef, i8* %12)
  %16 = load i8, i8* %5
  %17 = load i8, i8* null
  %18 = load i64, i64* %4
  %19 = icmp eq i64 %15, 0
  %20 = zext i1 %19 to i8
  switch i64 %15, label %.5.select.next [
    i64 0, label %.2.select.body
    i64 1, label %.4.select.body
  ]

.2.select.body:                                   ; preds = %.1.for.body
  %21 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe1e, i32 0, i32 0, i32 0), i64 16)
  %varargs = bitcast i8* %21 to [1 x { i8*, i8* }]*
  %22 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %23 = bitcast i8* %22 to { i8*, i8* }*
  %24 = getelementptr { i8*, i8* }, { i8*, i8* }* %23, i64 0
  %25 = bitcast { i8*, i8* }* %24 to i8*
  %26 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %27 = bitcast i8* %26 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @1, i32 0, i32 0), i64 4 }, { i8*, i64 }* %27
  %28 = bitcast { i8*, i64 }* %27 to i8*
  %29 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %28, 1
  %30 = bitcast i8* %25 to { i8*, i8* }*
  store { i8*, i8* } %29, { i8*, i8* }* %30
  %31 = getelementptr inbounds i8, i8* %22, i64 0
  %32 = insertvalue { i8*, i64, i64 } undef, i8* %31, 0
  %33 = insertvalue { i8*, i64, i64 } %32, i64 1, 1
  %34 = insertvalue { i8*, i64, i64 } %33, i64 1, 2
  store { i8*, i64, i64 } %34, { i8*, i64, i64 }* %7
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %8, i8* nest undef, { i8*, i64, i64 }* byval %7)
  %35 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %8, i32 0, i32 0
  %36 = load i64, i64* %35
  %37 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %8, i32 0, i32 1
  %38 = load { i8*, i8* }, { i8*, i8* }* %37
  br label %.1.for.body

.4.select.body:                                   ; preds = %.1.for.body
  %39 = mul i64 10, %18
  %40 = mul i64 %39, %18
  %41 = mul i64 %40, %18
  %42 = call i8* @runtime.newselect(i8* nest undef, i32 2)
  store i64 %41, i64* %9
  call void @runtime.selectdefault(i8* nest undef, i8* %42, i32 -1)
  %43 = bitcast i64** %10 to i8**
  store i64* %9, i64** %10
  %44 = load i8*, i8** %43
  call void @runtime.selectsend(i8* nest undef, i8* %42, i8* %2, i8* %44, i32 0)
  %45 = call i64 @runtime.selectgo(i8* nest undef, i8* %42)
  %46 = icmp eq i64 %45, 0
  %47 = zext i1 %46 to i8
  br label %.1.for.body

.5.select.next:                                   ; preds = %.1.for.body
  %48 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %49 = bitcast i8* %48 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([31 x i8], [31 x i8]* @2, i32 0, i32 0), i64 31 }, { i8*, i64 }* %49
  %50 = bitcast { i8*, i64 }* %49 to i8*
  %51 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %50, 1
  store { i8*, i8* } %51, { i8*, i8* }* %11
  %52 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %11, i32 0, i32 0
  %53 = load i8*, i8** %52
  %54 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %11, i32 0, i32 1
  %55 = load i8*, i8** %54
  call void @__go_panic(i8* nest undef, i8* %53, i8* %55)
  unreachable
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
  %1 = alloca i64
  %2 = alloca { i8*, i64, i64 }
  %3 = alloca { i64, { i8*, i8* } }
  %4 = alloca i64
  %5 = alloca { i8*, i64, i64 }
  %6 = alloca { i64, { i8*, i8* } }
  %7 = alloca i8
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %8 = call i8* @fifo_malloc(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN4_boolsre, i32 0, i32 0, i32 0), i64 10)
  %9 = call i8* @fifo_malloc(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 0)
  %10 = call i8* @fifo_malloc(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 0)
  %11 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsre0_CN4_boolsree, i32 0, i32 0, i32 0), i64 16)
  %12 = bitcast i8* %11 to { i8*, i8* }*
  %13 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %12, i32 0, i32 0
  store i8* %9, i8** %13
  %14 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %12, i32 0, i32 1
  store i8* %8, i8** %14
  %15 = bitcast { i8*, i8* }* %12 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @41 to i8*), i8* %15)
  %16 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree, i32 0, i32 0, i32 0), i64 24)
  %17 = bitcast i8* %16 to { i8*, i8*, i8* }*
  %18 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %17, i32 0, i32 0
  store i8* %9, i8** %18
  %19 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %17, i32 0, i32 1
  store i8* %10, i8** %19
  %20 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %17, i32 0, i32 2
  store i8* %8, i8** %20
  %21 = bitcast { i8*, i8*, i8* }* %17 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @42 to i8*), i8* %21)
  %22 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree, i32 0, i32 0, i32 0), i64 24)
  %23 = bitcast i8* %22 to { i8*, i8*, i8* }*
  %24 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %23, i32 0, i32 0
  store i8* %9, i8** %24
  %25 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %23, i32 0, i32 1
  store i8* %10, i8** %25
  %26 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %23, i32 0, i32 2
  store i8* %8, i8** %26
  %27 = bitcast { i8*, i8*, i8* }* %23 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @43 to i8*), i8* %27)
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %28 = bitcast i64* %1 to i8*
; NOTE(growly):
; this returns void so the return value is not stored.
; the first param 'nest' we can ignore (see post on llvm-dev) - it has something to do with support for closures
; the second param, a getelementptr indexes into the chanType struct at 0, yielding %commonType, another structure. then it indexes that at 0, yielding an i8. The last index uh, I dunno.
; the third value is the i8* in %10, which is not @10, which is a channel
; the last value is %1 converted to an i8*; %1 is a stack-allocated i64
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %10, i8* %28)
  %29 = load i64, i64* %1
  %30 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe1e, i32 0, i32 0, i32 0), i64 16)
  %varargs = bitcast i8* %30 to [1 x { i8*, i8* }]*
  %31 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %32 = bitcast i8* %31 to { i8*, i8* }*
  %33 = getelementptr { i8*, i8* }, { i8*, i8* }* %32, i64 0
  %34 = bitcast { i8*, i8* }* %33 to i8*
  %35 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %36 = bitcast i8* %35 to i64*
  store i64 %29, i64* %36
  %37 = bitcast i64* %36 to i8*
  %38 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %37, 1
  %39 = bitcast i8* %34 to { i8*, i8* }*
  store { i8*, i8* } %38, { i8*, i8* }* %39
  %40 = getelementptr inbounds i8, i8* %31, i64 0
  %41 = insertvalue { i8*, i64, i64 } undef, i8* %40, 0
  %42 = insertvalue { i8*, i64, i64 } %41, i64 1, 1
  %43 = insertvalue { i8*, i64, i64 } %42, i64 1, 2
  store { i8*, i64, i64 } %43, { i8*, i64, i64 }* %2
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %3, i8* nest undef, { i8*, i64, i64 }* byval %2)
  %44 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %3, i32 0, i32 0
  %45 = load i64, i64* %44
  %46 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %3, i32 0, i32 1
  %47 = load { i8*, i8* }, { i8*, i8* }* %46
  %48 = bitcast i64* %4 to i8*
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %10, i8* %48)
  %49 = load i64, i64* %4
  %50 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe1e, i32 0, i32 0, i32 0), i64 16)
  %varargs1 = bitcast i8* %50 to [1 x { i8*, i8* }]*
  %51 = bitcast [1 x { i8*, i8* }]* %varargs1 to i8*
  %52 = bitcast i8* %51 to { i8*, i8* }*
  %53 = getelementptr { i8*, i8* }, { i8*, i8* }* %52, i64 0
  %54 = bitcast { i8*, i8* }* %53 to i8*
  %55 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %56 = bitcast i8* %55 to i64*
  store i64 %49, i64* %56
  %57 = bitcast i64* %56 to i8*
  %58 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %57, 1
  %59 = bitcast i8* %54 to { i8*, i8* }*
  store { i8*, i8* } %58, { i8*, i8* }* %59
  %60 = getelementptr inbounds i8, i8* %51, i64 0
  %61 = insertvalue { i8*, i64, i64 } undef, i8* %60, 0
  %62 = insertvalue { i8*, i64, i64 } %61, i64 1, 1
  %63 = insertvalue { i8*, i64, i64 } %62, i64 1, 2
  store { i8*, i64, i64 } %63, { i8*, i64, i64 }* %5
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %6, i8* nest undef, { i8*, i64, i64 }* byval %5)
  %64 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %6, i32 0, i32 0
  %65 = load i64, i64* %64
  %66 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %6, i32 0, i32 1
  %67 = load { i8*, i8* }, { i8*, i8* }* %66
  %68 = add i64 %i, 1
  br label %.3.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.3.for.loop:                                      ; preds = %.1.for.body, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %68, %.1.for.body ]
  %69 = icmp slt i64 %i, 5
  %70 = zext i1 %69 to i8
  %71 = trunc i8 %70 to i1
  br i1 %71, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  store i8 1, i8* %7
  call void @fifo_write(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN4_boolsre, i32 0, i32 0, i32 0), i8* %8, i8* %7)
  %72 = add i64 %i2, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  call void @time.Sleep(i8* nest undef, i64 1000000000)
  ret void

.6.for.loop:                                      ; preds = %.4.for.body, %.2.for.done
  %i2 = phi i64 [ 0, %.2.for.done ], [ %72, %.4.for.body ]
  %73 = icmp slt i64 %i2, 3
  %74 = zext i1 %73 to i8
  %75 = trunc i8 %74 to i1
  br i1 %75, label %.4.for.body, label %.5.for.done
}

define internal void @41(i8*) #2 {
prologue:
  %1 = bitcast i8* %0 to { i8*, i8* }*
  %2 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  %4 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %1, i32 0, i32 1
  %5 = load i8*, i8** %4
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.producer(i8* nest undef, i8* %3, i8* %5)
  ret void
}

define internal void @main.producer(i8* nest, i8*, i8*) #2 {
prologue:
  %3 = alloca i64
  %4 = alloca i8
  %5 = alloca i64*
  %6 = alloca { i8*, i64, i64 }
  %7 = alloca { i64, { i8*, i8* } }
  %8 = alloca { i8*, i64, i64 }
  %9 = alloca { i64, { i8*, i8* } }
  %10 = alloca { i8*, i8* }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.1.for.body

.1.for.body:                                      ; preds = %.2.select.done, %.0.entry
  %i = phi i64 [ 1, %.0.entry ], [ %19, %.2.select.done ]
  %11 = call i8* @runtime.newselect(i8* nest undef, i32 2)
  store i64 %i, i64* %3
  call void @runtime.selectrecv2(i8* nest undef, i8* %11, i8* %2, i8* null, i8* %4, i32 0)
  %12 = bitcast i64** %5 to i8**
  store i64* %3, i64** %5
  %13 = load i8*, i8** %12
  call void @runtime.selectsend(i8* nest undef, i8* %11, i8* %1, i8* %13, i32 1)
  %14 = call i64 @runtime.selectgo(i8* nest undef, i8* %11)
  %15 = load i8, i8* %4
  %16 = load i8, i8* null
  %17 = icmp eq i64 %14, 0
  %18 = zext i1 %17 to i8
  switch i64 %14, label %.6.select.next [
    i64 0, label %.3.select.body
    i64 1, label %.5.select.body
  ]

.2.select.done:                                   ; preds = %.5.select.body, %.3.select.body
  %19 = add i64 %i, 1
  br label %.1.for.body

.3.select.body:                                   ; preds = %.1.for.body
  %20 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe1e, i32 0, i32 0, i32 0), i64 16)
  %varargs = bitcast i8* %20 to [1 x { i8*, i8* }]*
  %21 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %22 = bitcast i8* %21 to { i8*, i8* }*
  %23 = getelementptr { i8*, i8* }, { i8*, i8* }* %22, i64 0
  %24 = bitcast { i8*, i8* }* %23 to i8*
  %25 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %26 = bitcast i8* %25 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @3, i32 0, i32 0), i64 13 }, { i8*, i64 }* %26
  %27 = bitcast { i8*, i64 }* %26 to i8*
  %28 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %27, 1
  %29 = bitcast i8* %24 to { i8*, i8* }*
  store { i8*, i8* } %28, { i8*, i8* }* %29
  %30 = getelementptr inbounds i8, i8* %21, i64 0
  %31 = insertvalue { i8*, i64, i64 } undef, i8* %30, 0
  %32 = insertvalue { i8*, i64, i64 } %31, i64 1, 1
  %33 = insertvalue { i8*, i64, i64 } %32, i64 1, 2
  store { i8*, i64, i64 } %33, { i8*, i64, i64 }* %6
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %7, i8* nest undef, { i8*, i64, i64 }* byval %6)
  %34 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %7, i32 0, i32 0
  %35 = load i64, i64* %34
  %36 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %7, i32 0, i32 1
  %37 = load { i8*, i8* }, { i8*, i8* }* %36
  br label %.2.select.done

.5.select.body:                                   ; preds = %.1.for.body
  %38 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe1e, i32 0, i32 0, i32 0), i64 16)
  %varargs1 = bitcast i8* %38 to [1 x { i8*, i8* }]*
  %39 = bitcast [1 x { i8*, i8* }]* %varargs1 to i8*
  %40 = bitcast i8* %39 to { i8*, i8* }*
  %41 = getelementptr { i8*, i8* }, { i8*, i8* }* %40, i64 0
  %42 = bitcast { i8*, i8* }* %41 to i8*
  %43 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %44 = bitcast i8* %43 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @4, i32 0, i32 0), i64 17 }, { i8*, i64 }* %44
  %45 = bitcast { i8*, i64 }* %44 to i8*
  %46 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %45, 1
  %47 = bitcast i8* %42 to { i8*, i8* }*
  store { i8*, i8* } %46, { i8*, i8* }* %47
  %48 = getelementptr inbounds i8, i8* %39, i64 0
  %49 = insertvalue { i8*, i64, i64 } undef, i8* %48, 0
  %50 = insertvalue { i8*, i64, i64 } %49, i64 1, 1
  %51 = insertvalue { i8*, i64, i64 } %50, i64 1, 2
  store { i8*, i64, i64 } %51, { i8*, i64, i64 }* %8
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %9, i8* nest undef, { i8*, i64, i64 }* byval %8)
  %52 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %9, i32 0, i32 0
  %53 = load i64, i64* %52
  %54 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %9, i32 0, i32 1
  %55 = load { i8*, i8* }, { i8*, i8* }* %54
  br label %.2.select.done

.6.select.next:                                   ; preds = %.1.for.body
  %56 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %57 = bitcast i8* %56 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([31 x i8], [31 x i8]* @5, i32 0, i32 0), i64 31 }, { i8*, i64 }* %57
  %58 = bitcast { i8*, i64 }* %57 to i8*
  %59 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %58, 1
  store { i8*, i8* } %59, { i8*, i8* }* %10
  %60 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %10, i32 0, i32 0
  %61 = load i8*, i8** %60
  %62 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %10, i32 0, i32 1
  %63 = load i8*, i8** %62
  call void @__go_panic(i8* nest undef, i8* %61, i8* %63)
  unreachable
}

define internal void @42(i8*) #2 {
prologue:
  %1 = bitcast i8* %0 to { i8*, i8*, i8* }*
  %2 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  %4 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %1, i32 0, i32 1
  %5 = load i8*, i8** %4
  %6 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %1, i32 0, i32 2
  %7 = load i8*, i8** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.consumer_1(i8* nest undef, i8* %3, i8* %5, i8* %7)
  ret void
}

define internal void @43(i8*) #2 {
prologue:
  %1 = bitcast i8* %0 to { i8*, i8*, i8* }*
  %2 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  %4 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %1, i32 0, i32 1
  %5 = load i8*, i8** %4
  %6 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %1, i32 0, i32 2
  %7 = load i8*, i8** %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.consumer_2(i8* nest undef, i8* %3, i8* %5, i8* %7)
  ret void
}

declare void @time.Sleep(i8* nest, i64)

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

define linkonce_odr i64 @__go_type_hash_S0_CN3_intsre0_CN4_boolsree(i8*, i64) {
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

define linkonce_odr i8 @__go_type_equal_S0_CN3_intsre0_CN4_boolsree(i8*, i8*, i64) {
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

define linkonce_odr i64 @__go_type_hash_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree(i8*, i64) {
entry:
  %2 = bitcast i8* %0 to { i8*, i8*, i8* }*
  %3 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %2, i32 0, i32 0
  %4 = bitcast i8** %3 to i8*
  %5 = call i64 @__go_type_hash_identity(i8* %4, i64 8)
  %6 = add i64 0, %5
  %7 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %2, i32 0, i32 1
  %8 = bitcast i8** %7 to i8*
  %9 = call i64 @__go_type_hash_identity(i8* %8, i64 8)
  %10 = mul i64 %6, 33
  %11 = add i64 %10, %9
  %12 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %2, i32 0, i32 2
  %13 = bitcast i8** %12 to i8*
  %14 = call i64 @__go_type_hash_identity(i8* %13, i64 8)
  %15 = mul i64 %11, 33
  %16 = add i64 %15, %14
  ret i64 %16
}

define linkonce_odr i8 @__go_type_equal_S0_CN3_intsre0_CN3_intsre0_CN4_boolsree(i8*, i8*, i64) {
entry:
  %3 = bitcast i8* %0 to { i8*, i8*, i8* }*
  %4 = bitcast i8* %1 to { i8*, i8*, i8* }*
  %5 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %3, i32 0, i32 0
  %6 = bitcast i8** %5 to i8*
  %7 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %4, i32 0, i32 0
  %8 = bitcast i8** %7 to i8*
  %9 = call i8 @__go_type_equal_identity(i8* %6, i8* %8, i64 8)
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %retzero, label %cont

retzero:                                          ; preds = %cont1, %cont, %entry
  ret i8 0

cont:                                             ; preds = %entry
  %11 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %3, i32 0, i32 1
  %12 = bitcast i8** %11 to i8*
  %13 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %4, i32 0, i32 1
  %14 = bitcast i8** %13 to i8*
  %15 = call i8 @__go_type_equal_identity(i8* %12, i8* %14, i64 8)
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %retzero, label %cont1

cont1:                                            ; preds = %cont
  %17 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %3, i32 0, i32 2
  %18 = bitcast i8** %17 to i8*
  %19 = getelementptr inbounds { i8*, i8*, i8* }, { i8*, i8*, i8* }* %4, i32 0, i32 2
  %20 = bitcast i8** %19 to i8*
  %21 = call i8 @__go_type_equal_identity(i8* %18, i8* %20, i64 8)
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %retzero, label %cont2

cont2:                                            ; preds = %cont1
  ret i8 1
}

define void @__go_init_main(i8*) #2 {
entry:
  call void @main..import(i8* undef)
  ret void
}

attributes #0 = { nounwind }
attributes #1 = { noreturn }
attributes #2 = { "disable-tail-calls"="true" "split-stack" }
