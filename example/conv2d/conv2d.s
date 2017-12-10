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

@__go_type_hash_string_descriptor = external global %funcVal
@__go_type_equal_string_descriptor = external global %funcVal
@__go_type_hash_identity_descriptor = external global %funcVal
@__go_type_equal_identity_descriptor = external global %funcVal
@"init$guard" = internal global i1 false
@main.array = external global [1024 x [1024 x i64]]
@0 = internal global [10 x i8] c"checksum: "
@__go_tdn_string = linkonce_odr constant %commonType { i8 24, i8 8, i8 8, i64 16, i32 100666096, %funcVal* @__go_type_hash_string_descriptor, %funcVal* @__go_type_equal_string_descriptor, i8* bitcast ([4 x i8*]* @"__go_tdn_string$gc" to i8*), { i8*, i64 }* @7, %uncommonType* @10, %commonType* null }
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @2, %uncommonType* @5, %commonType* null }
@1 = internal constant [3 x i8] c"int"
@2 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @1, i32 0, i32 0), i64 3 }
@3 = internal constant [3 x i8] c"int"
@4 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @3, i32 0, i32 0), i64 3 }
@5 = internal constant %uncommonType { { i8*, i64 }* @4, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]
@6 = internal constant [6 x i8] c"string"
@7 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @6, i32 0, i32 0), i64 6 }
@8 = internal constant [6 x i8] c"string"
@9 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @8, i32 0, i32 0), i64 6 }
@10 = internal constant %uncommonType { { i8*, i64 }* @9, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_string$gc" = linkonce_odr constant [4 x i8*] [i8* inttoptr (i64 16 to i8*), i8* inttoptr (i64 7 to i8*), i8* null, i8* null]

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
  %1 = icmp slt i64 %i, 1022
  %2 = zext i1 %1 to i8
  %3 = trunc i8 %2 to i1
  br i1 %3, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %4 = add i64 %i, 0
  %5 = getelementptr [1024 x i64], [1024 x i64]* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @main.array, i32 0, i32 0), i64 %4
  %6 = bitcast [1024 x i64]* %5 to i8*
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
  %14 = icmp slt i64 %j, 1024
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
  %1 = icmp slt i64 %i, 1022
  %2 = zext i1 %1 to i8
  %3 = trunc i8 %2 to i1
  br i1 %3, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %4 = add i64 %i, 1
  %5 = getelementptr [1024 x i64], [1024 x i64]* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @main.array, i32 0, i32 0), i64 %4
  %6 = bitcast [1024 x i64]* %5 to i8*
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
  %14 = icmp slt i64 %j, 1024
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
  %1 = icmp slt i64 %i, 1022
  %2 = zext i1 %1 to i8
  %3 = trunc i8 %2 to i1
  br i1 %3, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %4 = add i64 %i, 2
  %5 = getelementptr [1024 x i64], [1024 x i64]* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @main.array, i32 0, i32 0), i64 %4
  %6 = bitcast [1024 x i64]* %5 to i8*
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
  %14 = icmp slt i64 %j, 1024
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
  %varargs = alloca [2 x { i8*, i8* }]
  %23 = alloca { i8*, i64 }
  %24 = alloca i64
  %25 = alloca { i8*, i64, i64 }
  %26 = alloca { i64, { i8*, i8* } }
  %result = alloca [1022 x [1022 x i64]]
  %27 = bitcast [1022 x [1022 x i64]]* %result to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %28 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %29 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %30 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %31 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %32 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %33 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %34 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  %35 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %1, i32 0, i32 0
  store %FIFO* %28, %FIFO** %35
  %36 = bitcast { %FIFO* }* %1 to i8*
  store i32* %thread_id, i32** %2
  %37 = bitcast i32*** %3 to i8**
  store i32** %2, i32*** %3
  %38 = load i8*, i8** %37
  call void @pthread_create(i8* %38, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %36)
  %39 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %4, i32 0, i32 0
  store %FIFO* %29, %FIFO** %39
  %40 = bitcast { %FIFO* }* %4 to i8*
  store i32* %thread_id1, i32** %5
  %41 = bitcast i32*** %6 to i8**
  store i32** %5, i32*** %6
  %42 = load i8*, i8** %41
  call void @pthread_create(i8* %42, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %40)
  %43 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %7, i32 0, i32 0
  store %FIFO* %30, %FIFO** %43
  %44 = bitcast { %FIFO* }* %7 to i8*
  store i32* %thread_id2, i32** %8
  %45 = bitcast i32*** %9 to i8**
  store i32** %8, i32*** %9
  %46 = load i8*, i8** %45
  call void @pthread_create(i8* %46, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.2 to i8*), i8* %44)
  %47 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %10, i32 0, i32 0
  store %FIFO* %28, %FIFO** %47
  %48 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %10, i32 0, i32 1
  store %FIFO* %31, %FIFO** %48
  %49 = bitcast { %FIFO*, %FIFO* }* %10 to i8*
  store i32* %thread_id3, i32** %11
  %50 = bitcast i32*** %12 to i8**
  store i32** %11, i32*** %12
  %51 = load i8*, i8** %50
  call void @pthread_create(i8* %51, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.3 to i8*), i8* %49)
  %52 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %13, i32 0, i32 0
  store %FIFO* %29, %FIFO** %52
  %53 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %13, i32 0, i32 1
  store %FIFO* %32, %FIFO** %53
  %54 = bitcast { %FIFO*, %FIFO* }* %13 to i8*
  store i32* %thread_id4, i32** %14
  %55 = bitcast i32*** %15 to i8**
  store i32** %14, i32*** %15
  %56 = load i8*, i8** %55
  call void @pthread_create(i8* %56, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.4 to i8*), i8* %54)
  %57 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %16, i32 0, i32 0
  store %FIFO* %30, %FIFO** %57
  %58 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %16, i32 0, i32 1
  store %FIFO* %33, %FIFO** %58
  %59 = bitcast { %FIFO*, %FIFO* }* %16 to i8*
  store i32* %thread_id5, i32** %17
  %60 = bitcast i32*** %18 to i8**
  store i32** %17, i32*** %18
  %61 = load i8*, i8** %60
  call void @pthread_create(i8* %61, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.5 to i8*), i8* %59)
  %62 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19, i32 0, i32 0
  store %FIFO* %31, %FIFO** %62
  %63 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19, i32 0, i32 1
  store %FIFO* %32, %FIFO** %63
  %64 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19, i32 0, i32 2
  store %FIFO* %33, %FIFO** %64
  %65 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19, i32 0, i32 3
  store %FIFO* %34, %FIFO** %65
  %66 = bitcast { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19 to i8*
  store i32* %thread_id6, i32** %20
  %67 = bitcast i32*** %21 to i8**
  store i32** %20, i32*** %21
  %68 = load i8*, i8** %67
  call void @pthread_create(i8* %68, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.6 to i8*), i8* %66)
  br label %.9.for.loop

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %81, %.5.for.done ]
  %69 = icmp slt i64 %i, 1024
  %70 = zext i1 %69 to i8
  %71 = trunc i8 %70 to i1
  br i1 %71, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %72 = getelementptr [1024 x i64], [1024 x i64]* getelementptr inbounds ([1024 x [1024 x i64]], [1024 x [1024 x i64]]* @main.array, i32 0, i32 0), i64 %i
  %73 = bitcast [1024 x i64]* %72 to i8*
  %74 = bitcast i8* %73 to i64*
  %75 = getelementptr i64, i64* %74, i64 %j
  %76 = bitcast i64* %75 to i8*
  %77 = add i64 %i, %j
  %78 = srem i64 %77, 10
  %79 = bitcast i8* %76 to i64*
  store i64 %78, i64* %79
  %80 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %81 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %80, %.4.for.body ]
  %82 = icmp slt i64 %j, 1024
  %83 = zext i1 %82 to i8
  %84 = trunc i8 %83 to i1
  br i1 %84, label %.4.for.body, label %.5.for.done

