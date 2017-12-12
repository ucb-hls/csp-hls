; ModuleID = 'main'
; TODO(growly): Does commenting this out break anything?
; source_filename = "main"
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
%ptrType = type { %commonType, %commonType* }

@__go_type_hash_identity_descriptor = external global %funcVal
@__go_type_equal_identity_descriptor = external global %funcVal
@__go_tdn_main.FIFO = constant %structType { %commonType { i8 -103, i8 1, i8 1, i64 0, i32 134220952, %funcVal* @__go_type_hash_Se_descriptor, %funcVal* @__go_type_equal_Se_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_main.FIFO$gc" to i8*), { i8*, i64 }* @4, %uncommonType* @9, %commonType* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pN9_main.FIFO, i32 0, i32 0) }, %structFieldSlice zeroinitializer }
@"main..import$descriptor" = constant i8* bitcast (void (i8*)* @main..import to i8*)
@"init$guard" = internal global i1 false
@"main.main$descriptor" = constant i8* bitcast (void (i8*)* @main.main to i8*)
@__go_td_pN9_main.FIFO = constant %ptrType { %commonType { i8 54, i8 8, i8 8, i64 8, i32 -2147432055, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([5 x i8*]* @"__go_td_pN9_main.FIFO$gc" to i8*), { i8*, i64 }* @2, %uncommonType* null, %commonType* null }, %commonType* getelementptr inbounds (%structType, %structType* @__go_tdn_main.FIFO, i32 0, i32 0) }
@0 = internal global [3 x i8] c"%x\0A"
@1 = internal constant [16 x i8] c"*\09main\09main.FIFO"
@2 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @1, i32 0, i32 0), i64 16 }
@"__go_td_pN9_main.FIFO$gc" = constant [5 x i8*] [i8* inttoptr (i64 8 to i8*), i8* inttoptr (i64 1 to i8*), i8* null, i8* bitcast ([2 x i8*]* @"__go_tdn_main.FIFO$gc" to i8*), i8* null]
@__go_type_hash_Se_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i64 (i8*, i64)* @__go_type_hash_Se to void ()*) }
@__go_type_equal_Se_descriptor = linkonce_odr constant %funcVal { void ()* bitcast (i8 (i8*, i8*, i64)* @__go_type_equal_Se to void ()*) }
@3 = internal constant [15 x i8] c"\09main\09main.FIFO"
@4 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @3, i32 0, i32 0), i64 15 }
@5 = internal constant [4 x i8] c"FIFO"
@6 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @5, i32 0, i32 0), i64 4 }
@7 = internal constant [4 x i8] c"main"
@8 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @7, i32 0, i32 0), i64 4 }
@9 = internal constant %uncommonType { { i8*, i64 }* @6, { i8*, i64 }* @8, %methodSlice zeroinitializer }
@"__go_tdn_main.FIFO$gc" = constant [2 x i8*] zeroinitializer

define internal i8* @main.f(i8* nest) #0 {
prologue:
  %1 = alloca {}
  %2 = alloca {}*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  store {}* %1, {}** %2
  %complit = bitcast {}** %2 to {}*
  %3 = bitcast {}* %complit to i8*
  ret i8* %3
}

define void @main..import(i8* nest) #0 {
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

define void @main.main(i8* nest) #0 {
prologue:
  %1 = alloca [1 x { i8*, i8* }]
  %2 = alloca [1 x { i8*, i8* }]*
  %3 = alloca { i8*, i64 }
  %4 = alloca { i8*, i64, i64 }
  %5 = alloca { i64, { i8*, i8* } }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %6 = call i8* @main.f(i8* nest undef)
  store [1 x { i8*, i8* }]* %1, [1 x { i8*, i8* }]** %2
  %varargs = bitcast [1 x { i8*, i8* }]** %2 to [1 x { i8*, i8* }]*
  %7 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %8 = bitcast i8* %7 to { i8*, i8* }*
  %9 = getelementptr { i8*, i8* }, { i8*, i8* }* %8, i64 0
  %10 = bitcast { i8*, i8* }* %9 to i8*
  %11 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%ptrType, %ptrType* @__go_td_pN9_main.FIFO, i32 0, i32 0, i32 0), i8* undef }, i8* %6, 1
  %12 = bitcast i8* %10 to { i8*, i8* }*
  store { i8*, i8* } %11, { i8*, i8* }* %12
  %13 = getelementptr inbounds i8, i8* %7, i64 0
  %14 = insertvalue { i8*, i64, i64 } undef, i8* %13, 0
  %15 = insertvalue { i8*, i64, i64 } %14, i64 1, 1
  %16 = insertvalue { i8*, i64, i64 } %15, i64 1, 2
  store { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0), i64 3 }, { i8*, i64 }* %3
  %17 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %3, i32 0, i32 0
  %18 = load i8*, i8** %17
  %19 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %3, i32 0, i32 1
  %20 = load i64, i64* %19
  store { i8*, i64, i64 } %16, { i8*, i64, i64 }* %4
  call void @fmt.Printf({ i64, { i8*, i8* } }* sret %5, i8* nest undef, i8* %18, i64 %20, { i8*, i64, i64 }* byval %4)
  %21 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %5, i32 0, i32 0
  %22 = load i64, i64* %21
  %23 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %5, i32 0, i32 1
  %24 = load { i8*, i8* }, { i8*, i8* }* %23
  ret void
}

declare void @fmt.Printf({ i64, { i8*, i8* } }* sret, i8* nest, i8*, i64, { i8*, i64, i64 }* byval)

define linkonce_odr i64 @__go_type_hash_Se(i8*, i64) {
entry:
  %2 = bitcast i8* %0 to {}*
  ret i64 0
}

define linkonce_odr i8 @__go_type_equal_Se(i8*, i8*, i64) {
entry:
  %3 = bitcast i8* %0 to {}*
  %4 = bitcast i8* %1 to {}*
  ret i8 1

retzero:                                          ; No predecessors!
  ret i8 0
}

define void @__go_init_main(i8*) #0 {
entry:
  call void @main..import(i8* undef)
  ret void
}

attributes #0 = { "disable-tail-calls"="true" "split-stack" }
