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
%ptrType = type { %commonType, %commonType* }

@__go_type_hash_identity_descriptor = external global %funcVal
@__go_type_equal_identity_descriptor = external global %funcVal
@"main.Filter$descriptor" = constant i8* bitcast (void (i8*, i8*, i8*, i64)* @main.Filter to i8*)
@__go_td_CN3_intre = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 1610653375, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN3_intre$gc" to i8*), { i8*, i64 }* @2, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int, i64 1 }
@__go_td_CN3_intse = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 1610653367, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN3_intse$gc" to i8*), { i8*, i64 }* @6, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int, i64 2 }
@"main.Generate$descriptor" = constant i8* bitcast (void (i8*, i8*)* @main.Generate to i8*)
@"main.Sieve$descriptor" = constant i8* bitcast (void (i8*)* @main.Sieve to i8*)
@__go_td_CN3_intsre = linkonce_odr constant %chanType { %commonType { i8 18, i8 8, i8 8, i64 8, i32 1610653383, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_CN3_intsre$gc" to i8*), { i8*, i64 }* @4, %uncommonType* null, %commonType* null }, %commonType* @__go_tdn_int, i64 3 }
@__go_td_S0_CN3_intsee = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 8, i32 -2147321112, %funcVal* @__go_type_hash_S0_CN3_intsee_descriptor, %funcVal* @__go_type_equal_S0_CN3_intsee_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_S0_CN3_intsee$gc" to i8*), { i8*, i64 }* @11, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS0_CN3_intsee, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([1 x %structField], [1 x %structField]* @12, i32 0, i32 0), i64 1, i64 1 } }
@0 = internal global [1 x i8] c"\0A"
@__go_td_S0_CN3_intre0_CN3_intse0_N3_inte = linkonce_odr constant %structType { %commonType { i8 25, i8 8, i8 8, i64 24, i32 202306952, %funcVal* @__go_type_hash_S0_CN3_intre0_CN3_intse0_N3_inte_descriptor, %funcVal* @__go_type_equal_S0_CN3_intre0_CN3_intse0_N3_inte_descriptor, i8* bitcast ([8 x i8*]* @"__go_td_S0_CN3_intre0_CN3_intse0_N3_inte$gc" to i8*), { i8*, i64 }* @8, %uncommonType* null, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pS0_CN3_intre0_CN3_intse0_N3_inte, i32 0, i32 0) }, %structFieldSlice { %structField* getelementptr inbounds ([3 x %structField], [3 x %structField]* @9, i32 0, i32 0), i64 3, i64 3 } }
@"main..import$descriptor" = constant i8* bitcast (void (i8*)* @main..import to i8*)
@"init$guard" = internal global i1 false
@"main.main$descriptor" = constant i8* bitcast (void (i8*)* @main.main to i8*)
@1 = internal constant [10 x i8] c"<-chan int"
@2 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @1, i32 0, i32 0), i64 10 }
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @18, %uncommonType* @21, %commonType* null }
@"__go_td_CN3_intre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intre, i32 0, i32 0, i32 0), i8* null]
@3 = internal constant [8 x i8] c"chan int"
@4 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @3, i32 0, i32 0), i64 8 }
@"__go_td_CN3_intsre$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* null]
@5 = internal constant [10 x i8] c"chan<- int"
@6 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @5, i32 0, i32 0), i64 10 }
@"__go_td_CN3_intse$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intse, i32 0, i32 0, i32 0), i8* null]
@__go_type_hash_S0_CN3_intre0_CN3_intse0_N3_inte_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_S0_CN3_intre0_CN3_intse0_N3_inte to void ()*) }
@__go_type_equal_S0_CN3_intre0_CN3_intse0_N3_inte_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_equal_S0_CN3_intre0_CN3_intse0_N3_inte to void ()*) }
@7 = internal constant [38 x i8] c"struct { <-chan int; chan<- int; int }"
@8 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([38 x i8], [38 x i8]* @7, i32 0, i32 0), i64 38 }
@__go_td_pS0_CN3_intre0_CN3_intse0_N3_inte = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 -1058056055, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS0_CN3_intre0_CN3_intse0_N3_inte$gc" to i8*), { i8*, i64 }* @14, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intre0_CN3_intse0_N3_inte, i32 0, i32 0) }
@9 = internal constant [3 x %structField] [%structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intre, i32 0, i32 0), { i8*, i64 }* null, i64 0 }, %structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intse, i32 0, i32 0), { i8*, i64 }* null, i64 8 }, %structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* @__go_tdn_int, { i8*, i64 }* null, i64 16 }]
@"__go_td_S0_CN3_intre0_CN3_intse0_N3_inte$gc" = linkonce_odr constant [8 x i8*] [i8* inttoptr (i64 24 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intre, i32 0, i32 0, i32 0), i8* inttoptr (i64 6 to i8*), i8* inttoptr (i64 8 to i8*), i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intse, i32 0, i32 0, i32 0), i8* null]
@__go_type_hash_S0_CN3_intsee_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_S0_CN3_intsee to void ()*) }
@__go_type_equal_S0_CN3_intsee_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_equal_S0_CN3_intsee to void ()*) }
@10 = internal constant [21 x i8] c"struct { chan<- int }"
@11 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @10, i32 0, i32 0), i64 21 }
@__go_td_pS0_CN3_intsee = linkonce_odr constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 2600585, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pS0_CN3_intsee$gc" to i8*), { i8*, i64 }* @16, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsee, i32 0, i32 0) }
@12 = internal constant [1 x %structField] [%structField { { i8*, i64 }* null, { i8*, i64 }* null, %commonType* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intse, i32 0, i32 0), { i8*, i64 }* null, i64 0 }]
@"__go_td_S0_CN3_intsee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 6 to i8*), i8* null, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intse, i32 0, i32 0, i32 0), i8* null]
@13 = internal constant [39 x i8] c"*struct { <-chan int; chan<- int; int }"
@14 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([39 x i8], [39 x i8]* @13, i32 0, i32 0), i64 39 }
@"__go_td_pS0_CN3_intre0_CN3_intse0_N3_inte$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([8 x i8*]* @"__go_td_S0_CN3_intre0_CN3_intse0_N3_inte$gc" to i8*), i8* null]
@15 = internal constant [22 x i8] c"*struct { chan<- int }"
@16 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([22 x i8], [22 x i8]* @15, i32 0, i32 0), i64 22 }
@"__go_td_pS0_CN3_intsee$gc" = linkonce_odr constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([5 x i8*]* @"__go_td_S0_CN3_intsee$gc" to i8*), i8* null]
@17 = internal constant [3 x i8] c"int"
@18 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @17, i32 0, i32 0), i64 3 }
@19 = internal constant [3 x i8] c"int"
@20 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @19, i32 0, i32 0), i64 3 }
@21 = internal constant %uncommonType { { i8*, i64 }* @20, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]

