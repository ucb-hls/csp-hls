; ModuleID = 'main'
; TODO(growly): Does commenting this out break anything?
; ;source_filename = "main"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%FIFO = type {}

@"init$guard" = internal global i1 false
@main.array = external global [8 x [8 x i64]]

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

define internal void @main.init1(i8* nest, %FIFO* %in) #0 {
prologue:
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %13, %.5.for.done ]
  %1 = icmp slt i64 %i, 6
  %2 = zext i1 %1 to i8
  %3 = trunc i8 %2 to i1
  br i1 %3, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %4 = add i64 %i, 0
  %5 = getelementptr [8 x i64], [8 x i64]* getelementptr inbounds ([8 x [8 x i64]], [8 x [8 x i64]]* @main.array, i32 0, i32 0), i64 %4
  %6 = bitcast [8 x i64]* %5 to i8*
  %7 = bitcast i8* %6 to i64*
  %8 = getelementptr i64, i64* %7, i64 %j
  %9 = bitcast i64* %8 to i8*
  %10 = bitcast i8* %9 to i64*
  %11 = load i64, i64* %10
  call void @fifo_write(%FIFO* %in, i64 %11)
  %12 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %13 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %12, %.4.for.body ]
  %14 = icmp slt i64 %j, 8
  %15 = zext i1 %14 to i8
  %16 = trunc i8 %15 to i1
  br i1 %16, label %.4.for.body, label %.5.for.done
}

define internal void @main.init2(i8* nest, %FIFO* %in) #0 {
prologue:
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %13, %.5.for.done ]
  %1 = icmp slt i64 %i, 6
  %2 = zext i1 %1 to i8
  %3 = trunc i8 %2 to i1
  br i1 %3, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %4 = add i64 %i, 1
  %5 = getelementptr [8 x i64], [8 x i64]* getelementptr inbounds ([8 x [8 x i64]], [8 x [8 x i64]]* @main.array, i32 0, i32 0), i64 %4
  %6 = bitcast [8 x i64]* %5 to i8*
  %7 = bitcast i8* %6 to i64*
  %8 = getelementptr i64, i64* %7, i64 %j
  %9 = bitcast i64* %8 to i8*
  %10 = bitcast i8* %9 to i64*
  %11 = load i64, i64* %10
  call void @fifo_write(%FIFO* %in, i64 %11)
  %12 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %13 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %12, %.4.for.body ]
  %14 = icmp slt i64 %j, 8
  %15 = zext i1 %14 to i8
  %16 = trunc i8 %15 to i1
  br i1 %16, label %.4.for.body, label %.5.for.done
}

define internal void @main.init3(i8* nest, %FIFO* %in) #0 {
prologue:
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %13, %.5.for.done ]
  %1 = icmp slt i64 %i, 6
  %2 = zext i1 %1 to i8
  %3 = trunc i8 %2 to i1
  br i1 %3, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %4 = add i64 %i, 2
  %5 = getelementptr [8 x i64], [8 x i64]* getelementptr inbounds ([8 x [8 x i64]], [8 x [8 x i64]]* @main.array, i32 0, i32 0), i64 %4
  %6 = bitcast [8 x i64]* %5 to i8*
  %7 = bitcast i8* %6 to i64*
  %8 = getelementptr i64, i64* %7, i64 %j
  %9 = bitcast i64* %8 to i8*
  %10 = bitcast i8* %9 to i64*
  %11 = load i64, i64* %10
  call void @fifo_write(%FIFO* %in, i64 %11)
  %12 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %13 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %12, %.4.for.body ]
  %14 = icmp slt i64 %j, 8
  %15 = zext i1 %14 to i8
  %16 = trunc i8 %15 to i1
  br i1 %16, label %.4.for.body, label %.5.for.done
}

