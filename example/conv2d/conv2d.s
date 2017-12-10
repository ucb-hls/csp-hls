; ModuleID = 'main'
; TODO(growly): Does commenting this out break anything?
; ;source_filename = "main"
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
@0 = internal global [14 x i8] c"Original array"
@__go_tdn_string = linkonce_odr constant %commonType { i8 24, i8 8, i8 8, i64 16, i32 100666096, %funcVal* @__go_type_hash_string_descriptor, %funcVal* @__go_type_equal_string_descriptor, i8* bitcast ([4 x i8*]* @"__go_tdn_string$gc" to i8*), { i8*, i64 }* @10, %uncommonType* @13, %commonType* null }
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @5, %uncommonType* @8, %commonType* null }
@1 = internal global [1 x i8] c" "
@2 = internal global [12 x i8] c"Result array"
@3 = internal global [1 x i8] c" "
@4 = internal constant [3 x i8] c"int"
@5 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @4, i32 0, i32 0), i64 3 }
@6 = internal constant [3 x i8] c"int"
@7 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([3 x i8], [3 x i8]* @6, i32 0, i32 0), i64 3 }
@8 = internal constant %uncommonType { { i8*, i64 }* @7, { i8*, i64 }* null, %methodSlice zeroinitializer }
@"__go_tdn_int$gc" = linkonce_odr constant [2 x i8*] [i8* inttoptr (i64 8 to i8*), i8* null]
@9 = internal constant [6 x i8] c"string"
@10 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @9, i32 0, i32 0), i64 6 }
@11 = internal constant [6 x i8] c"string"
@12 = internal constant { i8*, i64 } { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @11, i32 0, i32 0), i64 6 }
@13 = internal constant %uncommonType { { i8*, i64 }* @12, { i8*, i64 }* null, %methodSlice zeroinitializer }
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
  %varargs = alloca [1 x { i8*, i8* }]
  %26 = alloca { i8*, i64 }
  %27 = alloca { i8*, i64, i64 }
  %28 = alloca { i64, { i8*, i8* } }
  %varargs12 = alloca [2 x { i8*, i8* }]
  %29 = alloca i64
  %30 = alloca { i8*, i64 }
  %31 = alloca { i8*, i64, i64 }
  %32 = alloca { i64, { i8*, i8* } }
  %33 = alloca { i8*, i64, i64 }
  %34 = alloca { i64, { i8*, i8* } }
  %varargs13 = alloca [1 x { i8*, i8* }]
  %35 = alloca { i8*, i64 }
  %36 = alloca { i8*, i64, i64 }
  %37 = alloca { i64, { i8*, i8* } }
  %varargs16 = alloca [2 x { i8*, i8* }]
  %38 = alloca i64
  %39 = alloca { i8*, i64 }
  %40 = alloca { i8*, i64, i64 }
  %41 = alloca { i64, { i8*, i8* } }
  %42 = alloca { i8*, i64, i64 }
  %43 = alloca { i64, { i8*, i8* } }
  %result = alloca [6 x [6 x i64]]
  %44 = bitcast [6 x [6 x i64]]* %result to i8*
  call void @llvm.memset.p0i8.i64(i8* %44, i8 0, i64 mul (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 36), i32 1, i1 false)
  %45 = bitcast [6 x [6 x i64]]* %result to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %46 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  store %FIFO* %46, %FIFO** %c1_in
  %47 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  store %FIFO* %47, %FIFO** %c2_in
  %48 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  store %FIFO* %48, %FIFO** %c3_in
  %49 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %50 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %51 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %52 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %53 = bitcast [8 x [8 x i64]]* %array to i8*
  call void @llvm.memset.p0i8.i64(i8* %45, i8 0, i64 mul (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 36), i32 1, i1 false)
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  %54 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$1" to i8*), i8** %54
  %55 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 1
  store %FIFO** %c1_in, %FIFO*** %55
  %56 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %1, i32 0, i32 2
  store i8* %53, i8** %56
  %57 = bitcast { i8*, %FIFO**, i8* }* %1 to i8*
  %58 = getelementptr inbounds { i8* }, { i8* }* %2, i32 0, i32 0
  store i8* %57, i8** %58
  %59 = bitcast { i8* }* %2 to i8*
  store i32* %thread_id, i32** %3
  %60 = bitcast i32*** %4 to i8**
  store i32** %3, i32*** %4
  %61 = load i8*, i8** %60
  call void @pthread_create(i8* %61, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %59)
  %62 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %5, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$2" to i8*), i8** %62
  %63 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %5, i32 0, i32 1
  store %FIFO** %c2_in, %FIFO*** %63
  %64 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %5, i32 0, i32 2
  store i8* %53, i8** %64
  %65 = bitcast { i8*, %FIFO**, i8* }* %5 to i8*
  %66 = getelementptr inbounds { i8* }, { i8* }* %6, i32 0, i32 0
  store i8* %65, i8** %66
  %67 = bitcast { i8* }* %6 to i8*
  store i32* %thread_id1, i32** %7
  %68 = bitcast i32*** %8 to i8**
  store i32** %7, i32*** %8
  %69 = load i8*, i8** %68
  call void @pthread_create(i8* %69, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %67)
  %70 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %9, i32 0, i32 0
  store i8* bitcast (void (i8*)* @"main.main:main.main$3" to i8*), i8** %70
  %71 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %9, i32 0, i32 1
  store %FIFO** %c3_in, %FIFO*** %71
  %72 = getelementptr inbounds { i8*, %FIFO**, i8* }, { i8*, %FIFO**, i8* }* %9, i32 0, i32 2
  store i8* %53, i8** %72
  %73 = bitcast { i8*, %FIFO**, i8* }* %9 to i8*
  %74 = getelementptr inbounds { i8* }, { i8* }* %10, i32 0, i32 0
  store i8* %73, i8** %74
  %75 = bitcast { i8* }* %10 to i8*
  store i32* %thread_id2, i32** %11
  %76 = bitcast i32*** %12 to i8**
  store i32** %11, i32*** %12
  %77 = load i8*, i8** %76
  call void @pthread_create(i8* %77, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.2 to i8*), i8* %75)
  %78 = load %FIFO*, %FIFO** %c1_in
  %79 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %13, i32 0, i32 0
  store %FIFO* %78, %FIFO** %79
  %80 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %13, i32 0, i32 1
  store %FIFO* %49, %FIFO** %80
  %81 = bitcast { %FIFO*, %FIFO* }* %13 to i8*
  store i32* %thread_id3, i32** %14
  %82 = bitcast i32*** %15 to i8**
  store i32** %14, i32*** %15
  %83 = load i8*, i8** %82
  call void @pthread_create(i8* %83, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.3 to i8*), i8* %81)
  %84 = load %FIFO*, %FIFO** %c2_in
  %85 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %16, i32 0, i32 0
  store %FIFO* %84, %FIFO** %85
  %86 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %16, i32 0, i32 1
  store %FIFO* %50, %FIFO** %86
  %87 = bitcast { %FIFO*, %FIFO* }* %16 to i8*
  store i32* %thread_id4, i32** %17
  %88 = bitcast i32*** %18 to i8**
  store i32** %17, i32*** %18
  %89 = load i8*, i8** %88
  call void @pthread_create(i8* %89, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.4 to i8*), i8* %87)
  %90 = load %FIFO*, %FIFO** %c3_in
  %91 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %19, i32 0, i32 0
  store %FIFO* %90, %FIFO** %91
  %92 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %19, i32 0, i32 1
  store %FIFO* %51, %FIFO** %92
  %93 = bitcast { %FIFO*, %FIFO* }* %19 to i8*
  store i32* %thread_id5, i32** %20
  %94 = bitcast i32*** %21 to i8**
  store i32** %20, i32*** %21
  %95 = load i8*, i8** %94
  call void @pthread_create(i8* %95, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.5 to i8*), i8* %93)
  %96 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22, i32 0, i32 0
  store %FIFO* %49, %FIFO** %96
  %97 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22, i32 0, i32 1
  store %FIFO* %50, %FIFO** %97
  %98 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22, i32 0, i32 2
  store %FIFO* %51, %FIFO** %98
  %99 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22, i32 0, i32 3
  store %FIFO* %52, %FIFO** %99
  %100 = bitcast { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %22 to i8*
  store i32* %thread_id6, i32** %23
  %101 = bitcast i32*** %24 to i8**
  store i32** %23, i32*** %24
  %102 = load i8*, i8** %101
  call void @pthread_create(i8* %102, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.6 to i8*), i8* %100)
  br label %.9.for.loop

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %115, %.5.for.done ]
  %103 = icmp slt i64 %i, 8
  %104 = zext i1 %103 to i8
  %105 = trunc i8 %104 to i1
  br i1 %105, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %106 = bitcast i8* %53 to [8 x i64]*
  %107 = getelementptr [8 x i64], [8 x i64]* %106, i64 %i
  %108 = bitcast [8 x i64]* %107 to i8*
  %109 = bitcast i8* %108 to i64*
  %110 = getelementptr i64, i64* %109, i64 %j
  %111 = bitcast i64* %110 to i8*
  %112 = add i64 %i, %j
  %113 = bitcast i8* %111 to i64*
  store i64 %112, i64* %113
  %114 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %115 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %114, %.4.for.body ]
  %116 = icmp slt i64 %j, 8
  %117 = zext i1 %116 to i8
  %118 = trunc i8 %117 to i1
  br i1 %118, label %.4.for.body, label %.5.for.done