.7.for.body:                                      ; preds = %.9.for.loop
  br label %.12.for.loop

.8.for.done:                                      ; preds = %.9.for.loop
  br label %.15.for.loop

.9.for.loop:                                      ; preds = %.11.for.done, %.2.for.done
  %i7 = phi i64 [ 0, %.2.for.done ], [ %98, %.11.for.done ]
  %item = phi i64 [ 0, %.2.for.done ], [ %item9, %.11.for.done ]
  %85 = icmp slt i64 %i7, 1022
  %86 = zext i1 %85 to i8
  %87 = trunc i8 %86 to i1
  br i1 %87, label %.7.for.body, label %.8.for.done

.10.for.body:                                     ; preds = %.12.for.loop
  %88 = call i64 @fifo_read(%FIFO* %34)
  store i64 %88, i64* %22
  %89 = load i64, i64* %22
  %90 = bitcast i8* %27 to [1022 x i64]*
  %91 = getelementptr [1022 x i64], [1022 x i64]* %90, i64 %i7
  %92 = bitcast [1022 x i64]* %91 to i8*
  %93 = bitcast i8* %92 to i64*
  %94 = getelementptr i64, i64* %93, i64 %j8
  %95 = bitcast i64* %94 to i8*
  %96 = bitcast i8* %95 to i64*
  store i64 %89, i64* %96
  %97 = add i64 %j8, 1
  br label %.12.for.loop

.11.for.done:                                     ; preds = %.12.for.loop
  %98 = add i64 %i7, 1
  br label %.9.for.loop

.12.for.loop:                                     ; preds = %.10.for.body, %.7.for.body
  %j8 = phi i64 [ 0, %.7.for.body ], [ %97, %.10.for.body ]
  %item9 = phi i64 [ %item, %.7.for.body ], [ %89, %.10.for.body ]
  %99 = icmp slt i64 %j8, 1022
  %100 = zext i1 %99 to i8
  %101 = trunc i8 %100 to i1
  br i1 %101, label %.10.for.body, label %.11.for.done

.13.for.body:                                     ; preds = %.15.for.loop
  br label %.18.for.loop

