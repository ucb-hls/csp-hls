; ModuleID = 'main'
; TODO(growly): Does commenting this out break anything?
; ;source_filename = "main"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%FIFO = type {}

@"init$guard" = internal global i1 false

declare void @pthread_create(i8*, i8*, i8*, i8*)

declare %FIFO* @fifo_malloc(i8 zeroext, i64)

declare i64 @fifo_read(%FIFO*)

declare void @pthread_exit(i8*)

declare void @fifo_write(%FIFO*, i64)

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #0

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
  %c1_in = alloca %FIFO*
  %c2_in = alloca %FIFO*
  %c3_in = alloca %FIFO*
  %array = alloca [8 x [8 x i64]]
  %1 = alloca { i8*, %FIFO**, i8* }
  %2 = alloca { i8* }
  %thread_id = alloca i32
  %3 = alloca i32*
  %4 = alloca i32**
  %5 = alloca { i8*, %FIFO**, i8* }
  %6 = alloca { i8* }
  %thread_id1 = alloca i32
  %7 = alloca i32*
  %8 = alloca i32**
  %9 = alloca { i8*, %FIFO**, i8* }
  %10 = alloca { i8* }
  %thread_id2 = alloca i32
  %11 = alloca i32*
  %12 = alloca i32**
  %13 = alloca { %FIFO*, %FIFO* }
  %thread_id3 = alloca i32
  %14 = alloca i32*
  %15 = alloca i32**
  %16 = alloca { %FIFO*, %FIFO* }
  %thread_id4 = alloca i32
  %17 = alloca i32*
  %18 = alloca i32**
  %19 = alloca { %FIFO*, %FIFO* }
  %thread_id5 = alloca i32
  %20 = alloca i32*
  %21 = alloca i32**
  %22 = alloca { %FIFO*, %FIFO*, %FIFO*, %FIFO* }
  %thread_id6 = alloca i32
  %23 = alloca i32*
  %24 = alloca i32**
  %25 = alloca i64
  %result = alloca [6 x [6 x i64]]
  %26 = bitcast [6 x [6 x i64]]* %result to i8*
  call void @llvm.memset.p0i8.i64(i8* %26, i8 0, i64 mul (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 36), i32 1, i1 false)
  %27 = bitcast [6 x [6 x i64]]* %result to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %28 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  store %FIFO* %28, %FIFO** %c1_in
  %29 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  store %FIFO* %29, %FIFO** %c2_in
  %30 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  store %FIFO* %30, %FIFO** %c3_in
  %31 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %32 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %33 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %34 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %35 = bitcast [8 x [8 x i64]]* %array to i8*
  call void @llvm.memset.p0i8.i64(i8* %27, i8 0, i64 mul (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 36), i32 1, i1 false)
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  %36 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$1" to i8*), i8** %36
  %37 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 1
  store %FIFO** %c1_in, %FIFO*** %37
  %38 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 2
  store i8* %35, i8** %38
  %39 = bitcast { i8*, %FIFO**, i8* }* %1 to i8*
  %40 = getelementptr inbounds { i8* }, { i8* }* %2, i32 0, i32 0
  store i8* %39, i8** %40
  %41 = bitcast { i8* }* %2 to i8*
  store i32* %thread_id, i32** %3
  %42 = bitcast i32*** %4 to i8**
  store i32** %3, i32*** %4
  %43 = load i8*, i8** %42
  call void @pthread_create(i8* %43, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %41)
  %44 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %5, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$2" to i8*), i8** %44
  %45 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %5, i32 0, i32 1
  store %FIFO** %c2_in, %FIFO*** %45
  %46 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %5, i32 0, i32 2
  store i8* %35, i8** %46
  %47 = bitcast { i8*, %FIFO**, i8* }* %5 to i8*
  %48 = getelementptr inbounds { i8* }, { i8* }* %6, i32 0, i32 0
  store i8* %47, i8** %48
  %49 = bitcast { i8* }* %6 to i8*
  store i32* %thread_id1, i32** %7
  %50 = bitcast i32*** %8 to i8**
  store i32** %7, i32*** %8
  %51 = load i8*, i8** %50
  call void @pthread_create(i8* %51, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %49)
  %52 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %9, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$3" to i8*), i8** %52
  %53 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %9, i32 0, i32 1
  store %FIFO** %c3_in, %FIFO*** %53
  %54 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %9, i32 0, i32 2
  store i8* %35, i8** %54
  %55 = bitcast { i8*, %FIFO**, i8* }* %9 to i8*
  %56 = getelementptr inbounds { i8* }, { i8* }* %10, i32 0, i32 0
  store i8* %55, i8** %56
  %57 = bitcast { i8* }* %10 to i8*
  store i32* %thread_id2, i32** %11
  %58 = bitcast i32*** %12 to i8**
  store i32** %11, i32*** %12
  %59 = load i8*, i8** %58
  call void @pthread_create(i8* %59, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.2 to i8*), i8* %57)
  %60 = load %FIFO*, %FIFO** %c1_in
  %61 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %13, i32 0, i32 0
  store %FIFO* %60, %FIFO** %61
  %62 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %13, i32 0, i32 1
  store %FIFO* %31, %FIFO** %62
  %63 = bitcast { %FIFO*, %FIFO* }* %13 to i8*
  store i32* %thread_id3, i32** %14
  %64 = bitcast i32*** %15 to i8**
  store i32** %14, i32*** %15
  %65 = load i8*, i8** %64
  call void @pthread_create(i8* %65, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.3 to i8*), i8* %63)
  %66 = load %FIFO*, %FIFO** %c2_in
  %67 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %16, i32 0, i32 0
  store %FIFO* %66, %FIFO** %67
  %68 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %16, i32 0, i32 1
  store %FIFO* %32, %FIFO** %68
  %69 = bitcast { %FIFO*, %FIFO* }* %16 to i8*
  store i32* %thread_id4, i32** %17
  %70 = bitcast i32*** %18 to i8**
  store i32** %17, i32*** %18
  %71 = load i8*, i8** %70
  call void @pthread_create(i8* %71, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.4 to i8*), i8* %69)
  %72 = load %FIFO*, %FIFO** %c3_in
  %73 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %19, i32 0, i32 0
  store %FIFO* %72, %FIFO** %73
  %74 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %19, i32 0, i32 1
  store %FIFO* %33, %FIFO** %74
  %75 = bitcast { %FIFO*, %FIFO* }* %19 to i8*
  store i32* %thread_id5, i32** %20
  %76 = bitcast i32*** %21 to i8**
  store i32** %20, i32*** %21
  %77 = load i8*, i8** %76
  call void @pthread_create(i8* %77, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.5 to i8*), i8* %75)
  %78 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22, i32 0, i32 0
  store %FIFO* %31, %FIFO** %78
  %79 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22, i32 0, i32 1
  store %FIFO* %32, %FIFO** %79
  %80 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22, i32 0, i32 2
  store %FIFO* %33, %FIFO** %80
  %81 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22, i32 0, i32 3
  store %FIFO* %34, %FIFO** %81
  %82 = bitcast { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22 to i8*
  store i32* %thread_id6, i32** %23
  %83 = bitcast i32*** %24 to i8**
  store i32** %23, i32*** %24
  %84 = load i8*, i8** %83
  call void @pthread_create(i8* %84, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.6 to i8*), i8* %82)
  br label %.9.for.loop

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %97, %.5.for.done ]
  %85 = icmp slt i64 %i, 8
  %86 = zext i1 %85 to i8
  %87 = trunc i8 %86 to i1
  br i1 %87, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %88 = bitcast i8* %35 to [8 x i64]*
  %89 = getelementptr [8 x i64], [8 x i64]* %88, i64 %i
  %90 = bitcast [8 x i64]* %89 to i8*
  %91 = bitcast i8* %90 to i64*
  %92 = getelementptr i64, i64* %91, i64 %j
  %93 = bitcast i64* %92 to i8*
  %94 = add i64 %i, %j
  %95 = bitcast i8* %93 to i64*
  store i64 %94, i64* %95
  %96 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %97 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %96, %.4.for.body ]
  %98 = icmp slt i64 %j, 8
  %99 = zext i1 %98 to i8
  %100 = trunc i8 %99 to i1
  br i1 %100, label %.4.for.body, label %.5.for.done

