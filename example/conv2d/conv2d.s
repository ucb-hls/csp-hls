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
  br label %.0.entry
}

define void @main.main(i8* nest) #0 {
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
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %27 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  store %FIFO* %27, %FIFO** %c1_in
  %28 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  store %FIFO* %28, %FIFO** %c2_in
  %29 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  store %FIFO* %29, %FIFO** %c3_in
  %30 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %31 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %32 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %33 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %34 = bitcast [8 x [8 x i64]]* %array to i8*
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  %35 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$1" to i8*), i8** %35
  %36 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 1
  store %FIFO** %c1_in, %FIFO*** %36
  %37 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 2
  store i8* %34, i8** %37
  %38 = bitcast { i8*, %FIFO**, i8* }* %1 to i8*
  %39 = getelementptr inbounds { i8* }, { i8* }* %2, i32 0, i32 0
  store i8* %38, i8** %39
  %40 = bitcast { i8* }* %2 to i8*
  store i32* %thread_id, i32** %3
  %41 = bitcast i32*** %4 to i8**
  store i32** %3, i32*** %4
  %42 = load i8*, i8** %41
  call void @pthread_create(i8* %42, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %40)
  %43 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %5, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$2" to i8*), i8** %43
  %44 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %5, i32 0, i32 1
  store %FIFO** %c2_in, %FIFO*** %44
  %45 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %5, i32 0, i32 2
  store i8* %34, i8** %45
  %46 = bitcast { i8*, %FIFO**, i8* }* %5 to i8*
  %47 = getelementptr inbounds { i8* }, { i8* }* %6, i32 0, i32 0
  store i8* %46, i8** %47
  %48 = bitcast { i8* }* %6 to i8*
  store i32* %thread_id1, i32** %7
  %49 = bitcast i32*** %8 to i8**
  store i32** %7, i32*** %8
  %50 = load i8*, i8** %49
  call void @pthread_create(i8* %50, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %48)
  %51 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %9, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$3" to i8*), i8** %51
  %52 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %9, i32 0, i32 1
  store %FIFO** %c3_in, %FIFO*** %52
  %53 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %9, i32 0, i32 2
  store i8* %34, i8** %53
  %54 = bitcast { i8*, %FIFO**, i8* }* %9 to i8*
  %55 = getelementptr inbounds { i8* }, { i8* }* %10, i32 0, i32 0
  store i8* %54, i8** %55
  %56 = bitcast { i8* }* %10 to i8*
  store i32* %thread_id2, i32** %11
  %57 = bitcast i32*** %12 to i8**
  store i32** %11, i32*** %12
  %58 = load i8*, i8** %57
  call void @pthread_create(i8* %58, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.2 to i8*), i8* %56)
  %59 = load %FIFO*, %FIFO** %c1_in
  %60 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %13, i32 0, i32 0
  store %FIFO* %59, %FIFO** %60
  %61 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %13, i32 0, i32 1
  store %FIFO* %30, %FIFO** %61
  %62 = bitcast { %FIFO*, %FIFO* }* %13 to i8*
  store i32* %thread_id3, i32** %14
  %63 = bitcast i32*** %15 to i8**
  store i32** %14, i32*** %15
  %64 = load i8*, i8** %63
  call void @pthread_create(i8* %64, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.3 to i8*), i8* %62)
  %65 = load %FIFO*, %FIFO** %c2_in
  %66 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %16, i32 0, i32 0
  store %FIFO* %65, %FIFO** %66
  %67 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %16, i32 0, i32 1
  store %FIFO* %31, %FIFO** %67
  %68 = bitcast { %FIFO*, %FIFO* }* %16 to i8*
  store i32* %thread_id4, i32** %17
  %69 = bitcast i32*** %18 to i8**
  store i32** %17, i32*** %18
  %70 = load i8*, i8** %69
  call void @pthread_create(i8* %70, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.4 to i8*), i8* %68)
  %71 = load %FIFO*, %FIFO** %c3_in
  %72 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %19, i32 0, i32 0
  store %FIFO* %71, %FIFO** %72
  %73 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %19, i32 0, i32 1
  store %FIFO* %32, %FIFO** %73
  %74 = bitcast { %FIFO*, %FIFO* }* %19 to i8*
  store i32* %thread_id5, i32** %20
  %75 = bitcast i32*** %21 to i8**
  store i32** %20, i32*** %21
  %76 = load i8*, i8** %75
  call void @pthread_create(i8* %76, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.5 to i8*), i8* %74)
  %77 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22, i32 0, i32 0
  store %FIFO* %30, %FIFO** %77
  %78 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22, i32 0, i32 1
  store %FIFO* %31, %FIFO** %78
  %79 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22, i32 0, i32 2
  store %FIFO* %32, %FIFO** %79
  %80 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22, i32 0, i32 3
  store %FIFO* %33, %FIFO** %80
  %81 = bitcast { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22 to i8*
  store i32* %thread_id6, i32** %23
  %82 = bitcast i32*** %24 to i8**
  store i32** %23, i32*** %24
  %83 = load i8*, i8** %82
  call void @pthread_create(i8* %83, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.6 to i8*), i8* %81)
  br label %.9.for.loop

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %96, %.5.for.done ]
  %84 = icmp slt i64 %i, 8
  %85 = zext i1 %84 to i8
  %86 = trunc i8 %85 to i1
  br i1 %86, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %87 = bitcast i8* %34 to [8 x i64]*
  %88 = getelementptr [8 x i64], [8 x i64]* %87, i64 %i
  %89 = bitcast [8 x i64]* %88 to i8*
  %90 = bitcast i8* %89 to i64*
  %91 = getelementptr i64, i64* %90, i64 %j
  %92 = bitcast i64* %91 to i8*
  %93 = add i64 %i, %j
  %94 = bitcast i8* %92 to i64*
  store i64 %93, i64* %94
  %95 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %96 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %95, %.4.for.body ]
  %97 = icmp slt i64 %j, 8
  %98 = zext i1 %97 to i8
  %99 = trunc i8 %98 to i1
  br i1 %99, label %.4.for.body, label %.5.for.done

