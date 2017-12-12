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
@__go_td_CN3_intsre = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 1610653383, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN3_intsre$gc" to i8*), { i8*, i64 }* @10, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int, i64 3 }
@__go_td_S0_CN3_intsree = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 8, i32 -2147321048, %funcVal* @__go_type_hash_S0_CN3_intsree_descriptor, %funcVal* @__go_type_equal_S0_CN3_intsree_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_S0_CN3_intsree$gc" to i8*), { i8*, i64 }* @22, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS0_CN3_intsree, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([1 x %structField], [1 x %structField]* @23, i32 0, i32 0), i64 1, i64 1 } }
@__go_td_AIe1e = linkonce_odr constant %arrayType { %commonType { i8 17, i8 8, i8 8, i64 16, i32 30, %funcVal* @__go_type_hash_AIe1e_descriptor, %funcVal* @__go_type_hash_AIe1e_descriptor.2, i8* bitcast ([9 x i8*]* @"__go_td_AIe1e$gc" to i8*), { i8*, i64 }* @6, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0), %commonType* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AIee, i32 0, i32 0), i64 1 }
@0 = internal global [31 x i8] c"Main goroutine sleeps 2 seconds"
@__go_tdn_string = linkonce_odr constant %commonType { i8 24, i8 8, i8 8, i64 16, i32 100666096, %funcVal* @__go_type_hash_string_descriptor, %funcVal* @__go_type_equal_string_descriptor, i8* bitcast ([4 x i8*]* @"__go_tdn_string$gc" to i8*), { i8*, i64 }* @17, %uncommonType* @20, %commonType* null }
@1 = internal global [36 x i8] c"Main goroutine begins receiving data"
@__go_td_AIe2e = linkonce_odr constant %arrayType { %commonType { i8 17, i8 8, i8 8, i64 32, i32 30, %funcVal* @__go_type_hash_AIe2e_descriptor, %funcVal* @__go_type_hash_AIe2e_descriptor.4, i8* bitcast ([9 x i8*]* @"__go_td_AIe2e$gc" to i8*), { i8*, i64 }* @8, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0), %commonType* getelementptr inbounds (%sliceType, %sliceType* @__go_td_AIee, i32 0, i32 0), i64 2 }
@2 = internal global [29 x i8] c"Main goroutine received data:"
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @12, %uncommonType* @15, %commonType* null }
@3 = internal global [34 x i8] c"Func goroutine begins sending data"
@4 = internal global [32 x i8] c"Func goroutine ends sending data"
@__go_type_hash_AIe1e_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_AIe1e to void ()*) }
@__go_type_hash_AIe1e_descriptor.2 = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_hash_AIe1e.1 to void ()*) }
@5 = internal constant [15 x i8] c"[1]interface {}"
@6 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @5, i32 0, i32 0), i64 15 }
@__go_td_Ie = linkonce_odr constant %interfaceType { %commonType { i8 20, i8 8, i8 8, i64 16, i32 16, %funcVal* @__go_type_hash_empty_interface_descriptor, %funcVal* @__go_type_equal_empty_interface_descriptor, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), { i8*, i64 }* @29, %uncommonType* null, %commonType* null }, %imethodSlice zeroinitializer }
@__go_td_AIee = linkonce_odr constant %sliceType { %commonType { i8 23, i8 8, i8 8, i64 24, i32 30, %funcVal* @__go_type_hash_error_descriptor, %funcVal* @__go_type_equal_error_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_AIee$gc" to i8*), { i8*, i64 }* @27, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%interfaceType, %interfaceType* @__go_td_Ie, i32 0, i32 0) }
@"__go_td_AIe1e$gc" = linkonce_odr constant [9 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 3 to i8*), i8* null, i8* inttoptr (i64 1 to i8*), i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* inttoptr (i64 4 to i8*), i8* null]
@__go_type_hash_AIe2e_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_AIe2e to void ()*) }
@__go_type_hash_AIe2e_descriptor.4 = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_hash_AIe2e.3 to void ()*) }
@7 = internal constant [15 x i8] c"[2]interface {}"
@8 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @7, i32 0, i32 0), i64 15 }
@"__go_td_AIe2e$gc" = linkonce_odr constant [9 x i8*] [i8* inttoptr (i64 32 to i8*), i8* inttoptr (i64 3 to i8*), i8* null, i8* inttoptr (i64 2 to i8*), i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 8 to i8*), i8* null, i8* inttoptr (i64 4 to i8*), i8* null]
@9 = internal constant [8 x i8] c"chan int"
@10 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @9, i32 0, i32 0), i64 8 }
@"__go_td_CN3_intsre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* null]
@11 = internal constant [3 x i8] c"int"
@12 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @11, i32 0, i32 0), i64 3 }
@13 = internal constant [3 x i8] c"int"
@14 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @13, i32 0, i32 0), i64 3 }
@15 = internal constant %uncommonType { { i8*, i64 }* @14, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]
@16 = internal constant [6 x i8] c"string"
@17 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @16, i32 0, i32 0), i64 6 }
@18 = internal constant [6 x i8] c"string"
@19 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @18, i32 0, i32 0), i64 6 }
@20 = internal constant %uncommonType { { i8*, i64 }* @19, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_string$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 7 to i8*), i8* null, i8* null]
@__go_type_hash_S0_CN3_intsree_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_S0_CN3_intsree to void ()*) }
@__go_type_equal_S0_CN3_intsree_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_equal_S0_CN3_intsree to void ()*) }
@21 = internal constant [19 x i8] c"struct { chan int }"
@22 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @21, i32 0, i32 0), i64 19 }
@__go_td_pS0_CN3_intsree = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 2601609, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS0_CN3_intsree$gc" to i8*), { i8*, i64 }* @25, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsree, i32 0, i32 0) }
@23 = internal constant [1 x %structField] [%structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0), { i8*, i64 }* null, i64 0 }]
@"__go_td_S0_CN3_intsree$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* null]
@24 = internal constant [20 x i8] c"*struct { chan int }"
@25 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @24, i32 0, i32 0), i64 20 }
@"__go_td_pS0_CN3_intsree$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([5 x i8*]* @"__go_td_S0_CN3_intsree$gc" to i8*), i8* null]
@26 = internal constant [14 x i8] c"[]interface {}"
@27 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @26, i32 0, i32 0), i64 14 }
@"__go_td_AIee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 10 to i8*), i8* null, i8* bitcast ([4 x i8*]* @"__go_td_Ie$gc" to i8*), i8* null]
@28 = internal constant [12 x i8] c"interface {}"
@29 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @28, i32 0, i32 0), i64 12 }
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
  call void @time..import(i8* undef)
  br label %.0.entry
}

