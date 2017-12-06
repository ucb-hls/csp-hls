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
  %1 = alloca { %FIFO*, %FIFO* }
  %thread_id = alloca i32
  %2 = alloca i32*
  %3 = alloca i32**
  %4 = alloca { %FIFO*, %FIFO* }
  %thread_id1 = alloca i32
  %5 = alloca i32*
  %6 = alloca i32**
  %7 = alloca i64
  %varargs = alloca [1 x { i8*, i8* }]
  %8 = alloca i64
  %9 = alloca { i8*, i64, i64 }
  %10 = alloca { i64, { i8*, i8* } }
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %11 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %12 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %13 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %14 = mul i64 %i, %i
  call void @fifo_write(%FIFO* %11, i64 %14)
  %15 = add i64 %i, 1
  br label %.3.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  %16 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %1, i32 0, i32 0
  store %FIFO* %11, %FIFO** %16
  %17 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %1, i32 0, i32 1
  store %FIFO* %12, %FIFO** %17
  %18 = bitcast { %FIFO*, %FIFO* }* %1 to i8*
  store i32* %thread_id, i32** %2
  %19 = bitcast i32*** %3 to i8**
  store i32** %2, i32*** %3
  %20 = load i8*, i8** %19
  call void @pthread_create(i8* %20, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %18)
  %21 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %4, i32 0, i32 0
  store %FIFO* %12, %FIFO** %21
  %22 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %4, i32 0, i32 1
  store %FIFO* %13, %FIFO** %22
  %23 = bitcast { %FIFO*, %FIFO* }* %4 to i8*
  store i32* %thread_id1, i32** %5
  %24 = bitcast i32*** %6 to i8**
  store i32** %5, i32*** %6
  %25 = load i8*, i8** %24
  call void @pthread_create(i8* %25, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %23)
  br label %.6.for.loop

.3.for.loop:                                      ; preds = %.1.for.body, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %15, %.1.for.body ]
  %26 = icmp slt i64 %i, 10
  %27 = zext i1 %26 to i8
  %28 = trunc i8 %27 to i1
  br i1 %28, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %29 = call i64 @fifo_read(%FIFO* %13)
  store i64 %29, i64* %7
  %30 = load i64, i64* %7
  %31 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %32 = bitcast i8* %31 to { i8*, i8* }*
  %33 = getelementptr { i8*, i8* }, { i8*, i8* }* %32, i64 0
  %34 = bitcast { i8*, i8* }* %33 to i8*
  store i64 %30, i64* %8
  %35 = bitcast i64* %8 to i8*
  %36 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %35, 1
  %37 = bitcast i8* %34 to { i8*, i8* }*
  store { i8*, i8* } %36, { i8*, i8* }* %37
  %38 = getelementptr inbounds i8, i8* %31, i64 0
  %39 = insertvalue { i8*, i64, i64 } undef, i8* %38, 0
  %40 = insertvalue { i8*, i64, i64 } %39, i64 1, 1
  %41 = insertvalue { i8*, i64, i64 } %40, i64 1, 2
  store { i8*, i64, i64 } %41, { i8*, i64, i64 }* %9
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %10, i8* nest undef, { i8*, i64, i64 }* byval %9)
  %42 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %10, i32 0, i32 0
  %43 = load i64, i64* %42
  %44 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %10, i32 0, i32 1
  %45 = load { i8*, i8* }, { i8*, i8* }* %44
  %46 = add i64 %i2, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  ret void

.6.for.loop:                                      ; preds = %.4.for.body, %.2.for.done
  %i2 = phi i64 [ 0, %.2.for.done ], [ %46, %.4.for.body ]
  %47 = icmp slt i64 %i2, 10
  %48 = zext i1 %47 to i8
  %49 = trunc i8 %48 to i1
  br i1 %49, label %.4.for.body, label %.5.for.done
}

define internal void @5(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.process1(i8* nest undef, %FIFO* %3, %FIFO* %5)
  ret void
}

define internal void @main.process1(i8* nest, %FIFO*, %FIFO*) #0 {
prologue:
  %3 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %4 = call i64 @fifo_read(%FIFO* %1)
  store i64 %4, i64* %3
  %5 = load i64, i64* %3
  %6 = mul i64 %5, 2
  %7 = add i64 %6, 1
  call void @fifo_write(%FIFO* %2, i64 %7)
  %8 = add i64 %i, 1
  br label %.3.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.1.for.body, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %8, %.1.for.body ]
  %9 = icmp slt i64 %i, 10
  %10 = zext i1 %9 to i8
  %11 = trunc i8 %10 to i1
  br i1 %11, label %.1.for.body, label %.2.for.done
}

define internal i8* @auto_pthread_wrapper(i8*) #0 {
entry:
  call void @5(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @6(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.process2(i8* nest undef, %FIFO* %3, %FIFO* %5)
  ret void
}

define internal void @main.process2(i8* nest, %FIFO*, %FIFO*) #0 {
prologue:
  %3 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %4 = call i64 @fifo_read(%FIFO* %1)
  store i64 %4, i64* %3
  %5 = load i64, i64* %3
  %6 = sub i64 %5, 1
  %7 = sdiv i64 %6, 2
  call void @fifo_write(%FIFO* %2, i64 %7)
  %8 = add i64 %i, 1
  br label %.3.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.1.for.body, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %8, %.1.for.body ]
  %9 = icmp slt i64 %i, 10
  %10 = zext i1 %9 to i8
  %11 = trunc i8 %10 to i1
  br i1 %11, label %.1.for.body, label %.2.for.done
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