.7.for.body:                                      ; preds = %.9.for.loop
  br label %.12.for.loop

.8.for.done:                                      ; preds = %.9.for.loop
  ret void

.9.for.loop:                                      ; preds = %.11.for.done, %.2.for.done
  %i7 = phi i64 [ 0, %.2.for.done ], [ %113, %.11.for.done ]
  %item = phi i64 [ 0, %.2.for.done ], [ %item9, %.11.for.done ]
  %100 = icmp slt i64 %i7, 6
  %101 = zext i1 %100 to i8
  %102 = trunc i8 %101 to i1
  br i1 %102, label %.7.for.body, label %.8.for.done

.10.for.body:                                     ; preds = %.12.for.loop
  %103 = call i64 @fifo_read(%FIFO* %33)
  store i64 %103, i64* %25
  %104 = load i64, i64* %25
  %105 = bitcast i8* %26 to [6 x i64]*
  %106 = getelementptr [6 x i64], [6 x i64]* %105, i64 %i7
  %107 = bitcast [6 x i64]* %106 to i8*
  %108 = bitcast i8* %107 to i64*
  %109 = getelementptr i64, i64* %108, i64 %j8
  %110 = bitcast i64* %109 to i8*
  %111 = bitcast i8* %110 to i64*
  store i64 %104, i64* %111
  %112 = add i64 %j8, 1
  br label %.12.for.loop

.11.for.done:                                     ; preds = %.12.for.loop
  %113 = add i64 %i7, 1
  br label %.9.for.loop

.12.for.loop:                                     ; preds = %.10.for.body, %.7.for.body
  %j8 = phi i64 [ 0, %.7.for.body ], [ %112, %.10.for.body ]
  %item9 = phi i64 [ %item, %.7.for.body ], [ %104, %.10.for.body ]
  %114 = icmp slt i64 %j8, 6
  %115 = zext i1 %114 to i8
  %116 = trunc i8 %115 to i1
  br i1 %116, label %.10.for.body, label %.11.for.done
}

define internal void @"main.main:main.main$1"(i8* nest) #0 {
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

