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
%FIFO = type {}

@__go_type_hash_identity_descriptor = external global %funcVal
@__go_type_equal_identity_descriptor = external global %funcVal
@"init$guard" = internal global i1 false
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @1, %uncommonType* @4, %commonType* null }
@0 = internal constant [3 x i8] c"int"
@1 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @0, i32 0, i32 0), i64 3 }
@2 = internal constant [3 x i8] c"int"
@3 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @2, i32 0, i32 0), i64 3 }
@4 = internal constant %uncommonType { { i8*, i64 }* @3, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]

declare void @pthread_create(i8*, i8*, i8*, i8*)

declare %FIFO* @fifo_malloc(i8 zeroext, i64)

declare i64 @fifo_read(%FIFO*)

declare void @pthread_exit(i8*)

declare void @fifo_write(%FIFO*, i64)

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
  %messages = alloca %FIFO*
  %1 = alloca { i8*, %FIFO** }
  %2 = alloca { i8* }
  %thread_id = alloca i32
  %3 = alloca i32*
  %4 = alloca i32**
  %5 = alloca { i8*, %FIFO** }
  %6 = alloca { i8* }
  %thread_id1 = alloca i32
  %7 = alloca i32*
  %8 = alloca i32**
  %9 = alloca i64
  %varargs = alloca [1 x { i8*, i8* }]
  %10 = alloca i64
  %11 = alloca { i8*, i64, i64 }
  %12 = alloca { i64, { i8*, i8* } }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %13 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  store %FIFO* %13, %FIFO** %messages
  %14 = getelementptr inbounds { i8*, %FIFO** }, { i8*, %FIFO** }* %1, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$1" to i8*), i8** %14
  %15 = getelementptr inbounds { i8*, %FIFO** }, { i8*, %FIFO** }* %1, i32 0, i32 1
  store %FIFO** %messages, %FIFO*** %15
  %16 = bitcast { i8*, %FIFO** }* %1 to i8*
  %17 = getelementptr inbounds { i8* }, { i8* }* %2, i32 0, i32 0
  store i8* %16, i8** %17
  %18 = bitcast { i8* }* %2 to i8*
  store i32* %thread_id, i32** %3
  %19 = bitcast i32*** %4 to i8**
  store i32** %3, i32*** %4
  %20 = load i8*, i8** %19
  call void @pthread_create(i8* %20, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %18)
  %21 = getelementptr inbounds { i8*, %FIFO** }, { i8*, %FIFO** }* %5, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$2" to i8*), i8** %21
  %22 = getelementptr inbounds { i8*, %FIFO** }, { i8*, %FIFO** }* %5, i32 0, i32 1
  store %FIFO** %messages, %FIFO*** %22
  %23 = bitcast { i8*, %FIFO** }* %5 to i8*
  %24 = getelementptr inbounds { i8* }, { i8* }* %6, i32 0, i32 0
  store i8* %23, i8** %24
  %25 = bitcast { i8* }* %6 to i8*
  store i32* %thread_id1, i32** %7
  %26 = bitcast i32*** %8 to i8**
  store i32** %7, i32*** %8
  %27 = load i8*, i8** %26
  call void @pthread_create(i8* %27, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %25)
  %28 = load %FIFO*, %FIFO** %messages
  %29 = call i64 @fifo_read(%FIFO* %28)
  store i64 %29, i64* %9
  %30 = load i64, i64* %9
  %31 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %32 = bitcast i8* %31 to { i8*, i8* }*
  %33 = getelementptr { i8*, i8* }, { i8*, i8* }* %32, i64 0
  %34 = bitcast { i8*, i8* }* %33 to i8*
  store i64 %30, i64* %10
  %35 = bitcast i64* %10 to i8*
  %36 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %35, 1
  %37 = bitcast i8* %34 to { i8*, i8* }*
  store { i8*, i8* } %36, { i8*, i8* }* %37
  %38 = getelementptr inbounds i8, i8* %31, i64 0
  %39 = insertvalue { i8*, i64, i64 } undef, i8* %38, 0
  %40 = insertvalue { i8*, i64, i64 } %39, i64 1, 1
  %41 = insertvalue { i8*, i64, i64 } %40, i64 1, 2
  store { i8*, i64, i64 } %41, { i8*, i64, i64 }* %11
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %12, i8* nest undef, { i8*, i64, i64 }* byval %11)
  %42 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %12, i32 0, i32 0
  %43 = load i64, i64* %42
  %44 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %12, i32 0, i32 1
  %45 = load { i8*, i8* }, { i8*, i8* }* %44
  ret void
}

define internal void @"main.main:main.main$1"(i8* nest) #0 {
prologue:
  %1 = bitcast i8* %0 to { i8*, %FIFO** }*
  %2 = getelementptr inbounds { i8*, %FIFO** }, { i8*, %FIFO** }* %1, i32 0, i32 1
  %3 = load %FIFO**, %FIFO*** %2
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %4 = load %FIFO*, %FIFO** %3
  call void @fifo_write(%FIFO* %4, i64 7)
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

define internal void @"main.main:main.main$2"(i8* nest) #0 {
prologue:
  %1 = bitcast i8* %0 to { i8*, %FIFO** }*
  %2 = getelementptr inbounds { i8*, %FIFO** }, { i8*, %FIFO** }* %1, i32 0, i32 1
  %3 = load %FIFO**, %FIFO*** %2
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %4 = load %FIFO*, %FIFO** %3
  call void @fifo_write(%FIFO* %4, i64 19)
  ret void
}

define internal void @6(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.1(i8*) #0 {
entry:
  call void @6(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

define void @__go_init_main(i8*) #0 {
entry:
  ret void
}

attributes #0 = { "disable-tail-calls"="true" "split-stack" }
