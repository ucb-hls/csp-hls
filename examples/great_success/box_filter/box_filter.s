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
@main.array = internal global [256 x [256 x i64]] zeroinitializer
@"init$guard" = internal global i1 false
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
  %1 = alloca { %FIFO* }
  %thread_id = alloca i32
  %2 = alloca i32*
  %3 = alloca i32**
  %4 = alloca { %FIFO*, %FIFO* }
  %thread_id1 = alloca i32
  %5 = alloca i32*
  %6 = alloca i32**
  %7 = alloca { %FIFO*, %FIFO* }
  %thread_id2 = alloca i32
  %8 = alloca i32*
  %9 = alloca i32**
  %10 = alloca i64
  %varargs = alloca [2 x { i8*, i8* }]
  %11 = alloca { i8*, i64 }
  %12 = alloca i64
  %13 = alloca { i8*, i64, i64 }
  %14 = alloca { i64, { i8*, i8* } }
  %result = alloca [256 x [256 x i64]]
  %15 = bitcast [256 x [256 x i64]]* %result to i8*
  call void @llvm.memset.p0i8.i64(i8* %15, i8 0, i64 mul (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 65536), i32 1, i1 false)
  %16 = bitcast [256 x [256 x i64]]* %result to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %17 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 65536)
  %18 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 65536)
  %19 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 65536)
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 mul (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 65536), i32 1, i1 false)
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  %20 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %1, i32 0, i32 0
  store %FIFO* %17, %FIFO** %20
  %21 = bitcast { %FIFO* }* %1 to i8*
  store i32* %thread_id, i32** %2
  %22 = bitcast i32*** %3 to i8**
  store i32** %2, i32*** %3
  %23 = load i8*, i8** %22
  call void @pthread_create(i8* %23, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %21)
  %24 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %4, i32 0, i32 0
  store %FIFO* %17, %FIFO** %24
  %25 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %4, i32 0, i32 1
  store %FIFO* %18, %FIFO** %25
  %26 = bitcast { %FIFO*, %FIFO* }* %4 to i8*
  store i32* %thread_id1, i32** %5
  %27 = bitcast i32*** %6 to i8**
  store i32** %5, i32*** %6
  %28 = load i8*, i8** %27
  call void @pthread_create(i8* %28, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %26)
  %29 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %7, i32 0, i32 0
  store %FIFO* %18, %FIFO** %29
  %30 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %7, i32 0, i32 1
  store %FIFO* %19, %FIFO** %30
  %31 = bitcast { %FIFO*, %FIFO* }* %7 to i8*
  store i32* %thread_id2, i32** %8
  %32 = bitcast i32*** %9 to i8**
  store i32** %8, i32*** %9
  %33 = load i8*, i8** %32
  call void @pthread_create(i8* %33, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.2 to i8*), i8* %31)
  br label %.9.for.loop

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %46, %.5.for.done ]
  %34 = icmp slt i64 %i, 256
  %35 = zext i1 %34 to i8
  %36 = trunc i8 %35 to i1
  br i1 %36, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %37 = getelementptr [256 x i64], [256 x i64]* getelementptr inbounds ([256 x [256 x i64]], [256 x [256 x i64]]* @main.array, i32 0, i32 0), i64 %i
  %38 = bitcast [256 x i64]* %37 to i8*
  %39 = bitcast i8* %38 to i64*
  %40 = getelementptr i64, i64* %39, i64 %j
  %41 = bitcast i64* %40 to i8*
  %42 = add i64 %i, %j
  %43 = srem i64 %42, 255
  %44 = bitcast i8* %41 to i64*
  store i64 %43, i64* %44
  %45 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %46 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %45, %.4.for.body ]
  %47 = icmp slt i64 %j, 256
  %48 = zext i1 %47 to i8
  %49 = trunc i8 %48 to i1
  br i1 %49, label %.4.for.body, label %.5.for.done

.7.for.body:                                      ; preds = %.9.for.loop
  br label %.12.for.loop

.8.for.done:                                      ; preds = %.9.for.loop
  br label %.15.for.loop