declare void @__go_go(i8* nest, i8*, i8*)

; Function Attrs: nounwind
declare i8* @__go_new(i8* nest, i8*, i64) #0

declare i8* @__go_new_channel(i8* nest, i8*, i64)

declare void @__go_print_int64(i8* nest, i64)

declare void @__go_print_string(i8* nest, i8*, i64)

declare void @__go_receive(i8* nest, i8*, i8*, i8*)

declare void @__go_send_big(i8* nest, i8*, i8*, i8*)

declare i64 @__go_type_hash_identity(i8*, i64)

declare i8 @__go_type_equal_identity(i8*, i8*, i64)

define void @main.Filter(i8* nest, i8*, i8*, i64) #1 {
prologue:
  %4 = alloca i64
  %5 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.1.for.body

.1.for.body:                                      ; preds = %.2.if.then, %.1.for.body, %.0.entry
  %6 = bitcast i64* %4 to i8*
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intre, i32 0, i32 0, i32 0), i8* %1, i8* %6)
  %7 = load i64, i64* %4
  %8 = srem i64 %7, %3
  %9 = icmp eq i64 %8, 0
  %10 = zext i1 %9 to i8
  %11 = xor i8 %10, 1
  %12 = trunc i8 %11 to i1
  br i1 %12, label %.2.if.then, label %.1.for.body

.2.if.then:                                       ; preds = %.1.for.body
  store i64 %7, i64* %5
  %13 = bitcast i64* %5 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intse, i32 0, i32 0, i32 0), i8* %2, i8* %13)
  br label %.1.for.body
}

define void @main.Generate(i8* nest, i8*) #1 {
prologue:
  %2 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.1.for.body

.1.for.body:                                      ; preds = %.1.for.body, %.0.entry
  %i = phi i64 [ 2, %.0.entry ], [ %4, %.1.for.body ]
  store i64 %i, i64* %2
  %3 = bitcast i64* %2 to i8*
  call void @__go_send_big(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intse, i32 0, i32 0, i32 0), i8* %1, i8* %3)
  %4 = add i64 %i, 1
  br label %.1.for.body
}

define void @main.Sieve(i8* nest) #1 {
prologue:
  %1 = alloca i64
  %2 = alloca { i8*, i64 }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %3 = call i8* @__go_new_channel(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 0)
  %4 = call i8* @__go_new_channel(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i64 0)
  %5 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intsee, i32 0, i32 0, i32 0), i64 8)
  %6 = bitcast i8* %5 to { i8* }*
  %7 = getelementptr inbounds { i8* }, { i8* }* %6, i32 0, i32 0
  store i8* %3, i8** %7
  %8 = bitcast { i8* }* %6 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @22 to i8*), i8* %8)
  br label %.1.for.body

