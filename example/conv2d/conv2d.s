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
@main.array = internal global [8 x [8 x i64]] zeroinitializer
@"init$guard" = internal global i1 false
@0 = internal global [14 x i8] c"Original array"
@__go_tdn_string = linkonce_odr constant %commonType { i8 24, i8 8, i8 8, i64 16, i32 100666096, %funcVal* @__go_type_hash_string_descriptor, %funcVal* @__go_type_equal_string_descriptor, i8* bitcast ([4 x i8*]* @"__go_tdn_string$gc" to i8*), { i8*, i64 }* @10, %uncommonType* @13, %commonType* null }
@__go_tdn_int = linkonce_odr constant %commonType { i8 -126, i8 8, i8 8, i64 8, i32 50332917, %funcVal* @__go_type_hash_identity_descriptor, %funcVal* @__go_type_equal_identity_descriptor, i8* bitcast ([2 x i8*]* @"__go_tdn_int$gc" to i8*), { i8*, i64 }* @5, %uncommonType* @8, %commonType* null }
@1 = internal global [4 x i8] c"%4d "
@2 = internal global [12 x i8] c"Result array"
@3 = internal global [4 x i8] c"%4d "
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
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #0

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
  %varargs = alloca [1 x { i8*, i8* }]
  %23 = alloca { i8*, i64 }
  %24 = alloca { i8*, i64, i64 }
  %25 = alloca { i64, { i8*, i8* } }
  %varargs12 = alloca [1 x { i8*, i8* }]
  %26 = alloca i64
  %27 = alloca { i8*, i64 }
  %28 = alloca { i8*, i64, i64 }
  %29 = alloca { i64, { i8*, i8* } }
  %30 = alloca { i8*, i64, i64 }
  %31 = alloca { i64, { i8*, i8* } }
  %varargs13 = alloca [1 x { i8*, i8* }]
  %32 = alloca { i8*, i64 }
  %33 = alloca { i8*, i64, i64 }
  %34 = alloca { i64, { i8*, i8* } }
  %varargs16 = alloca [1 x { i8*, i8* }]
  %35 = alloca i64
  %36 = alloca { i8*, i64 }
  %37 = alloca { i8*, i64, i64 }
  %38 = alloca { i64, { i8*, i8* } }
  %39 = alloca { i8*, i64, i64 }
  %40 = alloca { i64, { i8*, i8* } }
  %result = alloca [6 x [6 x i64]]
  %41 = bitcast [6 x [6 x i64]]* %result to i8*
  call void @llvm.memset.p0i8.i64(i8* %41, i8 0, i64 mul (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 36), i32 1, i1 false)
  %42 = bitcast [6 x [6 x i64]]* %result to i8*
  br label %.0.entry

.0.entry:                                         ; preds = %prologue
  %43 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %44 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %45 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 10)
  %46 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %47 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %48 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  %49 = call %FIFO* @fifo_malloc(i8 zeroext 64, i64 1)
  call void @llvm.memset.p0i8.i64(i8* %42, i8 0, i64 mul (i64 ptrtoint (i64* getelementptr (i64, i64* null, i32 1) to i64), i64 36), i32 1, i1 false)
  br label %.3.for.loop

.1.for.body:                                      ; preds = %.3.for.loop
  br label %.6.for.loop