.9.for.loop:                                      ; preds = %.11.for.done, %.2.for.done
  %i3 = phi i64 [ 0, %.2.for.done ], [ %63, %.11.for.done ]
  %item = phi i64 [ 0, %.2.for.done ], [ %item5, %.11.for.done ]
  %50 = icmp slt i64 %i3, 256
  %51 = zext i1 %50 to i8
  %52 = trunc i8 %51 to i1
  br i1 %52, label %.7.for.body, label %.8.for.done

.10.for.body:                                     ; preds = %.12.for.loop
  %53 = call i64 @fifo_read(%FIFO* %19)
  store i64 %53, i64* %10
  %54 = load i64, i64* %10
  %55 = bitcast i8* %16 to [256 x i64]*
  %56 = getelementptr [256 x i64], [256 x i64]* %55, i64 %i3
  %57 = bitcast [256 x i64]* %56 to i8*
  %58 = bitcast i8* %57 to i64*
  %59 = getelementptr i64, i64* %58, i64 %j4
  %60 = bitcast i64* %59 to i8*
  %61 = bitcast i8* %60 to i64*
  store i64 %54, i64* %61
  %62 = add i64 %j4, 1
  br label %.12.for.loop

.11.for.done:                                     ; preds = %.12.for.loop
  %63 = add i64 %i3, 1
  br label %.9.for.loop

.12.for.loop:                                     ; preds = %.10.for.body, %.7.for.body
  %j4 = phi i64 [ 0, %.7.for.body ], [ %62, %.10.for.body ]
  %item5 = phi i64 [ %item, %.7.for.body ], [ %54, %.10.for.body ]
  %64 = icmp slt i64 %j4, 256
  %65 = zext i1 %64 to i8
  %66 = trunc i8 %65 to i1
  br i1 %66, label %.10.for.body, label %.11.for.done

.13.for.body:                                     ; preds = %.15.for.loop
  br label %.18.for.loop

.14.for.done:                                     ; preds = %.15.for.loop
  %67 = bitcast [2 x { i8*, i8* }]* %varargs to i8*
  %68 = bitcast i8* %67 to { i8*, i8* }*
  %69 = getelementptr { i8*, i8* }, { i8*, i8* }* %68, i64 0
  %70 = bitcast { i8*, i8* }* %69 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @0, i32 0, i32 0), i64 10 }, { i8*, i64 }* %11
  %71 = bitcast { i8*, i64 }* %11 to i8*
  %72 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %71, 1
  %73 = bitcast i8* %70 to { i8*, i8* }*
  store { i8*, i8* } %72, { i8*, i8* }* %73
  %74 = bitcast i8* %67 to { i8*, i8* }*
  %75 = getelementptr { i8*, i8* }, { i8*, i8* }* %74, i64 1
  %76 = bitcast { i8*, i8* }* %75 to i8*
  store i64 %checksum, i64* %12
  %77 = bitcast i64* %12 to i8*
  %78 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %77, 1
  %79 = bitcast i8* %76 to { i8*, i8* }*
  store { i8*, i8* } %78, { i8*, i8* }* %79
  %80 = getelementptr inbounds i8, i8* %67, i64 0
  %81 = insertvalue { i8*, i64, i64 } undef, i8* %80, 0
  %82 = insertvalue { i8*, i64, i64 } %81, i64 2, 1
  %83 = insertvalue { i8*, i64, i64 } %82, i64 2, 2
  store { i8*, i64, i64 } %83, { i8*, i64, i64 }* %13
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %14, i8* nest undef, { i8*, i64, i64 }* byval %13)
  %84 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %14, i32 0, i32 0
  %85 = load i64, i64* %84
  %86 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %14, i32 0, i32 1
  %87 = load { i8*, i8* }, { i8*, i8* }* %86
  ret void