.7.for.body:                                      ; preds = %.9.for.loop
  br label %.12.for.loop

.8.for.done:                                      ; preds = %.9.for.loop
  %119 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %120 = bitcast i8* %119 to { i8*, i8* }*
  %121 = getelementptr { i8*, i8* }, { i8*, i8* }* %120, i64 0
  %122 = bitcast { i8*, i8* }* %121 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @0, i32 0, i32 0), i64 14 }, { i8*, i64 }* %26
  %123 = bitcast { i8*, i64 }* %26 to i8*
  %124 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %123, 1
  %125 = bitcast i8* %122 to { i8*, i8* }*
  store { i8*, i8* } %124, { i8*, i8* }* %125
  %126 = getelementptr inbounds i8, i8* %119, i64 0
  %127 = insertvalue { i8*, i64, i64 } undef, i8* %126, 0
  %128 = insertvalue { i8*, i64, i64 } %127, i64 1, 1
  %129 = insertvalue { i8*, i64, i64 } %128, i64 1, 2
  store { i8*, i64, i64 } %129, { i8*, i64, i64 }* %27
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %28, i8* nest undef, { i8*, i64, i64 }* byval %27)
  %130 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %28, i32 0, i32 0
  %131 = load i64, i64* %130
  %132 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %28, i32 0, i32 1
  %133 = load { i8*, i8* }, { i8*, i8* }* %132
  br label %.15.for.loop