.7.for.body:                                      ; preds = %.9.for.loop
  br label %.12.for.loop

.8.for.done:                                      ; preds = %.9.for.loop
  ret void

.9.for.loop:                                      ; preds = %.11.for.done, %.2.for.done
  %i7 = phi i64 [ 0, %.2.for.done ], [ %114, %.11.for.done ]
  %item = phi i64 [ 0, %.2.for.done ], [ %item9, %.11.for.done ]
  %101 = icmp slt i64 %i7, 6
  %102 = zext i1 %101 to i8
  %103 = trunc i8 %102 to i1
  br i1 %103, label %.7.for.body, label %.8.for.done

.10.for.body:                                     ; preds = %.12.for.loop
  %104 = call i64 @fifo_read(%FIFO* %34)
  store i64 %104, i64* %25
  %105 = load i64, i64* %25
  %106 = bitcast i8* %27 to [6 x i64]*
  %107 = getelementptr [6 x i64], [6 x i64]* %106, i64 %i7
  %108 = bitcast [6 x i64]* %107 to i8*
  %109 = bitcast i8* %108 to i64*
  %110 = getelementptr i64, i64* %109, i64 %j8
  %111 = bitcast i64* %110 to i8*
  %112 = bitcast i8* %111 to i64*
  store i64 %105, i64* %112
  %113 = add i64 %j8, 1
  br label %.12.for.loop