.14.for.done:                                     ; preds = %.15.for.loop
  %102 = bitcast [2 x { i8*, i8* }]* %varargs to i8*
  %103 = bitcast i8* %102 to { i8*, i8* }*
  %104 = getelementptr { i8*, i8* }, { i8*, i8* }* %103, i64 0
  %105 = bitcast { i8*, i8* }* %104 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @0, i32 0, i32 0), i64 10 }, { i8*, i64 }* %23
  %106 = bitcast { i8*, i64 }* %23 to i8*
  %107 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %106, 1
  %108 = bitcast i8* %105 to { i8*, i8* }*
  store { i8*, i8* } %107, { i8*, i8* }* %108
  %109 = bitcast i8* %102 to { i8*, i8* }*
  %110 = getelementptr { i8*, i8* }, { i8*, i8* }* %109, i64 1
  %111 = bitcast { i8*, i8* }* %110 to i8*
  store i64 %checksum, i64* %24
  %112 = bitcast i64* %24 to i8*
  %113 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %112, 1
  %114 = bitcast i8* %111 to { i8*, i8* }*
  store { i8*, i8* } %113, { i8*, i8* }* %114
  %115 = getelementptr inbounds i8, i8* %102, i64 0
  %116 = insertvalue { i8*, i64, i64 } undef, i8* %115, 0
  %117 = insertvalue { i8*, i64, i64 } %116, i64 2, 1
  %118 = insertvalue { i8*, i64, i64 } %117, i64 2, 2
  store { i8*, i64, i64 } %118, { i8*, i64, i64 }* %25
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %26, i8* nest undef, { i8*, i64, i64 }* byval %25)
  %119 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %26, i32 0, i32 0
  %120 = load i64, i64* %119
  %121 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %26, i32 0, i32 1
  %122 = load { i8*, i8* }, { i8*, i8* }* %121
  ret void

.15.for.loop:                                     ; preds = %.17.for.done, %.8.for.done
  %checksum = phi i64 [ 0, %.8.for.done ], [ %checksum11, %.17.for.done ]
  %i10 = phi i64 [ 0, %.8.for.done ], [ %136, %.17.for.done ]
  %123 = icmp slt i64 %i10, 1022
  %124 = zext i1 %123 to i8
  %125 = trunc i8 %124 to i1
  br i1 %125, label %.13.for.body, label %.14.for.done

.16.for.body:                                     ; preds = %.18.for.loop
  %126 = bitcast i8* %27 to [1022 x i64]*
  %127 = getelementptr [1022 x i64], [1022 x i64]* %126, i64 %i10
  %128 = bitcast [1022 x i64]* %127 to i8*
  %129 = bitcast i8* %128 to i64*
  %130 = getelementptr i64, i64* %129, i64 %j12
  %131 = bitcast i64* %130 to i8*
  %132 = bitcast i8* %131 to i64*
  %133 = load i64, i64* %132
  %134 = add i64 %checksum11, %133
  %135 = add i64 %j12, 1
  br label %.18.for.loop

.17.for.done:                                     ; preds = %.18.for.loop
  %136 = add i64 %i10, 1
  br label %.15.for.loop

.18.for.loop:                                     ; preds = %.16.for.body, %.13.for.body
  %checksum11 = phi i64 [ %checksum, %.13.for.body ], [ %134, %.16.for.body ]
  %j12 = phi i64 [ 0, %.13.for.body ], [ %135, %.16.for.body ]
  %137 = icmp slt i64 %j12, 1022
  %138 = zext i1 %137 to i8
  %139 = trunc i8 %138 to i1
  br i1 %139, label %.16.for.body, label %.17.for.done
}

define internal void @11(i8*) #0 {
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
  call void @11(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @12(i8*) #0 {
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
  call void @12(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @13(i8*) #0 {
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
  call void @13(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @14(i8*) #0 {
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
  %21 = icmp slt i64 %i, 1022
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
  %48 = icmp slt i64 %j, 1022
  %49 = zext i1 %48 to i8
  %50 = trunc i8 %49 to i1
  br i1 %50, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper.3(i8*) #0 {
entry:
  call void @14(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @15(i8*) #0 {
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
  %21 = icmp slt i64 %i, 1022
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
  %48 = icmp slt i64 %j, 1022
  %49 = zext i1 %48 to i8
  %50 = trunc i8 %49 to i1
  br i1 %50, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper.4(i8*) #0 {
entry:
  call void @15(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @16(i8*) #0 {
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
  %21 = icmp slt i64 %i, 1022
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
  %48 = icmp slt i64 %j, 1022
  %49 = zext i1 %48 to i8
  %50 = trunc i8 %49 to i1
  br i1 %50, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper.5(i8*) #0 {
entry:
  call void @16(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @17(i8*) #0 {
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
  %4 = icmp slt i64 %i, 1022
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
  %17 = icmp slt i64 %j, 1022
  %18 = zext i1 %17 to i8
  %19 = trunc i8 %18 to i1
  br i1 %19, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper.6(i8*) #0 {
entry:
  call void @17(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

define void @__go_init_main(i8*) #0 {
entry:
  ret void
}

attributes #0 = { "disable-tail-calls"="true" "split-stack" }