define void @main.main(i8* nest) #0 {
prologue:
  %1 = alloca { %FIFO* }
  %thread_id = alloca i32
  %2 = alloca i32*
  %3 = alloca i32**
  %4 = alloca { %FIFO* }
  %thread_id1 = alloca i32
  %5 = alloca i32*
  %6 = alloca i32**
  %7 = alloca { %FIFO* }
  %thread_id2 = alloca i32
  %8 = alloca i32*
  %9 = alloca i32**
  %10 = alloca { %FIFO*, %FIFO* }
  %thread_id3 = alloca i32
  %11 = alloca i32*
  %12 = alloca i32**
  %13 = alloca { %FIFO*, %FIFO* }
  %thread_id4 = alloca i32
  %14 = alloca i32*
  %15 = alloca i32**
  %16 = alloca { %FIFO*, %FIFO* }
  %thread_id5 = alloca i32
  %17 = alloca i32*
  %18 = alloca i32**
  %19 = alloca { %FIFO*, %FIFO*, %FIFO*, %FIFO* }
  %thread_id6 = alloca i32
  %20 = alloca i32*
  %21 = alloca i32**
  %22 = alloca i64
  %result = alloca [6 x [6 x i64]]
  %23 = bitcast [6 x [6 x i64]]* %result to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %24 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %25 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %26 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %27 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %28 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %29 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %30 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  %31 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %1, i32 0, i32 0
  store %FIFO* %24, %FIFO** %31
  %32 = bitcast { %FIFO* }* %1 to i8*
  store i32* %thread_id, i32** %2
  %33 = bitcast i32*** %3 to i8**
  store i32** %2, i32*** %3
  %34 = load i8*, i8** %33
  call void @pthread_create(i8* %34, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %32)
  %35 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %4, i32 0, i32 0
  store %FIFO* %25, %FIFO** %35
  %36 = bitcast { %FIFO* }* %4 to i8*
  store i32* %thread_id1, i32** %5
  %37 = bitcast i32*** %6 to i8**
  store i32** %5, i32*** %6
  %38 = load i8*, i8** %37
  call void @pthread_create(i8* %38, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %36)
  %39 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %7, i32 0, i32 0
  store %FIFO* %26, %FIFO** %39
  %40 = bitcast { %FIFO* }* %7 to i8*
  store i32* %thread_id2, i32** %8
  %41 = bitcast i32*** %9 to i8**
  store i32** %8, i32*** %9
  %42 = load i8*, i8** %41
  call void @pthread_create(i8* %42, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.2 to i8*), i8* %40)
  %43 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %10, i32 0, i32 0
  store %FIFO* %24, %FIFO** %43
  %44 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %10, i32 0, i32 1
  store %FIFO* %27, %FIFO** %44
  %45 = bitcast { %FIFO*, %FIFO* }* %10 to i8*
  store i32* %thread_id3, i32** %11
  %46 = bitcast i32*** %12 to i8**
  store i32** %11, i32*** %12
  %47 = load i8*, i8** %46
  call void @pthread_create(i8* %47, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.3 to i8*), i8* %45)
  %48 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %13, i32 0, i32 0
  store %FIFO* %25, %FIFO** %48
  %49 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %13, i32 0, i32 1
  store %FIFO* %28, %FIFO** %49
  %50 = bitcast { %FIFO*, %FIFO* }* %13 to i8*
  store i32* %thread_id4, i32** %14
  %51 = bitcast i32*** %15 to i8**
  store i32** %14, i32*** %15
  %52 = load i8*, i8** %51
  call void @pthread_create(i8* %52, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.4 to i8*), i8* %50)
  %53 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %16, i32 0, i32 0
  store %FIFO* %26, %FIFO** %53
  %54 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %16, i32 0, i32 1
  store %FIFO* %29, %FIFO** %54
  %55 = bitcast { %FIFO*, %FIFO* }* %16 to i8*
  store i32* %thread_id5, i32** %17
  %56 = bitcast i32*** %18 to i8**
  store i32** %17, i32*** %18
  %57 = load i8*, i8** %56
  call void @pthread_create(i8* %57, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.5 to i8*), i8* %55)
  %58 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19, i32 0, i32 0
  store %FIFO* %27, %FIFO** %58
  %59 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19, i32 0, i32 1
  store %FIFO* %28, %FIFO** %59
  %60 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19, i32 0, i32 2
  store %FIFO* %29, %FIFO** %60
  %61 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19, i32 0, i32 3
  store %FIFO* %30, %FIFO** %61
  %62 = bitcast { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19 to i8*
  store i32* %thread_id6, i32** %20
  %63 = bitcast i32*** %21 to i8**
  store i32** %20, i32*** %21
  %64 = load i8*, i8** %63
  call void @pthread_create(i8* %64, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.6 to i8*), i8* %62)
  br label %.9.for.loop

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %76, %.5.for.done ]
  %65 = icmp slt i64 %i, 8
  %66 = zext i1 %65 to i8
  %67 = trunc i8 %66 to i1
  br i1 %67, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %68 = getelementptr [8 x i64], [8 x i64]* getelementptr inbounds ([8 x [8 x i64]], [8 x [8 x i64]]* @main.array, i32 0, i32 0), i64 %i
  %69 = bitcast [8 x i64]* %68 to i8*
  %70 = bitcast i8* %69 to i64*
  %71 = getelementptr i64, i64* %70, i64 %j
  %72 = bitcast i64* %71 to i8*
  %73 = add i64 %i, %j
  %74 = bitcast i8* %72 to i64*
  store i64 %73, i64* %74
  %75 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %76 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %75, %.4.for.body ]
  %77 = icmp slt i64 %j, 8
  %78 = zext i1 %77 to i8
  %79 = trunc i8 %78 to i1
  br i1 %79, label %.4.for.body, label %.5.for.done