.9.for.loop:                                      ; preds = %.11.for.done, %.2.for.done
  %i7 = phi i64 [ 0, %.2.for.done ], [ %147, %.11.for.done ]
  %item = phi i64 [ 0, %.2.for.done ], [ %item9, %.11.for.done ]
  %134 = icmp slt i64 %i7, 6
  %135 = zext i1 %134 to i8
  %136 = trunc i8 %135 to i1
  br i1 %136, label %.7.for.body, label %.8.for.done

.10.for.body:                                     ; preds = %.12.for.loop
  %137 = call i64 @fifo_read(%FIFO* %52)
  store i64 %137, i64* %25
  %138 = load i64, i64* %25
  %139 = bitcast i8* %45 to [6 x i64]*
  %140 = getelementptr [6 x i64], [6 x i64]* %139, i64 %i7
  %141 = bitcast [6 x i64]* %140 to i8*
  %142 = bitcast i8* %141 to i64*
  %143 = getelementptr i64, i64* %142, i64 %j8
  %144 = bitcast i64* %143 to i8*
  %145 = bitcast i8* %144 to i64*
  store i64 %138, i64* %145
  %146 = add i64 %j8, 1
  br label %.12.for.loop

.11.for.done:                                     ; preds = %.12.for.loop
  %147 = add i64 %i7, 1
  br label %.9.for.loop

.12.for.loop:                                     ; preds = %.10.for.body, %.7.for.body
  %j8 = phi i64 [ 0, %.7.for.body ], [ %146, %.10.for.body ]
  %item9 = phi i64 [ %item, %.7.for.body ], [ %138, %.10.for.body ]
  %148 = icmp slt i64 %j8, 6
  %149 = zext i1 %148 to i8
  %150 = trunc i8 %149 to i1
  br i1 %150, label %.10.for.body, label %.11.for.done

.13.for.body:                                     ; preds = %.15.for.loop
  br label %.18.for.loop