.2.for.done:                                      ; preds = %.3.for.loop
  %50 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %1, i32 0, i32 0
  store %FIFO* %43, %FIFO** %50
  %51 = bitcast { %FIFO* }* %1 to i8*
  store i32* %thread_id, i32** %2
  %52 = bitcast i32*** %3 to i8**
  store i32** %2, i32*** %3
  %53 = load i8*, i8** %52
  call void @pthread_create(i8* %53, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper to i8*), i8* %51)
  %54 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %4, i32 0, i32 0
  store %FIFO* %44, %FIFO** %54
  %55 = bitcast { %FIFO* }* %4 to i8*
  store i32* %thread_id1, i32** %5
  %56 = bitcast i32*** %6 to i8**
  store i32** %5, i32*** %6
  %57 = load i8*, i8** %56
  call void @pthread_create(i8* %57, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.1 to i8*), i8* %55)
  %58 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %7, i32 0, i32 0
  store %FIFO* %45, %FIFO** %58
  %59 = bitcast { %FIFO* }* %7 to i8*
  store i32* %thread_id2, i32** %8
  %60 = bitcast i32*** %9 to i8**
  store i32** %8, i32*** %9
  %61 = load i8*, i8** %60
  call void @pthread_create(i8* %61, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.2 to i8*), i8* %59)
  %62 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %10, i32 0, i32 0
  store %FIFO* %43, %FIFO** %62
  %63 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %10, i32 0, i32 1
  store %FIFO* %46, %FIFO** %63
  %64 = bitcast { %FIFO*, %FIFO* }* %10 to i8*
  store i32* %thread_id3, i32** %11
  %65 = bitcast i32*** %12 to i8**
  store i32** %11, i32*** %12
  %66 = load i8*, i8** %65
  call void @pthread_create(i8* %66, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.3 to i8*), i8* %64)
  %67 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %13, i32 0, i32 0
  store %FIFO* %44, %FIFO** %67
  %68 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %13, i32 0, i32 1
  store %FIFO* %47, %FIFO** %68
  %69 = bitcast { %FIFO*, %FIFO* }* %13 to i8*
  store i32* %thread_id4, i32** %14
  %70 = bitcast i32*** %15 to i8**
  store i32** %14, i32*** %15
  %71 = load i8*, i8** %70
  call void @pthread_create(i8* %71, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.4 to i8*), i8* %69)
  %72 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %16, i32 0, i32 0
  store %FIFO* %45, %FIFO** %72
  %73 = getelementptr inbounds { %FIFO*, %FIFO* }, { %FIFO*, %FIFO* }* %16, i32 0, i32 1
  store %FIFO* %48, %FIFO** %73
  %74 = bitcast { %FIFO*, %FIFO* }* %16 to i8*
  store i32* %thread_id5, i32** %17
  %75 = bitcast i32*** %18 to i8**
  store i32** %17, i32*** %18
  %76 = load i8*, i8** %75
  call void @pthread_create(i8* %76, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.5 to i8*), i8* %74)
  %77 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19, i32 0, i32 0
  store %FIFO* %46, %FIFO** %77
  %78 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19, i32 0, i32 1
  store %FIFO* %47, %FIFO** %78
  %79 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19, i32 0, i32 2
  store %FIFO* %48, %FIFO** %79
  %80 = getelementptr inbounds { %FIFO*, %FIFO*, %FIFO*, %FIFO* }, { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19, i32 0, i32 3
  store %FIFO* %49, %FIFO** %80
  %81 = bitcast { %FIFO*, %FIFO*, %FIFO*, %FIFO* }* %19 to i8*
  store i32* %thread_id6, i32** %20
  %82 = bitcast i32*** %21 to i8**
  store i32** %20, i32*** %21
  %83 = load i8*, i8** %82
  call void @pthread_create(i8* %83, i8* null, i8* bitcast (i8* (i8*)* @auto_pthread_wrapper.6 to i8*), i8* %81)
  br label %.9.for.loop

.3.for.loop:                                      ; preds = %.5.for.done, %.0.entry
  %i = phi i64 [ 0, %.0.entry ], [ %95, %.5.for.done ]
  %84 = icmp slt i64 %i, 8
  %85 = zext i1 %84 to i8
  %86 = trunc i8 %85 to i1
  br i1 %86, label %.1.for.body, label %.2.for.done

.4.for.body:                                      ; preds = %.6.for.loop
  %87 = getelementptr [8 x i64], [8 x i64]* getelementptr inbounds ([8 x [8 x i64]], [8 x [8 x i64]]* @main.array, i32 0, i32 0), i64 %i
  %88 = bitcast [8 x i64]* %87 to i8*
  %89 = bitcast i8* %88 to i64*
  %90 = getelementptr i64, i64* %89, i64 %j
  %91 = bitcast i64* %90 to i8*
  %92 = add i64 %i, %j
  %93 = bitcast i8* %91 to i64*
  store i64 %92, i64* %93
  %94 = add i64 %j, 1
  br label %.6.for.loop

.5.for.done:                                      ; preds = %.6.for.loop
  %95 = add i64 %i, 1
  br label %.3.for.loop

.6.for.loop:                                      ; preds = %.4.for.body, %.1.for.body
  %j = phi i64 [ 0, %.1.for.body ], [ %94, %.4.for.body ]
  %96 = icmp slt i64 %j, 8
  %97 = zext i1 %96 to i8
  %98 = trunc i8 %97 to i1
  br i1 %98, label %.4.for.body, label %.5.for.done

.7.for.body:                                      ; preds = %.9.for.loop
  br label %.12.for.loop

.8.for.done:                                      ; preds = %.9.for.loop
  %99 = bitcast [1 x { i8*, i8* }]* %varargs to i8*
  %100 = bitcast i8* %99 to { i8*, i8* }*
  %101 = getelementptr { i8*, i8* }, { i8*, i8* }* %100, i64 0
  %102 = bitcast { i8*, i8* }* %101 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @0, i32 0, i32 0), i64 14 }, { i8*, i64 }* %23
  %103 = bitcast { i8*, i64 }* %23 to i8*
  %104 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %103, 1
  %105 = bitcast i8* %102 to { i8*, i8* }*
  store { i8*, i8* } %104, { i8*, i8* }* %105
  %106 = getelementptr inbounds i8, i8* %99, i64 0
  %107 = insertvalue { i8*, i64, i64 } undef, i8* %106, 0
  %108 = insertvalue { i8*, i64, i64 } %107, i64 1, 1
  %109 = insertvalue { i8*, i64, i64 } %108, i64 1, 2
  store { i8*, i64, i64 } %109, { i8*, i64, i64 }* %24
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %25, i8* nest undef, { i8*, i64, i64 }* byval %24)
  %110 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %25, i32 0, i32 0
  %111 = load i64, i64* %110
  %112 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %25, i32 0, i32 1
  %113 = load { i8*, i8* }, { i8*, i8* }* %112
  br label %.15.for.loop