.15.for.loop:                                     ; preds = %.17.for.done, %.8.for.done
  %checksum = phi i64 [ 0, %.8.for.done ], [ %checksum7, %.17.for.done ]
  %i6 = phi i64 [ 0, %.8.for.done ], [ %101, %.17.for.done ]
  %88 = icmp slt i64 %i6, 256
  %89 = zext i1 %88 to i8
  %90 = trunc i8 %89 to i1
  br i1 %90, label %.13.for.body, label %.14.for.done

.16.for.body:                                     ; preds = %.18.for.loop
  %91 = bitcast i8* %16 to [256 x i64]*
  %92 = getelementptr [256 x i64], [256 x i64]* %91, i64 %i6
  %93 = bitcast [256 x i64]* %92 to i8*
  %94 = bitcast i8* %93 to i64*
  %95 = getelementptr i64, i64* %94, i64 %j8
  %96 = bitcast i64* %95 to i8*
  %97 = bitcast i8* %96 to i64*
  %98 = load i64, i64* %97
  %99 = add i64 %checksum7, %98
  %100 = add i64 %j8, 1
  br label %.18.for.loop

.17.for.done:                                     ; preds = %.18.for.loop
  %101 = add i64 %i6, 1
  br label %.15.for.loop

.18.for.loop:                                     ; preds = %.16.for.body, %.13.for.body
  %checksum7 = phi i64 [ %checksum, %.13.for.body ], [ %99, %.16.for.body ]
  %j8 = phi i64 [ 0, %.13.for.body ], [ %100, %.16.for.body ]
  %102 = icmp slt i64 %j8, 256
  %103 = zext i1 %102 to i8
  %104 = trunc i8 %103 to i1
  br i1 %104, label %.16.for.body, label %.17.for.done
}

define internal void @11(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO* }*
  %2 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  br label %entry

entry:                                            ; preds = %prologue
  call void @main.stream_data(i8* nest undef, %FIFO* %3)
  ret void
}

define internal void @main.stream_data(i8* nest, %FIFO* %channel) #1 {
prologue:
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  call void @fifo_write(%FIFO* %channel, i64 0)
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %12, %.5.for.done ]
  %1 = icmp slt i64 %i, 256
  %2 = zext i1 %1 to i8
  %3 = trunc i8 %2 to i1
  br i1 %3, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %4 = getelementptr [256 x i64], [256 x i64]* getelementptr inbounds ([256 x [256 x i64]], [256 x [256 x i64]]* @main.array, i32 0, i32 0), i64 %i
  %5 = bitcast [256 x i64]* %4 to i8*
  %6 = bitcast i8* %5 to i64*
  %7 = getelementptr i64, i64* %6, i64 %j
  %8 = bitcast i64* %7 to i8*
  %9 = bitcast i8* %8 to i64*
  %10 = load i64, i64* %9
  call void @fifo_write(%FIFO* %channel, i64 %10)
  %11 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  call void @fifo_write(%FIFO* %channel, i64 0)
  %12 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %11, %.4.for.body ]
  %13 = icmp slt i64 %j, 256
  %14 = zext i1 %13 to i8
  %15 = trunc i8 %14 to i1
  br i1 %15, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper(i8*) #1 {
entry:
  call void @11(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @12(i8*) #1 {
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
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %4 = call i64 @fifo_read(%FIFO* %in)
  store i64 %4, i64* %1
  %5 = load i64, i64* %1
  %6 = call i64 @fifo_read(%FIFO* %in)
  store i64 %6, i64* %2
  %7 = load i64, i64* %2
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  ret void

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %17, %.5.for.done ]
  %item3 = phi i64 [ 0, %.0.entry ], [ %item31, %.5.for.done ]
  %8 = icmp slt i64 %i, 256
  %9 = zext i1 %8 to i8
  %10 = trunc i8 %9 to i1
  br i1 %10, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %11 = call i64 @fifo_read(%FIFO* %in)
  store i64 %11, i64* %3
  %12 = load i64, i64* %3
  %13 = add i64 %item1, %item2
  %14 = add i64 %13, %12
  %15 = sdiv i64 %14, 3
  call void @fifo_write(%FIFO* %out, i64 %15)
  %16 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %17 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %item1 = phi i64 [ %5, %.1.for.body ], [ %item2, %.4.for.body ]
  %item2 = phi i64 [ %7, %.1.for.body ], [ %12, %.4.for.body ]
  %j = phi i64 [ 0, %.1.for.body ], [ %16, %.4.for.body ]
  %item31 = phi i64 [ %item3, %.1.for.body ], [ %12, %.4.for.body ]
  %18 = icmp slt i64 %j, 256
  %19 = zext i1 %18 to i8
  %20 = trunc i8 %19 to i1
  br i1 %20, label %.4.for.body, label %.5.for.done
}