.11.for.done:                                     ; preds = %.12.for.loop
  %114 = add i64 %i7, 1
  br label %.9.for.loop

.12.for.loop:                                     ; preds = %.10.for.body, %.7.for.body
  %j8 = phi i64 [ 0, %.7.for.body ], [ %113, %.10.for.body ]
  %item9 = phi i64 [ %item, %.7.for.body ], [ %105, %.10.for.body ]
  %115 = icmp slt i64 %j8, 6
  %116 = zext i1 %115 to i8
  %117 = trunc i8 %116 to i1
  br i1 %117, label %.10.for.body, label %.11.for.done
}

define internal void @"main.main:main.main$1"(i8* nest) #1 {
prologue:
  %1 = bitcast i8* %0 to { i8*, %FIFO**, i8* }*
  %2 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 1
  %3 = load %FIFO**, %FIFO*** %2
  %4 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 2
  %5 = load i8*, i8** %4
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %20, %.5.for.done ]
  %6 = icmp slt i64 %i, 6
  %7 = zext i1 %6 to i8
  %8 = trunc i8 %7 to i1
  br i1 %8, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %9 = load %FIFO*, %FIFO** %3
  %10 = add i64 %i, 0
  %11 = bitcast i8* %5 to [8 x i64]*
  %12 = getelementptr [8 x i64], [8 x i64]* %11, i64 %10
  %13 = bitcast [8 x i64]* %12 to i8*
  %14 = bitcast i8* %13 to i64*
  %15 = getelementptr i64, i64* %14, i64 %j
  %16 = bitcast i64* %15 to i8*
  %17 = bitcast i8* %16 to i64*
  %18 = load i64, i64* %17
  call void @fifo_write(%FIFO* %9, i64 %18)
  %19 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %20 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %19, %.4.for.body ]
  %21 = icmp slt i64 %j, 8
  %22 = zext i1 %21 to i8
  %23 = trunc i8 %22 to i1
  br i1 %23, label %.4.for.body, label %.5.for.done
}

define internal void @0(i8*) #1 {
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