.14.for.done:                                     ; preds = %.15.for.loop
  %151 = bitcast [1 x { i8*, i8* }]* %varargs13 to i8*
  %152 = bitcast i8* %151 to { i8*, i8* }*
  %153 = getelementptr { i8*, i8* }, { i8*, i8* }* %152, i64 0
  %154 = bitcast { i8*, i8* }* %153 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @2, i32 0, i32 0), i64 12 }, { i8*, i64 }* %35
  %155 = bitcast { i8*, i64 }* %35 to i8*
  %156 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %155, 1
  %157 = bitcast i8* %154 to { i8*, i8* }*
  store { i8*, i8* } %156, { i8*, i8* }* %157
  %158 = getelementptr inbounds i8, i8* %151, i64 0
  %159 = insertvalue { i8*, i64, i64 } undef, i8* %158, 0
  %160 = insertvalue { i8*, i64, i64 } %159, i64 1, 1
  %161 = insertvalue { i8*, i64, i64 } %160, i64 1, 2
  store { i8*, i64, i64 } %161, { i8*, i64, i64 }* %36
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %37, i8* nest undef, { i8*, i64, i64 }* byval %36)
  %162 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %37, i32 0, i32 0
  %163 = load i64, i64* %162
  %164 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %37, i32 0, i32 1
  %165 = load { i8*, i8* }, { i8*, i8* }* %164
  br label %.21.for.loop

.15.for.loop:                                     ; preds = %.17.for.done, %.8.for.done
  %i10 = phi i64 [ 0, %.8.for.done ], [ %203, %.17.for.done ]
  %166 = icmp slt i64 %i10, 8
  %167 = zext i1 %166 to i8
  %168 = trunc i8 %167 to i1
  br i1 %168, label %.13.for.body, label %.14.for.done

.16.for.body:                                     ; preds = %.18.for.loop
  %169 = bitcast i8* %53 to [8 x i64]*
  %170 = getelementptr [8 x i64], [8 x i64]* %169, i64 %i10
  %171 = bitcast [8 x i64]* %170 to i8*
  %172 = bitcast i8* %171 to i64*
  %173 = getelementptr i64, i64* %172, i64 %j11
  %174 = bitcast i64* %173 to i8*
  %175 = bitcast i8* %174 to i64*
  %176 = load i64, i64* %175
  %177 = bitcast [2 x { i8*, i8* }]* %varargs12 to i8*
  %178 = bitcast i8* %177 to { i8*, i8* }*
  %179 = getelementptr { i8*, i8* }, { i8*, i8* }* %178, i64 0
  %180 = bitcast { i8*, i8* }* %179 to i8*
  store i64 %176, i64* %29
  %181 = bitcast i64* %29 to i8*
  %182 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %181, 1
  %183 = bitcast i8* %180 to { i8*, i8* }*
  store { i8*, i8* } %182, { i8*, i8* }* %183
  %184 = bitcast i8* %177 to { i8*, i8* }*
  %185 = getelementptr { i8*, i8* }, { i8*, i8* }* %184, i64 1
  %186 = bitcast { i8*, i8* }* %185 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i64 1 }, { i8*, i64 }* %30
  %187 = bitcast { i8*, i64 }* %30 to i8*
  %188 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %187, 1
  %189 = bitcast i8* %186 to { i8*, i8* }*
  store { i8*, i8* } %188, { i8*, i8* }* %189
  %190 = getelementptr inbounds i8, i8* %177, i64 0
  %191 = insertvalue { i8*, i64, i64 } undef, i8* %190, 0
  %192 = insertvalue { i8*, i64, i64 } %191, i64 2, 1
  %193 = insertvalue { i8*, i64, i64 } %192, i64 2, 2
  store { i8*, i64, i64 } %193, { i8*, i64, i64 }* %31
  call void @fmt.Print({ i64, { i8*, i8* } }* sret %32, i8* nest undef, { i8*, i64, i64 }* byval %31)
  %194 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %32, i32 0, i32 0
  %195 = load i64, i64* %194
  %196 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %32, i32 0, i32 1
  %197 = load { i8*, i8* }, { i8*, i8* }* %196
  %198 = add i64 %j11, 1
  br label %.18.for.loop

.17.for.done:                                     ; preds = %.18.for.loop
  store { i8*, i64, i64 } zeroinitializer, { i8*, i64, i64 }* %33
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %34, i8* nest undef, { i8*, i64, i64 }* byval %33)
  %199 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %34, i32 0, i32 0
  %200 = load i64, i64* %199
  %201 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %34, i32 0, i32 1
  %202 = load { i8*, i8* }, { i8*, i8* }* %201
  %203 = add i64 %i10, 1
  br label %.15.for.loop

.18.for.loop:                                     ; preds = %.16.for.body, %.13.for.body
  %j11 = phi i64 [ 0, %.13.for.body ], [ %198, %.16.for.body ]
  %204 = icmp slt i64 %j11, 8
  %205 = zext i1 %204 to i8
  %206 = trunc i8 %205 to i1
  br i1 %206, label %.16.for.body, label %.17.for.done

.19.for.body:                                     ; preds = %.21.for.loop
  br label %.24.for.loop

.20.for.done:                                     ; preds = %.21.for.loop
  ret void