define internal i8* @auto_pthread_wrapper.1(i8*) #1 {
entry:
  call void @12(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @13(i8*) #1 {
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
  %buffer = alloca [2 x [256 x i64]]
  %3 = bitcast [2 x [256 x i64]]* %buffer to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 mul (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 512), i32 1, i1 false)
  %4 = bitcast [2 x [256 x i64]]* %buffer to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 mul (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 512), i32 1, i1 false)
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  %5 = bitcast i8* %4 to [256 x i64]*
  %6 = getelementptr [256 x i64], [256 x i64]* %5, i64 0
  %7 = bitcast [256 x i64]* %6 to i8*
  %8 = bitcast i8* %7 to i64*
  %9 = getelementptr i64, i64* %8, i64 %i
  %10 = bitcast i64* %9 to i8*
  %11 = bitcast i8* %10 to i64*
  store i64 0, i64* %11
  %12 = add i64 %i, 1
  br label %.3.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.3.for.loop:                                      ; preds = %.1.for.body, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %12, %.1.for.body ]
  %13 = icmp slt i64 %i, 256
  %14 = zext i1 %13 to i8
  %15 = trunc i8 %14 to i1
  br i1 %15, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %16 = call i64 @fifo_read(%FIFO* %in)
  store i64 %16, i64* %1
  %17 = load i64, i64* %1
  %18 = bitcast i8* %4 to [256 x i64]*
  %19 = getelementptr [256 x i64], [256 x i64]* %18, i64 1
  %20 = bitcast [256 x i64]* %19 to i8*
  %21 = bitcast i8* %20 to i64*
  %22 = getelementptr i64, i64* %21, i64 %i1
  %23 = bitcast i64* %22 to i8*
  %24 = bitcast i8* %23 to i64*
  store i64 %17, i64* %24
  %25 = add i64 %i1, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  br label %.9.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.2.for.done
  %i1 = phi i64 [ 0, %.2.for.done ], [ %25, %.4.for.body ]
  %26 = icmp slt i64 %i1, 256
  %27 = zext i1 %26 to i8
  %28 = trunc i8 %27 to i1
  br i1 %28, label %.4.for.body, label %.5.for.done

.7.for.body:                                      ; preds = %.9.for.loop
  br label %.12.for.loop

.8.for.done:                                      ; preds = %.9.for.loop
  br label %.15.for.loop

.9.for.loop:                                      ; preds = %.11.for.done, %.5.for.done
  %pos = phi i64 [ 0, %.5.for.done ], [ %61, %.11.for.done ]
  %i2 = phi i64 [ 1, %.5.for.done ], [ %62, %.11.for.done ]
  %item = phi i64 [ 0, %.5.for.done ], [ %item3, %.11.for.done ]
  %29 = icmp slt i64 %i2, 256
  %30 = zext i1 %29 to i8
  %31 = trunc i8 %30 to i1
  br i1 %31, label %.7.for.body, label %.8.for.done