define internal i8* @auto_pthread_wrapper(i8*) #1 {
entry:
  call void @0(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @"main.main:main.main$2"(i8* nest) #1 {
prologue:
  %1 = bitcast i8* %0 to { i8*, %FIFO**, i8* }*
  %2 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 1
  %3 = load %FIFO**, %FIFO*** %2
  %4 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 2
  %5 = load i8*, i8** %4
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %20, %.5.for.done ]
  %6 = icmp slt i64 %i, 6
  %7 = zext i1 %6 to i8
  %8 = trunc i8 %7 to i1
  br i1 %8, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %9 = load %FIFO*, %FIFO** %3
  %10 = add i64 %i, 1
  %11 = bitcast i8* %5 to [8 x i64]*
  %12 = getelementptr [8 x i64], [8 x i64]* %11, i64 %10
  %13 = bitcast [8 x i64]* %12 to i8*
  %14 = bitcast i8* %13 to i64*
  %15 = getelementptr i64, i64* %14, i64 %j
  %16 = bitcast i64* %15 to i8*
  %17 = bitcast i8* %16 to i64*
  %18 = load i64, i64* %17
  call void @fifo_write(%FIFO* %9, i64 %18)
  %19 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %20 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %19, %.4.for.body ]
  %21 = icmp slt i64 %j, 8
  %22 = zext i1 %21 to i8
  %23 = trunc i8 %22 to i1
  br i1 %23, label %.4.for.body, label %.5.for.done
}

define internal void @1(i8*) #1 {
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

define internal i8* @auto_pthread_wrapper.1(i8*) #1 {
entry:
  call void @1(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @"main.main:main.main$3"(i8* nest) #1 {
prologue:
  %1 = bitcast i8* %0 to { i8*, %FIFO**, i8* }*
  %2 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 1
  %3 = load %FIFO**, %FIFO*** %2
  %4 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 2
  %5 = load i8*, i8** %4
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %20, %.5.for.done ]
  %6 = icmp slt i64 %i, 6
  %7 = zext i1 %6 to i8
  %8 = trunc i8 %7 to i1
  br i1 %8, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %9 = load %FIFO*, %FIFO** %3
  %10 = add i64 %i, 2
  %11 = bitcast i8* %5 to [8 x i64]*
  %12 = getelementptr [8 x i64], [8 x i64]* %11, i64 %10
  %13 = bitcast [8 x i64]* %12 to i8*
  %14 = bitcast i8* %13 to i64*
  %15 = getelementptr i64, i64* %14, i64 %j
  %16 = bitcast i64* %15 to i8*
  %17 = bitcast i8* %16 to i64*
  %18 = load i64, i64* %17
  call void @fifo_write(%FIFO* %9, i64 %18)
  %19 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %20 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %19, %.4.for.body ]
  %21 = icmp slt i64 %j, 8
  %22 = zext i1 %21 to i8
  %23 = trunc i8 %22 to i1
  br i1 %23, label %.4.for.body, label %.5.for.done
}

define internal void @2(i8*) #1 {
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

