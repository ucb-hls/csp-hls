; ModuleID = 'main'
; TODO(growly): Does commenting this out break anything?
; source_filename = "main"
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
  %1 = alloca { [5 x %FIFO*] }
  %thread_id = alloca i32
  %2 = alloca i32*
  %3 = alloca i32**
  %4 = alloca i64
  %chans = alloca [5 x %FIFO*]
  %5 = bitcast [5 x %FIFO*]* %chans to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %6 = bitcast i8* %5 to %FIFO**
  %7 = getelementptr %FIFO*, %FIFO** %6, i64 %i
  %8 = bitcast %FIFO** %7 to i8*
  %9 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 0)
  %10 = bitcast i8* %8 to %FIFO**
  store %FIFO* %9, %FIFO** %10
  %11 = add i64 %i, 1
  br label %.3.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  %12 = bitcast i8* %5 to [5 x %FIFO*]*
  %13 = load [5 x %FIFO*], [5 x %FIFO*]* %12
  %14 = getelementptr inbounds { [5 x %FIFO*] }, { [5 x %FIFO*] }* %1, i32 0, i32 0
  store [5 x %FIFO*] %13, [5 x %FIFO*]* %14
  %15 = bitcast { [5 x %FIFO*] }* %1 to i8*
  store i32* %thread_id, i32** %2
  %16 = bitcast i32*** %3 to i8**
  store i32** %2, i32*** %3
  %17 = load i8*, i8** %16
  call void @pthread_create(i8* %17, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %15)
  br label %.6.for.loop

.3.for.loop:                                      ; preds = %.1.for.body, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %11, %.1.for.body ]
  %18 = icmp slt i64 %i, 5
  %19 = zext i1 %18 to i8
  %20 = trunc i8 %19 to i1
  br i1 %20, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %21 = bitcast i8* %5 to %FIFO**
  %22 = getelementptr %FIFO*, %FIFO** %21, i64 %i1
  %23 = bitcast %FIFO** %22 to i8*
  %24 = bitcast i8* %23 to %FIFO**
  %25 = load %FIFO*, %FIFO** %24
  %26 = call i64 @fifo_read(%FIFO* %25)
  store i64 %26, i64* %4
  %27 = load i64, i64* %4
  %28 = add i64 %i1, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  ret void

.6.for.loop:                                      ; preds = %.4.for.body, %.2.for.done
  %i1 = phi i64 [ 0, %.2.for.done ], [ %28, %.4.for.body ]
  %29 = icmp slt i64 %i1, 5
  %30 = zext i1 %29 to i8
  %31 = trunc i8 %30 to i1
  br i1 %31, label %.4.for.body, label %.5.for.done
}

define internal void @0(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { [5 x %FIFO*] }*
  %2 = getelementptr inbounds { [5 x %FIFO*] }, { [5 x %FIFO*] }* %1, i32 0, i32 0
  %3 = load [5 x %FIFO*], [5 x %FIFO*]* %2
  %4 = alloca [5 x %FIFO*]
  br label %entry

entry:                                            ; preds = %prologue
  store [5 x %FIFO*] %3, [5 x %FIFO*]* %4
  call void @main.process(i8* nest undef, [5 x %FIFO*]* byval %4)
  ret void
}

define internal void @main.process(i8* nest, [5 x %FIFO*]* byval) #0 {
prologue:
  %chans = load [5 x %FIFO*], [5 x %FIFO*]* %1
  %chans1 = alloca [5 x %FIFO*]
  %2 = bitcast [5 x %FIFO*]* %chans1 to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %3 = bitcast i8* %2 to [5 x %FIFO*]*
  store [5 x %FIFO*] %chans, [5 x %FIFO*]* %3
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %4 = bitcast i8* %2 to %FIFO**
  %5 = getelementptr %FIFO*, %FIFO** %4, i64 %i
  %6 = bitcast %FIFO** %5 to i8*
  %7 = bitcast i8* %6 to %FIFO**
  %8 = load %FIFO*, %FIFO** %7
  call void @fifo_write(%FIFO* %8, i64 %i)
  %9 = add i64 %i, 1
  br label %.3.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.1.for.body, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %9, %.1.for.body ]
  %10 = icmp slt i64 %i, 5
  %11 = zext i1 %10 to i8
  %12 = trunc i8 %11 to i1
  br i1 %12, label %.1.for.body, label %.2.for.done
}

define internal i8* @auto_pthread_wrapper(i8*) #0 {
entry:
  call void @0(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define void @__go_init_main(i8*) #0 {
entry:
  ret void
}

attributes #0 = { "disable-tail-calls"="true" "split-stack" }