.1.for.body:                                      ; preds = %.1.for.body, %.0.entry
  %ch = phi i8* [ %3, %.0.entry ], [ %4, %.1.for.body ]
  %9 = bitcast i64* %1 to i8*
  call void @__go_receive(i8* nest undef, i8* getelementptr inbounds (%chanType, %chanType* @__go_td_CN3_intsre, i32 0, i32 0, i32 0), i8* %ch, i8* %9)
  %10 = load i64, i64* %1
  call void @__go_print_int64(i8* nest undef, i64 %10)
  store { i8*, i64 } { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i64 1 }, { i8*, i64 }* %2
  %11 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %2, i32 0, i32 0
  %12 = load i8*, i8** %11
  %13 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %2, i32 0, i32 1
  %14 = load i64, i64* %13
  call void @__go_print_string(i8* nest undef, i8* %12, i64 %14)
  %15 = call i8* @__go_new(i8* nest undef, i8* getelementptr inbounds (%structType, %structType* @__go_td_S0_CN3_intre0_CN3_intse0_N3_inte, i32 0, i32 0, i32 0), i64 24)
  %16 = bitcast i8* %15 to { i8*, i8*, i64 }*
  %17 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %16, i32 0, i32 0
  store i8* %ch, i8** %17
  %18 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %16, i32 0, i32 1
  store i8* %4, i8** %18
  %19 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %16, i32 0, i32 2
  store i64 %10, i64* %19
  %20 = bitcast { i8*, i8*, i64 }* %16 to i8*
  call void @__go_go(i8* nest undef, i8* bitcast (void (i8*)* @23 to i8*), i8* %20)
  br label %.1.for.body
}

define internal void @22(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { i8* }*
  %2 = getelementptr inbounds { i8* }, { i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.Generate(i8* nest undef, i8* %3)
  ret void
}

define internal void @23(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { i8*, i8*, i64 }*
  %2 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  %4 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %1, i32 0, i32 1
  %5 = load i8*, i8** %4
  %6 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %1, i32 0, i32 2
  %7 = load i64, i64* %6
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.Filter(i8* nest undef, i8* %3, i8* %5, i64 %7)
  ret void
}

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
  br label %.0.entry
}

define void @main.main(i8* nest) #1 {
prologue:
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @main.Sieve(i8* nest undef)
  ret void
}

define linkonce_odr i64 @__go_type_hash_S0_CN3_intre0_CN3_intse0_N3_inte(i8*, i64) {
entry:
  %2 = bitcast i8* %0 to { i8*, i8*, i64 }*
  %3 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %2, i32 0, i32 0
  %4 = bitcast i8** %3 to i8*
  %5 = call i64 @__go_type_hash_identity(i8* %4, i64 8)
  %6 = add i64 0, %5
  %7 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %2, i32 0, i32 1
  %8 = bitcast i8** %7 to i8*
  %9 = call i64 @__go_type_hash_identity(i8* %8, i64 8)
  %10 = mul i64 %6, 33
  %11 = add i64 %10, %9
  %12 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %2, i32 0, i32 2
  %13 = bitcast i64* %12 to i8*
  %14 = call i64 @__go_type_hash_identity(i8* %13, i64 8)
  %15 = mul i64 %11, 33
  %16 = add i64 %15, %14
  ret i64 %16
}

define linkonce_odr i8 @__go_type_equal_S0_CN3_intre0_CN3_intse0_N3_inte(i8*, i8*, i64) {
entry:
  %3 = bitcast i8* %0 to { i8*, i8*, i64 }*
  %4 = bitcast i8* %1 to { i8*, i8*, i64 }*
  %5 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %3, i32 0, i32 0
  %6 = bitcast i8** %5 to i8*
  %7 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %4, i32 0, i32 0
  %8 = bitcast i8** %7 to i8*
  %9 = call i8 @__go_type_equal_identity(i8* %6, i8* %8, i64 8)
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %retzero, label %cont

retzero:                                          ; preds = %cont1, %cont, %entry
  ret i8 0

cont:                                             ; preds = %entry
  %11 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %3, i32 0, i32 1
  %12 = bitcast i8** %11 to i8*
  %13 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %4, i32 0, i32 1
  %14 = bitcast i8** %13 to i8*
  %15 = call i8 @__go_type_equal_identity(i8* %12, i8* %14, i64 8)
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %retzero, label %cont1

cont1:                                            ; preds = %cont
  %17 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %3, i32 0, i32 2
  %18 = bitcast i64* %17 to i8*
  %19 = getelementptr inbounds { i8*, i8*, i64 }, { i8*, i8*, i64 }* %4, i32 0, i32 2
  %20 = bitcast i64* %19 to i8*
  %21 = call i8 @__go_type_equal_identity(i8* %18, i8* %20, i64 8)
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %retzero, label %cont2

cont2:                                            ; preds = %cont1
  ret i8 1
}

define linkonce_odr i64 @__go_type_hash_S0_CN3_intsee(i8*, i64) {
entry:
  %2 = bitcast i8* %0 to { i8* }*
  %3 = getelementptr inbounds { i8* }, { i8* }* %2, i32 0, i32 0
  %4 = bitcast i8** %3 to i8*
  %5 = call i64 @__go_type_hash_identity(i8* %4, i64 8)
  %6 = add i64 0, %5
  ret i64 %6
}

define linkonce_odr i8 @__go_type_equal_S0_CN3_intsee(i8*, i8*, i64) {
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