.9.for.loop:                                      ; preds = %.11.for.done, %.2.for.done
  %i7 = phi i64 [ 0, %.2.for.done ], [ %127, %.11.for.done ]
  %item = phi i64 [ 0, %.2.for.done ], [ %item9, %.11.for.done ]
  %114 = icmp slt i64 %i7, 6
  %115 = zext i1 %114 to i8
  %116 = trunc i8 %115 to i1
  br i1 %116, label %.7.for.body, label %.8.for.done

.10.for.body:                                     ; preds = %.12.for.loop
  %117 = call i64 @fifo_read(%FIFO* %49)
  store i64 %117, i64* %22
  %118 = load i64, i64* %22
  %119 = bitcast i8* %42 to [6 x i64]*
  %120 = getelementptr [6 x i64], [6 x i64]* %119, i64 %i7
  %121 = bitcast [6 x i64]* %120 to i8*
  %122 = bitcast i8* %121 to i64*
  %123 = getelementptr i64, i64* %122, i64 %j8
  %124 = bitcast i64* %123 to i8*
  %125 = bitcast i8* %124 to i64*
  store i64 %118, i64* %125
  %126 = add i64 %j8, 1
  br label %.12.for.loop

.11.for.done:                                     ; preds = %.12.for.loop
  %127 = add i64 %i7, 1
  br label %.9.for.loop

