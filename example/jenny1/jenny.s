; ModuleID = 'main'
; TODO(growly): Does commenting this out break anything?
; source_filename = "main"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%funcVal = type { void ()* }
%commonType = type { i8, i8, i8, i64, i32, %funcVal*, %funcVal*, i8*, { i8*, i64 }*, %uncommonType*, %commonType* }
%uncommonType = type { { i8*, i64 }*, { i8*, i64 }*, %methodSlice }
%methodSlice = type { %method*, i64, i64 }
%method = type { { i8*, i64 }*, { i8*, i64 }*, %commonType*, %commonType*, i8* }

@__go_type_hash_identity_descriptor = external global %funcVal
@__go_type_equal_identity_descriptor = external global %funcVal
@"main..import$descriptor" = constant i8* bitcast (void (i8*)* @main..import to i8*)
@"init$guard" = internal global i1 false
@"main.main$descriptor" = constant i8* bitcast (void (i8*)* @main.main to i8*)
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @1, %uncommonType* @4, %commonType* null }
@0 = internal constant [3 x i8] c"int"
@1 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0), i64 3 }
@2 = internal constant [3 x i8] c"int"
@3 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @2, i32 0, i32 0), i64 3 }
@4 = internal constant %uncommonType { { i8*, i64 }* @3, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]

declare void @pthread_create(i8*, i8*, i8*, i8*)

declare i8* @fifo_malloc(i8 zeroext, i64)

declare i64 @fifo_read(i8*)

declare void @pthread_exit(i8*)

declare void @fifo_write(i8*, i64)

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
  %1 = alloca i8*
  %2 = alloca i8**
  %3 = alloca { i8*, i8* }
  %4 = alloca { i8*, i8* }*
  %5 = alloca { i8* }
  %6 = alloca { i8* }*
  %p = alloca i32
  %7 = alloca i32*
  %8 = alloca i8*
  %9 = alloca i32**
  %10 = alloca i8**
  %11 = alloca i64
  %12 = alloca [1 x { i8*, i8* }]
  %13 = alloca [1 x { i8*, i8* }]*
  %14 = alloca i64
  %15 = alloca i64*
  %16 = alloca { i8*, i64, i64 }
  %17 = alloca { i64, { i8*, i8* } }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  store i8** %1, i8*** %2
  %messages = bitcast i8*** %2 to i8**
  %18 = bitcast i8** %messages to i8*
  %19 = call i8* @fifo_malloc(i8 zeroext 64, i64 0)
  %20 = bitcast i8* %18 to i8**
  store i8* %19, i8** %20
  store { i8*, i8* }* %3, { i8*, i8* }** %4
  %21 = bitcast { i8*, i8* }** %4 to { i8*, i8* }*
  %22 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %21, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$1" to i8*), i8** %22
  %23 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %21, i32 0, i32 1
  store i8* %18, i8** %23
  %24 = bitcast { i8*, i8* }* %21 to i8*
  store { i8* }* %5, { i8* }** %6
  %25 = bitcast { i8* }** %6 to { i8* }*
  %26 = getelementptr inbounds { i8* }, { i8* }* %25, i32 0, i32 0
  store i8* %24, i8** %26
  %27 = bitcast { i8* }* %25 to i8*
  store i32* %p, i32** %7
  store i8* null, i8** %8
  %28 = bitcast i32*** %9 to i8**
  store i32** %7, i32*** %9
  %29 = load i8*, i8** %28
  %30 = bitcast i8*** %10 to i8**
  store i8** %8, i8*** %10
  %31 = load i8*, i8** %30
  call void @pthread_create(i8* %29, i8* %31, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %27)
  %32 = bitcast i8* %18 to i8**
  %33 = load i8*, i8** %32
  %34 = call i64 @fifo_read(i8* %33)
  store i64 %34, i64* %11
  %35 = load i64, i64* %11
  store [1 x { i8*, i8* }]* %12, [1 x { i8*, i8* }]** %13
  %varargs = bitcast [1 x { i8*, i8* }]** %13 to [1 x { i8*, i8* }]*
  %36 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %37 = bitcast i8* %36 to { i8*, i8* }*
  %38 = getelementptr { i8*, i8* }, { i8*, i8* }* %37, i64 0
  %39 = bitcast { i8*, i8* }* %38 to i8*
  store i64* %14, i64** %15
  %40 = bitcast i64** %15 to i64*
  store i64 %35, i64* %40
  %41 = bitcast i64* %40 to i8*
  %42 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %41, 1
  %43 = bitcast i8* %39 to { i8*, i8* }*
  store { i8*, i8* } %42, { i8*, i8* }* %43
  %44 = getelementptr inbounds i8, i8* %36, i64 0
  %45 = insertvalue { i8*, i64, i64 } undef, i8* %44, 0
  %46 = insertvalue { i8*, i64, i64 } %45, i64 1, 1
  %47 = insertvalue { i8*, i64, i64 } %46, i64 1, 2
  store { i8*, i64, i64 } %47, { i8*, i64, i64 }* %16
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %17, i8* nest undef, { i8*, i64, i64 }* byval %16)
  %48 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %17, i32 0, i32 0
  %49 = load i64, i64* %48
  %50 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %17, i32 0, i32 1
  %51 = load { i8*, i8* }, { i8*, i8* }* %50
  ret void
}

define internal void @"main.main:main.main$1"(i8* nest) #0 {
prologue:
  %1 = alloca i64
  %2 = alloca i8*
  %3 = bitcast i8* %0 to { i8*, i8* }*
  %4 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %3, i32 0, i32 1
  %5 = load i8*, i8** %4
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %6 = bitcast i8* %5 to i8**
  %7 = load i8*, i8** %6
  store i64 7, i64* %1
  %8 = bitcast i64* %1 to i8*
  %9 = bitcast i8** %2 to i64*
  store i8* %8, i8** %2
  %10 = load i64, i64* %9
  call void @fifo_write(i8* %7, i64 %10)
  ret void
}

define internal void @5(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper(i8*) #0 {
entry:
  call void @5(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

define void @__go_init_main(i8*) #0 {
entry:
  call void @main..import(i8* undef)
  ret void
}

attributes #0 = { "disable-tail-calls"="true" "split-stack" }