declare void @fmt..import(i8*)

declare void @time..import(i8*)

define void @main.main(i8* nest) #1 {
prologue:
  %1 = alloca { i8*, i64, i64 }
  %2 = alloca { i64, { i8*, i8* } }
  %3 = alloca { i8*, i64, i64 }
  %4 = alloca { i64, { i8*, i8* } }
  %5 = alloca i64
  %6 = alloca { i8*, i64, i64 }
  %7 = alloca { i64, { i8*, i8* } }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %8 = call i8* @__go_new_channel(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 0)
  %9 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsree, i32 0, i32 0, i32 0), i64 8)
  %10 = bitcast i8* %9 to { i8* }*
  %11 = getelementptr inbounds { i8* }, { i8* }* %10, i32 0, i32 0
  store i8* %8, i8** %11
  %12 = bitcast { i8* }* %10 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @30 to i8*), i8* %12)
  %13 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe1e, i32 0, i32 0, i32 0), i64 16)
  %varargs = bitcast i8* %13 to [1 x { i8*, i8* }]*
  %14 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %15 = bitcast i8* %14 to { i8*, i8* }*
  %16 = getelementptr { i8*, i8* }, { i8*, i8* }* %15, i64 0
  %17 = bitcast { i8*, i8* }* %16 to i8*
  %18 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %19 = bitcast i8* %18 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([31 x i8], [31 x i8]* @0, i32 0, i32 0), i64 31 }, { i8*, i64 }* %19
  %20 = bitcast { i8*, i64 }* %19 to i8*
  %21 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %20, 1
  %22 = bitcast i8* %17 to { i8*, i8* }*
  store { i8*, i8* } %21, { i8*, i8* }* %22
  %23 = getelementptr inbounds i8, i8* %14, i64 0
  %24 = insertvalue { i8*, i64, i64 } undef, i8* %23, 0
  %25 = insertvalue { i8*, i64, i64 } %24, i64 1, 1
  %26 = insertvalue { i8*, i64, i64 } %25, i64 1, 2
  store { i8*, i64, i64 } %26, { i8*, i64, i64 }* %1
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %2, i8* nest undef, { i8*, i64, i64 }* byval %1)
  %27 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %2, i32 0, i32 0
  %28 = load i64, i64* %27
  %29 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %2, i32 0, i32 1
  %30 = load { i8*, i8* }, { i8*, i8* }* %29
  call void @time.Sleep(i8* nest undef, i64 2000000000)
  %31 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe1e, i32 0, i32 0, i32 0), i64 16)
  %varargs1 = bitcast i8* %31 to [1 x { i8*, i8* }]*
  %32 = bitcast [1 x { i8*, i8* }]* %varargs1 to i8*
  %33 = bitcast i8* %32 to { i8*, i8* }*
  %34 = getelementptr { i8*, i8* }, { i8*, i8* }* %33, i64 0
  %35 = bitcast { i8*, i8* }* %34 to i8*
  %36 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %37 = bitcast i8* %36 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([36 x i8], [36 x i8]* @1, i32 0, i32 0), i64 36 }, { i8*, i64 }* %37
  %38 = bitcast { i8*, i64 }* %37 to i8*
  %39 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %38, 1
  %40 = bitcast i8* %35 to { i8*, i8* }*
  store { i8*, i8* } %39, { i8*, i8* }* %40
  %41 = getelementptr inbounds i8, i8* %32, i64 0
  %42 = insertvalue { i8*, i64, i64 } undef, i8* %41, 0
  %43 = insertvalue { i8*, i64, i64 } %42, i64 1, 1
  %44 = insertvalue { i8*, i64, i64 } %43, i64 1, 2
  store { i8*, i64, i64 } %44, { i8*, i64, i64 }* %3
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %4, i8* nest undef, { i8*, i64, i64 }* byval %3)
  %45 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %4, i32 0, i32 0
  %46 = load i64, i64* %45
  %47 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %4, i32 0, i32 1
  %48 = load { i8*, i8* }, { i8*, i8* }* %47
  %49 = bitcast i64* %5 to i8*
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %8, i8* %49)
  %50 = load i64, i64* %5
  %51 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe2e, i32 0, i32 0, i32 0), i64 32)
  %varargs2 = bitcast i8* %51 to [2 x { i8*, i8* }]*
  %52 = bitcast [2 x { i8*, i8* }]* %varargs2 to i8*
  %53 = bitcast i8* %52 to { i8*, i8* }*
  %54 = getelementptr { i8*, i8* }, { i8*, i8* }* %53, i64 0
  %55 = bitcast { i8*, i8* }* %54 to i8*
  %56 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %57 = bitcast i8* %56 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([29 x i8], [29 x i8]* @2, i32 0, i32 0), i64 29 }, { i8*, i64 }* %57
  %58 = bitcast { i8*, i64 }* %57 to i8*
  %59 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %58, 1
  %60 = bitcast i8* %55 to { i8*, i8* }*
  store { i8*, i8* } %59, { i8*, i8* }* %60
  %61 = bitcast i8* %52 to { i8*, i8* }*
  %62 = getelementptr { i8*, i8* }, { i8*, i8* }* %61, i64 1
  %63 = bitcast { i8*, i8* }* %62 to i8*
  %64 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i64 8)
  %65 = bitcast i8* %64 to i64*
  store i64 %50, i64* %65
  %66 = bitcast i64* %65 to i8*
  %67 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %66, 1
  %68 = bitcast i8* %63 to { i8*, i8* }*
  store { i8*, i8* } %67, { i8*, i8* }* %68
  %69 = getelementptr inbounds i8, i8* %52, i64 0
  %70 = insertvalue { i8*, i64, i64 } undef, i8* %69, 0
  %71 = insertvalue { i8*, i64, i64 } %70, i64 2, 1
  %72 = insertvalue { i8*, i64, i64 } %71, i64 2, 2
  store { i8*, i64, i64 } %72, { i8*, i64, i64 }* %6
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %7, i8* nest undef, { i8*, i64, i64 }* byval %6)
  %73 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %7, i32 0, i32 0
  %74 = load i64, i64* %73
  %75 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %7, i32 0, i32 1
  %76 = load { i8*, i8* }, { i8*, i8* }* %75
  call void @time.Sleep(i8* nest undef, i64 1000000000)
  ret void
}