define internal i8* @auto_pthread_wrapper.2(i8*) #1 {
entry:
  call void @2(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @3(i8*) #1 {
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

define internal void @main.process1(i8* nest, %FIFO* %in, %FIFO* %out) #1 {
prologue:
  %1 = alloca i64
  %2 = alloca i64
  %3 = alloca i64
  %filter_row = alloca [3 x i64]
  %4 = bitcast [3 x i64]* %filter_row to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 mul nuw (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 3), i32 1, i1 false)
  %5 = bitcast [3 x i64]* %filter_row to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 mul nuw (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 3), i32 1, i1 false)
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr i64, i64* %6, i64 0
  %8 = bitcast i64* %7 to i8*
  %9 = bitcast i8* %5 to i64*
  %10 = getelementptr i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i8*
  %12 = bitcast i8* %5 to i64*
  %13 = getelementptr i64, i64* %12, i64 2
  %14 = bitcast i64* %13 to i8*
  %15 = bitcast i8* %8 to i64*
  store i64 0, i64* %15
  %16 = bitcast i8* %11 to i64*
  store i64 1, i64* %16
  %17 = bitcast i8* %14 to i64*
  store i64 2, i64* %17
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %18 = call i64 @fifo_read(%FIFO* %in)
  store i64 %18, i64* %1
  %19 = load i64, i64* %1
  %20 = call i64 @fifo_read(%FIFO* %in)
  store i64 %20, i64* %2
  %21 = load i64, i64* %2
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %48, %.5.for.done ]
  %item3 = phi i64 [ 0, %.0.entry ], [ %item31, %.5.for.done ]
  %22 = icmp slt i64 %i, 6
  %23 = zext i1 %22 to i8
  %24 = trunc i8 %23 to i1
  br i1 %24, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %25 = call i64 @fifo_read(%FIFO* %in)
  store i64 %25, i64* %3
  %26 = load i64, i64* %3
  %27 = bitcast i8* %5 to i64*
  %28 = getelementptr i64, i64* %27, i64 0
  %29 = bitcast i64* %28 to i8*
  %30 = bitcast i8* %29 to i64*
  %31 = load i64, i64* %30
  %32 = mul i64 %item1, %31
  %33 = bitcast i8* %5 to i64*
  %34 = getelementptr i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i8*
  %36 = bitcast i8* %35 to i64*
  %37 = load i64, i64* %36
  %38 = mul i64 %item2, %37
  %39 = add i64 %32, %38
  %40 = bitcast i8* %5 to i64*
  %41 = getelementptr i64, i64* %40, i64 2
  %42 = bitcast i64* %41 to i8*
  %43 = bitcast i8* %42 to i64*
  %44 = load i64, i64* %43
  %45 = mul i64 %26, %44
  %46 = add i64 %39, %45
  call void @fifo_write(%FIFO* %out, i64 %46)
  %47 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %48 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %item1 = phi i64 [ %19, %.1.for.body ], [ %item2, %.4.for.body ]
  %item2 = phi i64 [ %21, %.1.for.body ], [ %26, %.4.for.body ]
  %j = phi i64 [ 0, %.1.for.body ], [ %47, %.4.for.body ]
  %item31 = phi i64 [ %item3, %.1.for.body ], [ %26, %.4.for.body ]
  %49 = icmp slt i64 %j, 6
  %50 = zext i1 %49 to i8
  %51 = trunc i8 %50 to i1
  br i1 %51, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper.3(i8*) #1 {