.21.for.loop:                                     ; preds = %.23.for.done, %.14.for.done
  %i14 = phi i64 [ 0, %.14.for.done ], [ %244, %.23.for.done ]
  %207 = icmp slt i64 %i14, 6
  %208 = zext i1 %207 to i8
  %209 = trunc i8 %208 to i1
  br i1 %209, label %.19.for.body, label %.20.for.done

.22.for.body:                                     ; preds = %.24.for.loop
  %210 = bitcast i8* %45 to [6 x i64]*
  %211 = getelementptr [6 x i64], [6 x i64]* %210, i64 %i14
  %212 = bitcast [6 x i64]* %211 to i8*
  %213 = bitcast i8* %212 to i64*
  %214 = getelementptr i64, i64* %213, i64 %j15
  %215 = bitcast i64* %214 to i8*
  %216 = bitcast i8* %215 to i64*
  %217 = load i64, i64* %216
  %218 = bitcast [2 x { i8*, i8* }]* %varargs16 to i8*
  %219 = bitcast i8* %218 to { i8*, i8* }*
  %220 = getelementptr { i8*, i8* }, { i8*, i8* }* %219, i64 0
  %221 = bitcast { i8*, i8* }* %220 to i8*
  store i64 %217, i64* %38
  %222 = bitcast i64* %38 to i8*
  %223 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %222, 1
  %224 = bitcast i8* %221 to { i8*, i8* }*
  store { i8*, i8* } %223, { i8*, i8* }* %224
  %225 = bitcast i8* %218 to { i8*, i8* }*
  %226 = getelementptr { i8*, i8* }, { i8*, i8* }* %225, i64 1
  %227 = bitcast { i8*, i8* }* %226 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @3, i32 0, i32 0), i64 1 }, { i8*, i64 }* %39
  %228 = bitcast { i8*, i64 }* %39 to i8*
  %229 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %228, 1
  %230 = bitcast i8* %227 to { i8*, i8* }*
  store { i8*, i8* } %229, { i8*, i8* }* %230
  %231 = getelementptr inbounds i8, i8* %218, i64 0
  %232 = insertvalue { i8*, i64, i64 } undef, i8* %231, 0
  %233 = insertvalue { i8*, i64, i64 } %232, i64 2, 1
  %234 = insertvalue { i8*, i64, i64 } %233, i64 2, 2
  store { i8*, i64, i64 } %234, { i8*, i64, i64 }* %40
  call void @fmt.Print({ i64, { i8*, i8* } }* sret %41, i8* nest undef, { i8*, i64, i64 }* byval %40)
  %235 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %41, i32 0, i32 0
  %236 = load i64, i64* %235
  %237 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %41, i32 0, i32 1
  %238 = load { i8*, i8* }, { i8*, i8* }* %237
  %239 = add i64 %j15, 1
  br label %.24.for.loop

.23.for.done:                                     ; preds = %.24.for.loop
  store { i8*, i64, i64 } zeroinitializer, { i8*, i64, i64 }* %42
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %43, i8* nest undef, { i8*, i64, i64 }* byval %42)
  %240 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %43, i32 0, i32 0
  %241 = load i64, i64* %240
  %242 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %43, i32 0, i32 1
  %243 = load { i8*, i8* }, { i8*, i8* }* %242
  %244 = add i64 %i14, 1
  br label %.21.for.loop

.24.for.loop:                                     ; preds = %.22.for.body, %.19.for.body
  %j15 = phi i64 [ 0, %.19.for.body ], [ %239, %.22.for.body ]
  %245 = icmp slt i64 %j15, 6
  %246 = zext i1 %245 to i8
  %247 = trunc i8 %246 to i1
  br i1 %247, label %.22.for.body, label %.23.for.done
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

define internal void @14(i8*) #1 {
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
  call void @14(i8* %0)
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

define internal void @15(i8*) #1 {
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
  call void @15(i8* %0)
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

define internal void @16(i8*) #1 {
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
  call void @16(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @17(i8*) #1 {
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
  call void @17(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @18(i8*) #1 {
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
  call void @18(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @19(i8*) #1 {
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
  call void @19(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @20(i8*) #1 {
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
  call void @20(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

declare void @fmt.Println({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

declare void @fmt.Print({ i64, { i8*, i8* } }* sret, i8* nest, { i8*, i64, i64 }* byval)

define void @__go_init_main(i8*) #1 {
entry:
  ret void
}

attributes #0 = { argmemonly nounwind }
attributes #1 = { "disable-tail-calls"="true" "split-stack" }