.10.for.body:                                     ; preds = %.12.for.loop
  %32 = call i64 @fifo_read(%FIFO* %in)
  store i64 %32, i64* %2
  %33 = load i64, i64* %2
  %34 = bitcast i8* %4 to [256 x i64]*
  %35 = getelementptr [256 x i64], [256 x i64]* %34, i64 0
  %36 = bitcast [256 x i64]* %35 to i8*
  %37 = bitcast i8* %36 to i64*
  %38 = getelementptr i64, i64* %37, i64 %j
  %39 = bitcast i64* %38 to i8*
  %40 = bitcast i8* %39 to i64*
  %41 = load i64, i64* %40
  %42 = bitcast i8* %4 to [256 x i64]*
  %43 = getelementptr [256 x i64], [256 x i64]* %42, i64 1
  %44 = bitcast [256 x i64]* %43 to i8*
  %45 = bitcast i8* %44 to i64*
  %46 = getelementptr i64, i64* %45, i64 %j
  %47 = bitcast i64* %46 to i8*
  %48 = bitcast i8* %47 to i64*
  %49 = load i64, i64* %48
  %50 = add i64 %41, %49
  %51 = add i64 %50, %33
  %52 = sdiv i64 %51, 3
  call void @fifo_write(%FIFO* %out, i64 %52)
  %53 = bitcast i8* %4 to [256 x i64]*
  %54 = getelementptr [256 x i64], [256 x i64]* %53, i64 %pos
  %55 = bitcast [256 x i64]* %54 to i8*
  %56 = bitcast i8* %55 to i64*
  %57 = getelementptr i64, i64* %56, i64 %j
  %58 = bitcast i64* %57 to i8*
  %59 = bitcast i8* %58 to i64*
  store i64 %33, i64* %59
  %60 = add i64 %j, 1
  br label %.12.for.loop

.11.for.done:                                     ; preds = %.12.for.loop
  %61 = sub i64 1, %pos
  %62 = add i64 %i2, 1
  br label %.9.for.loop

.12.for.loop:                                     ; preds = %.10.for.body, %.7.for.body
  %j = phi i64 [ 0, %.7.for.body ], [ %60, %.10.for.body ]
  %item3 = phi i64 [ %item, %.7.for.body ], [ %33, %.10.for.body ]
  %63 = icmp slt i64 %j, 256
  %64 = zext i1 %63 to i8
  %65 = trunc i8 %64 to i1
  br i1 %65, label %.10.for.body, label %.11.for.done

.13.for.body:                                     ; preds = %.15.for.loop
  %66 = bitcast i8* %4 to [256 x i64]*
  %67 = getelementptr [256 x i64], [256 x i64]* %66, i64 0
  %68 = bitcast [256 x i64]* %67 to i8*
  %69 = bitcast i8* %68 to i64*
  %70 = getelementptr i64, i64* %69, i64 %j4
  %71 = bitcast i64* %70 to i8*
  %72 = bitcast i8* %71 to i64*
  %73 = load i64, i64* %72
  %74 = bitcast i8* %4 to [256 x i64]*
  %75 = getelementptr [256 x i64], [256 x i64]* %74, i64 1
  %76 = bitcast [256 x i64]* %75 to i8*
  %77 = bitcast i8* %76 to i64*
  %78 = getelementptr i64, i64* %77, i64 %j4
  %79 = bitcast i64* %78 to i8*
  %80 = bitcast i8* %79 to i64*
  %81 = load i64, i64* %80
  %82 = add i64 %73, %81
  %83 = add i64 %82, 0
  %84 = sdiv i64 %83, 3
  call void @fifo_write(%FIFO* %out, i64 %84)
  %85 = add i64 %j4, 1
  br label %.15.for.loop

.14.for.done:                                     ; preds = %.15.for.loop
  ret void

.15.for.loop:                                     ; preds = %.13.for.body, %.8.for.done
  %j4 = phi i64 [ 0, %.8.for.done ], [ %85, %.13.for.body ]
  %86 = icmp slt i64 %j4, 256
  %87 = zext i1 %86 to i8
  %88 = trunc i8 %87 to i1
  br i1 %88, label %.13.for.body, label %.14.for.done
}

define internal i8* @auto_pthread_wrapper.2(i8*) #1 {
entry:
  call void @13(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

define void @__go_init_main(i8*) #1 {
entry:
  ret void
}

attributes #0 = { argmemonly nounwind }
attributes #1 = { "disable-tail-calls"="true" "split-stack" }