.12.for.loop:                                     ; preds = %.10.for.body, %.7.for.body
  %j8 = phi i64 [ 0, %.7.for.body ], [ %126, %.10.for.body ]
  %item9 = phi i64 [ %item, %.7.for.body ], [ %118, %.10.for.body ]
  %128 = icmp slt i64 %j8, 6
  %129 = zext i1 %128 to i8
  %130 = trunc i8 %129 to i1
  br i1 %130, label %.10.for.body, label %.11.for.done

.13.for.body:                                     ; preds = %.15.for.loop
  br label %.18.for.loop

.14.for.done:                                     ; preds = %.15.for.loop
  %131 = bitcast [1 x { i8*, i8* }]* %varargs13 to i8*
  %132 = bitcast i8* %131 to { i8*, i8* }*
  %133 = getelementptr { i8*, i8* }, { i8*, i8* }* %132, i64 0
  %134 = bitcast { i8*, i8* }* %133 to i8*
  store { i8*, i64 } { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @2, i32 0, i32 0), i64 12 }, { i8*, i64 }* %32
  %135 = bitcast { i8*, i64 }* %32 to i8*
  %136 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_string, i32 0, i32 0), i8* undef }, i8* %135, 1
  %137 = bitcast i8* %134 to { i8*, i8* }*
  store { i8*, i8* } %136, { i8*, i8* }* %137
  %138 = getelementptr inbounds i8, i8* %131, i64 0
  %139 = insertvalue { i8*, i64, i64 } undef, i8* %138, 0
  %140 = insertvalue { i8*, i64, i64 } %139, i64 1, 1
  %141 = insertvalue { i8*, i64, i64 } %140, i64 1, 2
  store { i8*, i64, i64 } %141, { i8*, i64, i64 }* %33
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %34, i8* nest undef, { i8*, i64, i64 }* byval %33)
  %142 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %34, i32 0, i32 0
  %143 = load i64, i64* %142
  %144 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %34, i32 0, i32 1
  %145 = load { i8*, i8* }, { i8*, i8* }* %144
  br label %.21.for.loop

.15.for.loop:                                     ; preds = %.17.for.done, %.8.for.done
  %i10 = phi i64 [ 0, %.8.for.done ], [ %180, %.17.for.done ]
  %146 = icmp slt i64 %i10, 8
  %147 = zext i1 %146 to i8
  %148 = trunc i8 %147 to i1
  br i1 %148, label %.13.for.body, label %.14.for.done

.16.for.body:                                     ; preds = %.18.for.loop
  %149 = getelementptr [8 x i64], [8 x i64]* getelementptr inbounds ([8 x [8 x i64]], [8 x [8 x i64]]* @main.array, i32 0, i32 0), i64 %i10
  %150 = bitcast [8 x i64]* %149 to i8*
  %151 = bitcast i8* %150 to i64*
  %152 = getelementptr i64, i64* %151, i64 %j11
  %153 = bitcast i64* %152 to i8*
  %154 = bitcast i8* %153 to i64*
  %155 = load i64, i64* %154
  %156 = bitcast [1 x { i8*, i8* }]* %varargs12 to i8*
  %157 = bitcast i8* %156 to { i8*, i8* }*
  %158 = getelementptr { i8*, i8* }, { i8*, i8* }* %157, i64 0
  %159 = bitcast { i8*, i8* }* %158 to i8*
  store i64 %155, i64* %26
  %160 = bitcast i64* %26 to i8*
  %161 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %160, 1
  %162 = bitcast i8* %159 to { i8*, i8* }*
  store { i8*, i8* } %161, { i8*, i8* }* %162
  %163 = getelementptr inbounds i8, i8* %156, i64 0
  %164 = insertvalue { i8*, i64, i64 } undef, i8* %163, 0
  %165 = insertvalue { i8*, i64, i64 } %164, i64 1, 1
  %166 = insertvalue { i8*, i64, i64 } %165, i64 1, 2
  store { i8*, i64 } { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @1, i32 0, i32 0), i64 4 }, { i8*, i64 }* %27
  %167 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %27, i32 0, i32 0
  %168 = load i8*, i8** %167
  %169 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %27, i32 0, i32 1
  %170 = load i64, i64* %169
  store { i8*, i64, i64 } %166, { i8*, i64, i64 }* %28
  call void @fmt.Printf({ i64, { i8*, i8* } }* sret %29, i8* nest undef, i8* %168, i64 %170, { i8*, i64, i64 }* byval %28)
  %171 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %29, i32 0, i32 0
  %172 = load i64, i64* %171
  %173 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %29, i32 0, i32 1
  %174 = load { i8*, i8* }, { i8*, i8* }* %173
  %175 = add i64 %j11, 1
  br label %.18.for.loop

