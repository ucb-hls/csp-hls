; ModuleID = 'main'
;source_filename = "main"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@"main..import$descriptor" = constant i8* bitcast (void (i8*)* @main..import to i8*)
@"init$guard" = internal global i1 false
@"main.main$descriptor" = constant i8* bitcast (void (i8*)* @main.main to i8*)

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
  br label %.0.entry
}

define void @main.main(i8* nest) #0 {
prologue:
  %1 = alloca { i8* }
  %p = alloca i32
  %2 = alloca i32*
  %3 = alloca i32**
  %4 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %5 = call i8* @fifo_malloc(i8 zeroext 64, i64 0)
  %6 = getelementptr inbounds { i8* }, { i8* }* %1, i32 0, i32 0
  store i8* %5, i8** %6
  %7 = bitcast { i8* }* %1 to i8*
  store i32* %p, i32** %2
  %8 = bitcast i32*** %3 to i8**
  store i32** %2, i32*** %3
  %9 = load i8*, i8** %8
  call void @pthread_create(i8* %9, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %7)
  %10 = call i64 @fifo_read(i8* %5)
  store i64 %10, i64* %4
  %11 = load i64, i64* %4
  ret void
}

define internal void @0(i8*) #0 {
prologue:
  %1 = bitcast i8* %0 to { i8* }*
  %2 = getelementptr inbounds { i8* }, { i8* }* %1, i32 0, i32 0
  %3 = load i8*, i8** %2
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.process(i8* nest undef, i8* %3)
  ret void
}

define internal void @main.process(i8* nest, i8*) #0 {
prologue:
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @fifo_write(i8* %1, i64 7)
  ret void
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