entry:
  call void @3(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @4(i8*) #1 {
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

define internal void @main.process2(i8* nest, %FIFO* %in, %FIFO* %out) #1 {
prologue:
  %1 = alloca i64
  %2 = alloca i64
  %3 = alloca i64
  %filter_row = alloca [3 x i64]
  %4 = bitcast [3 x i64]* %filter_row to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 mul nuw (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 3), i32 1, i1 false)
  %5 = bitcast [3 x i64]* %filter_row to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 mul nuw (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 3), i32 1, i1 false)
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr i64, i64* %6, i64 0
  %8 = bitcast i64* %7 to i8*
  %9 = bitcast i8* %5 to i64*
  %10 = getelementptr i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i8*
  %12 = bitcast i8* %5 to i64*
  %13 = getelementptr i64, i64* %12, i64 2
  %14 = bitcast i64* %13 to i8*
  %15 = bitcast i8* %8 to i64*
  store i64 3, i64* %15
  %16 = bitcast i8* %11 to i64*
  store i64 4, i64* %16
  %17 = bitcast i8* %14 to i64*
  store i64 5, i64* %17
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %18 = call i64 @fifo_read(%FIFO* %in)
  store i64 %18, i64* %1
  %19 = load i64, i64* %1
  %20 = call i64 @fifo_read(%FIFO* %in)
  store i64 %20, i64* %2
  %21 = load i64, i64* %2
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %48, %.5.for.done ]
  %item3 = phi i64 [ 0, %.0.entry ], [ %item31, %.5.for.done ]
  %22 = icmp slt i64 %i, 6
  %23 = zext i1 %22 to i8
  %24 = trunc i8 %23 to i1
  br i1 %24, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %25 = call i64 @fifo_read(%FIFO* %in)
  store i64 %25, i64* %3
  %26 = load i64, i64* %3
  %27 = bitcast i8* %5 to i64*
  %28 = getelementptr i64, i64* %27, i64 0
  %29 = bitcast i64* %28 to i8*
  %30 = bitcast i8* %29 to i64*
  %31 = load i64, i64* %30
  %32 = mul i64 %item1, %31
  %33 = bitcast i8* %5 to i64*
  %34 = getelementptr i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i8*
  %36 = bitcast i8* %35 to i64*
  %37 = load i64, i64* %36
  %38 = mul i64 %item2, %37
  %39 = add i64 %32, %38
  %40 = bitcast i8* %5 to i64*
  %41 = getelementptr i64, i64* %40, i64 2
  %42 = bitcast i64* %41 to i8*
  %43 = bitcast i8* %42 to i64*
  %44 = load i64, i64* %43
  %45 = mul i64 %26, %44
  %46 = add i64 %39, %45
  call void @fifo_write(%FIFO* %out, i64 %46)
  %47 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %48 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %item1 = phi i64 [ %19, %.1.for.body ], [ %item2, %.4.for.body ]
  %item2 = phi i64 [ %21, %.1.for.body ], [ %26, %.4.for.body ]
  %j = phi i64 [ 0, %.1.for.body ], [ %47, %.4.for.body ]
  %item31 = phi i64 [ %item3, %.1.for.body ], [ %26, %.4.for.body ]
  %49 = icmp slt i64 %j, 6
  %50 = zext i1 %49 to i8
  %51 = trunc i8 %50 to i1
  br i1 %51, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper.4(i8*) #1 {
entry:
  call void @4(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @5(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.process3(i8* nest undef, %FIFO* %3, %FIFO* %5)
  ret void
}

define internal void @main.process3(i8* nest, %FIFO* %in, %FIFO* %out) #1 {
prologue:
  %1 = alloca i64
  %2 = alloca i64
  %3 = alloca i64
  %filter_row = alloca [3 x i64]
  %4 = bitcast [3 x i64]* %filter_row to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 mul nuw (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 3), i32 1, i1 false)
  %5 = bitcast [3 x i64]* %filter_row to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 mul nuw (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 3), i32 1, i1 false)
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr i64, i64* %6, i64 0
  %8 = bitcast i64* %7 to i8*
  %9 = bitcast i8* %5 to i64*
  %10 = getelementptr i64, i64* %9, i64 1
  %11 = bitcast i64* %10 to i8*
  %12 = bitcast i8* %5 to i64*
  %13 = getelementptr i64, i64* %12, i64 2
  %14 = bitcast i64* %13 to i8*
  %15 = bitcast i8* %8 to i64*
  store i64 6, i64* %15
  %16 = bitcast i8* %11 to i64*
  store i64 7, i64* %16
  %17 = bitcast i8* %14 to i64*
  store i64 8, i64* %17
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %18 = call i64 @fifo_read(%FIFO* %in)
  store i64 %18, i64* %1
  %19 = load i64, i64* %1
  %20 = call i64 @fifo_read(%FIFO* %in)
  store i64 %20, i64* %2
  %21 = load i64, i64* %2
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %48, %.5.for.done ]
  %item3 = phi i64 [ 0, %.0.entry ], [ %item31, %.5.for.done ]
  %22 = icmp slt i64 %i, 6
  %23 = zext i1 %22 to i8
  %24 = trunc i8 %23 to i1
  br i1 %24, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %25 = call i64 @fifo_read(%FIFO* %in)
  store i64 %25, i64* %3
  %26 = load i64, i64* %3
  %27 = bitcast i8* %5 to i64*
  %28 = getelementptr i64, i64* %27, i64 0
  %29 = bitcast i64* %28 to i8*
  %30 = bitcast i8* %29 to i64*
  %31 = load i64, i64* %30
  %32 = mul i64 %item1, %31
  %33 = bitcast i8* %5 to i64*
  %34 = getelementptr i64, i64* %33, i64 1
  %35 = bitcast i64* %34 to i8*
  %36 = bitcast i8* %35 to i64*
  %37 = load i64, i64* %36
  %38 = mul i64 %item2, %37
  %39 = add i64 %32, %38
  %40 = bitcast i8* %5 to i64*
  %41 = getelementptr i64, i64* %40, i64 2
  %42 = bitcast i64* %41 to i8*
  %43 = bitcast i8* %42 to i64*
  %44 = load i64, i64* %43
  %45 = mul i64 %26, %44
  %46 = add i64 %39, %45
  call void @fifo_write(%FIFO* %out, i64 %46)
  %47 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %48 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %item1 = phi i64 [ %19, %.1.for.body ], [ %item2, %.4.for.body ]
  %item2 = phi i64 [ %21, %.1.for.body ], [ %26, %.4.for.body ]
  %j = phi i64 [ 0, %.1.for.body ], [ %47, %.4.for.body ]
  %item31 = phi i64 [ %item3, %.1.for.body ], [ %26, %.4.for.body ]
  %49 = icmp slt i64 %j, 6
  %50 = zext i1 %49 to i8
  %51 = trunc i8 %50 to i1
  br i1 %51, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper.5(i8*) #1 {