.17.for.done:                                     ; preds = %.18.for.loop
  store { i8*, i64, i64 } zeroinitializer, { i8*, i64, i64 }* %30
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %31, i8* nest undef, { i8*, i64, i64 }* byval %30)
  %176 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %31, i32 0, i32 0
  %177 = load i64, i64* %176
  %178 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %31, i32 0, i32 1
  %179 = load { i8*, i8* }, { i8*, i8* }* %178
  %180 = add i64 %i10, 1
  br label %.15.for.loop

.18.for.loop:                                     ; preds = %.16.for.body, %.13.for.body
  %j11 = phi i64 [ 0, %.13.for.body ], [ %175, %.16.for.body ]
  %181 = icmp slt i64 %j11, 8
  %182 = zext i1 %181 to i8
  %183 = trunc i8 %182 to i1
  br i1 %183, label %.16.for.body, label %.17.for.done

.19.for.body:                                     ; preds = %.21.for.loop
  br label %.24.for.loop

.20.for.done:                                     ; preds = %.21.for.loop
  ret void

.21.for.loop:                                     ; preds = %.23.for.done, %.14.for.done
  %i14 = phi i64 [ 0, %.14.for.done ], [ %219, %.23.for.done ]
  %184 = icmp slt i64 %i14, 6
  %185 = zext i1 %184 to i8
  %186 = trunc i8 %185 to i1
  br i1 %186, label %.19.for.body, label %.20.for.done

.22.for.body:                                     ; preds = %.24.for.loop
  %187 = bitcast i8* %42 to [6 x i64]*
  %188 = getelementptr [6 x i64], [6 x i64]* %187, i64 %i14
  %189 = bitcast [6 x i64]* %188 to i8*
  %190 = bitcast i8* %189 to i64*
  %191 = getelementptr i64, i64* %190, i64 %j15
  %192 = bitcast i64* %191 to i8*
  %193 = bitcast i8* %192 to i64*
  %194 = load i64, i64* %193
  %195 = bitcast [1 x { i8*, i8* }]* %varargs16 to i8*
  %196 = bitcast i8* %195 to { i8*, i8* }*
  %197 = getelementptr { i8*, i8* }, { i8*, i8* }* %196, i64 0
  %198 = bitcast { i8*, i8* }* %197 to i8*
  store i64 %194, i64* %35
  %199 = bitcast i64* %35 to i8*
  %200 = insertvalue { i8*, i8* } { i8* getelementptr inbounds (%commonType, %commonType* @__go_tdn_int, i32 0, i32 0), i8* undef }, i8* %199, 1
  %201 = bitcast i8* %198 to { i8*, i8* }*
  store { i8*, i8* } %200, { i8*, i8* }* %201
  %202 = getelementptr inbounds i8, i8* %195, i64 0
  %203 = insertvalue { i8*, i64, i64 } undef, i8* %202, 0
  %204 = insertvalue { i8*, i64, i64 } %203, i64 1, 1
  %205 = insertvalue { i8*, i64, i64 } %204, i64 1, 2
  store { i8*, i64 } { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0), i64 4 }, { i8*, i64 }* %36
  %206 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %36, i32 0, i32 0
  %207 = load i8*, i8** %206
  %208 = getelementptr inbounds { i8*, i64 }, { i8*, i64 }* %36, i32 0, i32 1
  %209 = load i64, i64* %208
  store { i8*, i64, i64 } %205, { i8*, i64, i64 }* %37
  call void @fmt.Printf({ i64, { i8*, i8* } }* sret %38, i8* nest undef, i8* %207, i64 %209, { i8*, i64, i64 }* byval %37)
  %210 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %38, i32 0, i32 0
  %211 = load i64, i64* %210
  %212 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %38, i32 0, i32 1
  %213 = load { i8*, i8* }, { i8*, i8* }* %212
  %214 = add i64 %j15, 1
  br label %.24.for.loop