define internal void @0(i8*) #0 {
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
  call void @0(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @"main.main:main.main$2"(i8* nest) #0 {
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

define internal void @1(i8*) #0 {
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
  call void @1(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @"main.main:main.main$3"(i8* nest) #0 {
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

define internal void @2(i8*) #0 {
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

define internal i8* @auto_pthread_wrapper.2(i8*) #0 {
entry:
  call void @2(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @3(i8*) #0 {
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

define internal void @main.process1(i8* nest, %FIFO* %in, %FIFO* %out) #0 {
prologue:
  %1 = alloca i64
  %2 = alloca i64
  %3 = alloca i64
  %filter_row = alloca [3 x i64]
  %4 = bitcast [3 x i64]* %filter_row to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %5 = bitcast i8* %4 to i64*
  %6 = getelementptr i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i8*
  %8 = bitcast i8* %4 to i64*
  %9 = getelementptr i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8*
  %11 = bitcast i8* %4 to i64*
  %12 = getelementptr i64, i64* %11, i64 2
  %13 = bitcast i64* %12 to i8*
  %14 = bitcast i8* %7 to i64*
  store i64 0, i64* %14
  %15 = bitcast i8* %10 to i64*
  store i64 1, i64* %15
  %16 = bitcast i8* %13 to i64*
  store i64 2, i64* %16
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %17 = call i64 @fifo_read(%FIFO* %in)
  store i64 %17, i64* %1
  %18 = load i64, i64* %1
  %19 = call i64 @fifo_read(%FIFO* %in)
  store i64 %19, i64* %2
  %20 = load i64, i64* %2
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %47, %.5.for.done ]
  %item3 = phi i64 [ 0, %.0.entry ], [ %item31, %.5.for.done ]
  %21 = icmp slt i64 %i, 6
  %22 = zext i1 %21 to i8
  %23 = trunc i8 %22 to i1
  br i1 %23, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %24 = call i64 @fifo_read(%FIFO* %in)
  store i64 %24, i64* %3
  %25 = load i64, i64* %3
  %26 = bitcast i8* %4 to i64*
  %27 = getelementptr i64, i64* %26, i64 0
  %28 = bitcast i64* %27 to i8*
  %29 = bitcast i8* %28 to i64*
  %30 = load i64, i64* %29
  %31 = mul i64 %item1, %30
  %32 = bitcast i8* %4 to i64*
  %33 = getelementptr i64, i64* %32, i64 1
  %34 = bitcast i64* %33 to i8*
  %35 = bitcast i8* %34 to i64*
  %36 = load i64, i64* %35
  %37 = mul i64 %item2, %36
  %38 = add i64 %31, %37
  %39 = bitcast i8* %4 to i64*
  %40 = getelementptr i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8*
  %42 = bitcast i8* %41 to i64*
  %43 = load i64, i64* %42
  %44 = mul i64 %25, %43
  %45 = add i64 %38, %44
  call void @fifo_write(%FIFO* %out, i64 %45)
  %46 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %47 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %item1 = phi i64 [ %18, %.1.for.body ], [ %item2, %.4.for.body ]
  %item2 = phi i64 [ %20, %.1.for.body ], [ %25, %.4.for.body ]
  %j = phi i64 [ 0, %.1.for.body ], [ %46, %.4.for.body ]
  %item31 = phi i64 [ %item3, %.1.for.body ], [ %25, %.4.for.body ]
  %48 = icmp slt i64 %j, 6
  %49 = zext i1 %48 to i8
  %50 = trunc i8 %49 to i1
  br i1 %50, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper.3(i8*) #0 {
entry:
  call void @3(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @4(i8*) #0 {
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

define internal void @main.process2(i8* nest, %FIFO* %in, %FIFO* %out) #0 {
prologue:
  %1 = alloca i64
  %2 = alloca i64
  %3 = alloca i64
  %filter_row = alloca [3 x i64]
  %4 = bitcast [3 x i64]* %filter_row to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %5 = bitcast i8* %4 to i64*
  %6 = getelementptr i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i8*
  %8 = bitcast i8* %4 to i64*
  %9 = getelementptr i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8*
  %11 = bitcast i8* %4 to i64*
  %12 = getelementptr i64, i64* %11, i64 2
  %13 = bitcast i64* %12 to i8*
  %14 = bitcast i8* %7 to i64*
  store i64 3, i64* %14
  %15 = bitcast i8* %10 to i64*
  store i64 4, i64* %15
  %16 = bitcast i8* %13 to i64*
  store i64 5, i64* %16
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %17 = call i64 @fifo_read(%FIFO* %in)
  store i64 %17, i64* %1
  %18 = load i64, i64* %1
  %19 = call i64 @fifo_read(%FIFO* %in)
  store i64 %19, i64* %2
  %20 = load i64, i64* %2
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %47, %.5.for.done ]
  %item3 = phi i64 [ 0, %.0.entry ], [ %item31, %.5.for.done ]
  %21 = icmp slt i64 %i, 6
  %22 = zext i1 %21 to i8
  %23 = trunc i8 %22 to i1
  br i1 %23, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %24 = call i64 @fifo_read(%FIFO* %in)
  store i64 %24, i64* %3
  %25 = load i64, i64* %3
  %26 = bitcast i8* %4 to i64*
  %27 = getelementptr i64, i64* %26, i64 0
  %28 = bitcast i64* %27 to i8*
  %29 = bitcast i8* %28 to i64*
  %30 = load i64, i64* %29
  %31 = mul i64 %item1, %30
  %32 = bitcast i8* %4 to i64*
  %33 = getelementptr i64, i64* %32, i64 1
  %34 = bitcast i64* %33 to i8*
  %35 = bitcast i8* %34 to i64*
  %36 = load i64, i64* %35
  %37 = mul i64 %item2, %36
  %38 = add i64 %31, %37
  %39 = bitcast i8* %4 to i64*
  %40 = getelementptr i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8*
  %42 = bitcast i8* %41 to i64*
  %43 = load i64, i64* %42
  %44 = mul i64 %25, %43
  %45 = add i64 %38, %44
  call void @fifo_write(%FIFO* %out, i64 %45)
  %46 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %47 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %item1 = phi i64 [ %18, %.1.for.body ], [ %item2, %.4.for.body ]
  %item2 = phi i64 [ %20, %.1.for.body ], [ %25, %.4.for.body ]
  %j = phi i64 [ 0, %.1.for.body ], [ %46, %.4.for.body ]
  %item31 = phi i64 [ %item3, %.1.for.body ], [ %25, %.4.for.body ]
  %48 = icmp slt i64 %j, 6
  %49 = zext i1 %48 to i8
  %50 = trunc i8 %49 to i1
  br i1 %50, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper.4(i8*) #0 {
entry:
  call void @4(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
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
  call void @main.process3(i8* nest undef, %FIFO* %3, %FIFO* %5)
  ret void
}

define internal void @main.process3(i8* nest, %FIFO* %in, %FIFO* %out) #0 {
prologue:
  %1 = alloca i64
  %2 = alloca i64
  %3 = alloca i64
  %filter_row = alloca [3 x i64]
  %4 = bitcast [3 x i64]* %filter_row to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %5 = bitcast i8* %4 to i64*
  %6 = getelementptr i64, i64* %5, i64 0
  %7 = bitcast i64* %6 to i8*
  %8 = bitcast i8* %4 to i64*
  %9 = getelementptr i64, i64* %8, i64 1
  %10 = bitcast i64* %9 to i8*
  %11 = bitcast i8* %4 to i64*
  %12 = getelementptr i64, i64* %11, i64 2
  %13 = bitcast i64* %12 to i8*
  %14 = bitcast i8* %7 to i64*
  store i64 6, i64* %14
  %15 = bitcast i8* %10 to i64*
  store i64 7, i64* %15
  %16 = bitcast i8* %13 to i64*
  store i64 8, i64* %16
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %17 = call i64 @fifo_read(%FIFO* %in)
  store i64 %17, i64* %1
  %18 = load i64, i64* %1
  %19 = call i64 @fifo_read(%FIFO* %in)
  store i64 %19, i64* %2
  %20 = load i64, i64* %2
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %47, %.5.for.done ]
  %item3 = phi i64 [ 0, %.0.entry ], [ %item31, %.5.for.done ]
  %21 = icmp slt i64 %i, 6
  %22 = zext i1 %21 to i8
  %23 = trunc i8 %22 to i1
  br i1 %23, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %24 = call i64 @fifo_read(%FIFO* %in)
  store i64 %24, i64* %3
  %25 = load i64, i64* %3
  %26 = bitcast i8* %4 to i64*
  %27 = getelementptr i64, i64* %26, i64 0
  %28 = bitcast i64* %27 to i8*
  %29 = bitcast i8* %28 to i64*
  %30 = load i64, i64* %29
  %31 = mul i64 %item1, %30
  %32 = bitcast i8* %4 to i64*
  %33 = getelementptr i64, i64* %32, i64 1
  %34 = bitcast i64* %33 to i8*
  %35 = bitcast i8* %34 to i64*
  %36 = load i64, i64* %35
  %37 = mul i64 %item2, %36
  %38 = add i64 %31, %37
  %39 = bitcast i8* %4 to i64*
  %40 = getelementptr i64, i64* %39, i64 2
  %41 = bitcast i64* %40 to i8*
  %42 = bitcast i8* %41 to i64*
  %43 = load i64, i64* %42
  %44 = mul i64 %25, %43
  %45 = add i64 %38, %44
  call void @fifo_write(%FIFO* %out, i64 %45)
  %46 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %47 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %item1 = phi i64 [ %18, %.1.for.body ], [ %item2, %.4.for.body ]
  %item2 = phi i64 [ %20, %.1.for.body ], [ %25, %.4.for.body ]
  %j = phi i64 [ 0, %.1.for.body ], [ %46, %.4.for.body ]
  %item31 = phi i64 [ %item3, %.1.for.body ], [ %25, %.4.for.body ]
  %48 = icmp slt i64 %j, 6
  %49 = zext i1 %48 to i8
  %50 = trunc i8 %49 to i1
  br i1 %50, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper.5(i8*) #0 {
entry:
  call void @5(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @6(i8*) #0 {
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

define internal void @main.process4(i8* nest, %FIFO* %in1, %FIFO* %in2, %FIFO* %in3, %FIFO* %out) #0 {
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

define internal i8* @auto_pthread_wrapper.6(i8*) #0 {
entry:
  call void @6(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define void @__go_init_main(i8*) #0 {
entry:
  ret void
}

attributes #0 = { "disable-tail-calls"="true" "split-stack" }