.7.for.body:                                      ; preds = %.9.for.loop
  br label %.12.for.loop

.8.for.done:                                      ; preds = %.9.for.loop
  ret void

.9.for.loop:                                      ; preds = %.11.for.done, %.2.for.done
  %i7 = phi i64 [ 0, %.2.for.done ], [ %93, %.11.for.done ]
  %item = phi i64 [ 0, %.2.for.done ], [ %item9, %.11.for.done ]
  %80 = icmp slt i64 %i7, 6
  %81 = zext i1 %80 to i8
  %82 = trunc i8 %81 to i1
  br i1 %82, label %.7.for.body, label %.8.for.done

.10.for.body:                                     ; preds = %.12.for.loop
  %83 = call i64 @fifo_read(%FIFO* %30)
  store i64 %83, i64* %22
  %84 = load i64, i64* %22
  %85 = bitcast i8* %23 to [6 x i64]*
  %86 = getelementptr [6 x i64], [6 x i64]* %85, i64 %i7
  %87 = bitcast [6 x i64]* %86 to i8*
  %88 = bitcast i8* %87 to i64*
  %89 = getelementptr i64, i64* %88, i64 %j8
  %90 = bitcast i64* %89 to i8*
  %91 = bitcast i8* %90 to i64*
  store i64 %84, i64* %91
  %92 = add i64 %j8, 1
  br label %.12.for.loop

.11.for.done:                                     ; preds = %.12.for.loop
  %93 = add i64 %i7, 1
  br label %.9.for.loop

.12.for.loop:                                     ; preds = %.10.for.body, %.7.for.body
  %j8 = phi i64 [ 0, %.7.for.body ], [ %92, %.10.for.body ]
  %item9 = phi i64 [ %item, %.7.for.body ], [ %84, %.10.for.body ]
  %94 = icmp slt i64 %j8, 6
  %95 = zext i1 %94 to i8
  %96 = trunc i8 %95 to i1
  br i1 %96, label %.10.for.body, label %.11.for.done
}

define internal void @0(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO* }*
  %2 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.init1(i8* nest undef, %FIFO* %3)
  ret void
}

define internal i8* @auto_pthread_wrapper(i8*) #0 {
entry:
  call void @0(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @1(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO* }*
  %2 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.init2(i8* nest undef, %FIFO* %3)
  ret void
}

define internal i8* @auto_pthread_wrapper.1(i8*) #0 {
entry:
  call void @1(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @2(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO* }*
  %2 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.init3(i8* nest undef, %FIFO* %3)
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