.23.for.done:                                     ; preds = %.24.for.loop
  store { i8*, i64, i64 } zeroinitializer, { i8*, i64, i64 }* %39
  call void @fmt.Println({ i64, { i8*, i8* } }* sret %40, i8* nest undef, { i8*, i64, i64 }* byval %39)
  %215 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %40, i32 0, i32 0
  %216 = load i64, i64* %215
  %217 = getelementptr inbounds { i64, { i8*, i8* } }, { i64, { i8*, i8* } }* %40, i32 0, i32 1
  %218 = load { i8*, i8* }, { i8*, i8* }* %217
  %219 = add i64 %i14, 1
  br label %.21.for.loop

.24.for.loop:                                     ; preds = %.22.for.body, %.19.for.body
  %j15 = phi i64 [ 0, %.19.for.body ], [ %214, %.22.for.body ]
  %220 = icmp slt i64 %j15, 6
  %221 = zext i1 %220 to i8
  %222 = trunc i8 %221 to i1
  br i1 %222, label %.22.for.body, label %.23.for.done
}

define internal void @14(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO* }*
  %2 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  br label %entry

entry:                                            ; preds = %prologue
  call void @"main.main:main.main$1"(i8* nest undef, %FIFO* %3)
  ret void
}

define internal void @"main.main:main.main$1"(i8* nest, %FIFO* %c) #1 {
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
  call void @fifo_write(%FIFO* %c, i64 %11)
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

define internal i8* @auto_pthread_wrapper(i8*) #1 {
entry:
  call void @14(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @15(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO* }*
  %2 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  br label %entry

entry:                                            ; preds = %prologue
  call void @"main.main:main.main$2"(i8* nest undef, %FIFO* %3)
  ret void
}

define internal void @"main.main:main.main$2"(i8* nest, %FIFO* %c) #1 {
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
  call void @fifo_write(%FIFO* %c, i64 %11)
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

define internal i8* @auto_pthread_wrapper.1(i8*) #1 {
entry:
  call void @15(i8* %0)
  call void @pthread_exit(i8* null)
  ret i8* null
}

define internal void @16(i8*) #1 {
prologue:
  %1 = bitcast i8* %0 to { %FIFO* }*
  %2 = getelementptr inbounds { %FIFO* }, { %FIFO* }* %1, i32 0, i32 0
  %3 = load %FIFO*, %FIFO** %2
  br label %entry

entry:                                            ; preds = %prologue
  call void @"main.main:main.main$3"(i8* nest undef, %FIFO* %3)
  ret void
}

define internal void @"main.main:main.main$3"(i8* nest, %FIFO* %c) #1 {
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
  call void @fifo_write(%FIFO* %c, i64 %11)
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

declare void @fmt.Printf({ i64, { i8*, i8* } }* sret, i8* nest, i8*, i64, { i8*, i64, i64 }* byval)

define void @__go_init_main(i8*) #1 {
entry:
  ret void
}

attributes #0 = { argmemonly nounwind }
attributes #1 = { "disable-tail-calls"="true" "split-stack" }