entry:
  call void @5(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @6(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO*, %FIFO*, %FIFO*, %FIFO* }*
  %2 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  %4 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 1
  %5 = load %FIFO*, %FIFO** %4
  %6 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 2
  %7 = load %FIFO*, %FIFO** %6
  %8 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %1, i32 0, i32 3
  %9 = load %FIFO*, %FIFO** %8
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.process4(i8* nest undef, %FIFO* %3, %FIFO* %5, %FIFO* %7, %FIFO* %9)
  ret void
}

define internal void @main.process4(i8* nest, %FIFO* %in1, %FIFO* %in2, %FIFO* %in3, %FIFO* %out) #1 {
prologue:
  %1 = alloca i64
  %2 = alloca i64
  %3 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %16, %.5.for.done ]
  %item1 = phi i64 [ 0, %.0.entry ], [ %item11, %.5.for.done ]
  %item2 = phi i64 [ 0, %.0.entry ], [ %item22, %.5.for.done ]
  %item3 = phi i64 [ 0, %.0.entry ], [ %item33, %.5.for.done ]
  %4 = icmp slt i64 %i, 6
  %5 = zext i1 %4 to i8
  %6 = trunc i8 %5 to i1
  br i1 %6, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %7 = call i64 @fifo_read(%FIFO* %in1)
  store i64 %7, i64* %1
  %8 = load i64, i64* %1
  %9 = call i64 @fifo_read(%FIFO* %in2)
  store i64 %9, i64* %2
  %10 = load i64, i64* %2
  %11 = call i64 @fifo_read(%FIFO* %in3)
  store i64 %11, i64* %3
  %12 = load i64, i64* %3
  %13 = add i64 %8, %10
  %14 = add i64 %13, %12
  call void @fifo_write(%FIFO* %out, i64 %14)
  %15 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %16 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %15, %.4.for.body ]
  %item11 = phi i64 [ %item1, %.1.for.body ], [ %8, %.4.for.body ]
  %item22 = phi i64 [ %item2, %.1.for.body ], [ %10, %.4.for.body ]
  %item33 = phi i64 [ %item3, %.1.for.body ], [ %12, %.4.for.body ]
  %17 = icmp slt i64 %j, 6
  %18 = zext i1 %17 to i8
  %19 = trunc i8 %18 to i1
  br i1 %19, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper.6(i8*) #1 {
entry:
  call void @6(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define void @__go_init_main(i8*) #1 {
entry:
  ret void
}

attributes #0 = { argmemonly nounwind }
attributes #1 = { "disable-tail-calls"="true" "split-stack" }
