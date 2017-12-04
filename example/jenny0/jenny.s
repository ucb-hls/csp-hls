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
  %messages = alloca i8*
  %1 = alloca { i8*, i8* }
  %2 = alloca { i8* }
  %p = alloca i32
  %3 = alloca i32*
  %4 = alloca i32**
  %5 = alloca i64
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %6 = bitcast i8** %messages to i8*
  %7 = call i8* @fifo_malloc(i8 zeroext 64, i64 0)
  %8 = bitcast i8* %6 to i8**
  store i8* %7, i8** %8
  %9 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %1, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$1" to i8*), i8** %9
  %10 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %1, i32 0, i32 1
  store i8* %6, i8** %10
  %11 = bitcast { i8*, i8* }* %1 to i8*
  %12 = getelementptr inbounds { i8* }, { i8* }* %2, i32 0, i32 0
  store i8* %11, i8** %12
  %13 = bitcast { i8* }* %2 to i8*
  store i32* %p, i32** %3
  %14 = bitcast i32*** %4 to i8**
  store i32** %3, i32*** %4
  %15 = load i8*, i8** %14
  call void @pthread_create(i8* %15, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %13)
  %16 = bitcast i8* %6 to i8**
  %17 = load i8*, i8** %16
  %18 = call i64 @fifo_read(i8* %17)
  store i64 %18, i64* %5
  %19 = load i64, i64* %5
  ret void
}

define internal void @"main.main:main.main$1"(i8* nest) #0 {
prologue:
  %1 = bitcast i8* %0 to { i8*, i8* }*
  %2 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %1, i32 0, i32 1
  %3 = load i8*, i8** %2
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %4 = bitcast i8* %3 to i8**
  %5 = load i8*, i8** %4
  call void @fifo_write(i8* %5, i64 7)
  ret void
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

define void @__go_init_main(i8*) #0 {
entry:
  ret void
}

attributes #0 = { "disable-tail-calls"="true" "split-stack" }