define internal void @30(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { i8* }*
  %2 = getelementptr inbounds { i8* }, { i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  br label %entry

entry:                                            ; preds = %prologue
  call void @"main.main:main.main$1"(i8* nest undef, i8* %3)
  ret void
}

define internal void @"main.main:main.main$1"(i8* nest, i8*) #1 {
prologue:
  %2 = alloca { i8*, i64, i64 }
  %3 = alloca { i64, { i8*, i8* } }
  %4 = alloca i64
  %5 = alloca { i8*, i64, i64 }
  %6 = alloca { i64, { i8*, i8* } }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %7 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe1e, i32 0, i32 0, i32 0), i64 16)
  %varargs = bitcast i8* %7 to [1 x { i8*, i8* }]*
  %8 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %9 = bitcast i8* %8 to { i8*, i8* }*
  %10 = getelementptr { i8*, i8* }, { i8*, i8* }* %9, i64 0
  %11 = bitcast { i8*, i8* }* %10 to i8*
  %12 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %13 = bitcast i8* %12 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([34 x i8], [34 x i8]* @3, i32 0, i32 0), i64 34 }, { i8*, i64 }* %13
  %14 = bitcast { i8*, i64 }* %13 to i8*
  %15 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %14, 1
  %16 = bitcast i8* %11 to { i8*, i8* }*
  store { i8*, i8* } %15, { i8*, i8* }* %16
  %17 = getelementptr inbounds i8, i8* %8, i64 0
  %18 = insertvalue { i8*, i64, i64 } undef, i8* %17, 0
  %19 = insertvalue { i8*, i64, i64 } %18, i64 1, 1
  %20 = insertvalue { i8*, i64, i64 } %19, i64 1, 2
  store { i8*, i64, i64 } %20, { i8*, i64, i64 }* %2
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %3, i8* nest undef, { i8*, i64, i64 }* byval %2)
  %21 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %3, i32 0, i32 0
  %22 = load i64, i64* %21
  %23 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %3, i32 0, i32 1
  %24 = load { i8*, i8* }, { i8*, i8* }* %23
  store i64 1, i64* %4
  %25 = bitcast i64* %4 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %1, i8* %25)
  %26 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%arrayType, %arrayType* @__go_td_AIe1e, i32 0, i32 0, i32 0), i64 16)
  %varargs1 = bitcast i8* %26 to [1 x { i8*, i8* }]*
  %27 = bitcast [1 x { i8*, i8* }]* %varargs1 to i8*
  %28 = bitcast i8* %27 to { i8*, i8* }*
  %29 = getelementptr { i8*, i8* }, { i8*, i8* }* %28, i64 0
  %30 = bitcast { i8*, i8* }* %29 to i8*
  %31 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i64 16)
  %32 = bitcast i8* %31 to { i8*, i64 }*
  store { i8*, i64 } { i8* getelementptr inbounds ([32 x i8], [32 x i8]* @4, i32 0, i32 0), i64 32 }, { i8*, i64 }* %32
  %33 = bitcast { i8*, i64 }* %32 to i8*
  %34 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %33, 1
  %35 = bitcast i8* %30 to { i8*, i8* }*
  store { i8*, i8* } %34, { i8*, i8* }* %35
  %36 = getelementptr inbounds i8, i8* %27, i64 0
  %37 = insertvalue { i8*, i64, i64 } undef, i8* %36, 0
  %38 = insertvalue { i8*, i64, i64 } %37, i64 1, 1
  %39 = insertvalue { i8*, i64, i64 } %38, i64 1, 2
  store { i8*, i64, i64 } %39, { i8*, i64, i64 }* %5
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %6, i8* nest undef, { i8*, i64, i64 }* byval %5)
  %40 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %6, i32 0, i32 0
  %41 = load i64, i64* %40
  %42 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %6, i32 0, i32 1
  %43 = load { i8*, i8* }, { i8*, i8* }* %42
  ret void
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

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

define linkonce_odr i8 @__go_type_hash_AIe2e.3(i8*, i8*, i64) {
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

define linkonce_odr i64 @__go_type_hash_S0_CN3_intsree(i8*, i64) {
entry:
  %2 = bitcast i8* %0 to { i8* }*
  %3 = getelementptr inbounds { i8* }, { i8* }* %2, i32 0, i32 0
  %4 = bitcast i8** %3 to i8*
  %5 = call i64 @__go_type_hash_identity(i8* %4, i64 8)
  %6 = add i64 0, %5
  ret i64 %6
}

define linkonce_odr i8 @__go_type_equal_S0_CN3_intsree(i8*, i8*, i64) {
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

define void @__go_init_main(i8*) #1 {
entry:
  call void @main..import(i8* undef)
  ret void
}

attributes #0 = { nounwind }
attributes #1 = { "disable-tail-calls"="true" "split-stack" }
